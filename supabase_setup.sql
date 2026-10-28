-- =====================================================================
--  Configuración de la base de datos para el sitio de Catalina
--  Pégalo completo en Supabase -> SQL Editor -> New query -> Run
--  (se puede ejecutar más de una vez sin problema)
-- =====================================================================

-- 1) Tabla con los datos de cada foto
create table if not exists public.fotos (
  id          uuid primary key default gen_random_uuid(),
  created_at  timestamptz not null default now(),
  titulo      text not null,
  fecha       text not null,
  descripcion text not null default '',
  path        text not null,                       -- nombre del archivo en el almacenamiento
  subida_por  uuid default auth.uid()              -- quién la subió
);

alter table public.fotos enable row level security;

drop policy if exists "todos pueden ver las fotos" on public.fotos;
create policy "todos pueden ver las fotos"
  on public.fotos for select using (true);

drop policy if exists "solo logueados suben datos" on public.fotos;
create policy "solo logueados suben datos"
  on public.fotos for insert to authenticated with check (true);

drop policy if exists "solo logueados borran datos" on public.fotos;
create policy "solo logueados borran datos"
  on public.fotos for delete to authenticated using (auth.uid() = subida_por);

-- 2) Almacenamiento de las imágenes (público para verlas, máx. 5 MB, solo imágenes)
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('fotos', 'fotos', true, 5242880, array['image/jpeg', 'image/png', 'image/webp'])
on conflict (id) do update
  set public = true,
      file_size_limit = 5242880,
      allowed_mime_types = array['image/jpeg', 'image/png', 'image/webp'];

drop policy if exists "todos pueden ver los archivos" on storage.objects;
create policy "todos pueden ver los archivos"
  on storage.objects for select using (bucket_id = 'fotos');

drop policy if exists "solo logueados suben archivos" on storage.objects;
create policy "solo logueados suben archivos"
  on storage.objects for insert to authenticated with check (bucket_id = 'fotos');

drop policy if exists "solo logueados borran archivos" on storage.objects;
create policy "solo logueados borran archivos"
  on storage.objects for delete to authenticated
  using (bucket_id = 'fotos' and owner = auth.uid());
