# Para Catalina ♡

Sitio con la carta, las 100 razones, la galería de fotos, las ideas de salidas y nuestra canción.

## Archivos

| Archivo | Para qué sirve |
|---|---|
| `index.html` | la página |
| `tailwind.css` | estilos (ya compilados) |
| `cancion.mp3` | Embarrassed (이불킥) |
| `config.js` | **aquí se pegan los datos de la base de datos (paso 4)** |
| `supabase_setup.sql` | crea la tabla y los permisos de las fotos (paso 2) |
| `.github/workflows/mantener-activo.yml` | evita que la base de datos gratis se pause |

## Cómo funciona la galería

Las fotos no pueden guardarse dentro de GitHub Pages (es un hosting "de solo lectura"), así que se guardan en **Supabase**, un servicio gratis que da:

- **Almacenamiento** para las imágenes (1 GB gratis; la página achica cada foto a ~150 KB antes de subirla, entran miles).
- **Base de datos** con el título, fecha y descripción de cada foto.
- **Cuentas**: cualquiera que tenga el link **puede ver** las fotos, pero solo las 2 cuentas que tú crees (la tuya y la de Catalina) **pueden subir o borrar**.

## Paso a paso

### 1. Crear el proyecto
1. Entra a https://supabase.com → *Start your project* → crea una cuenta (con GitHub es lo más rápido). No pide tarjeta.
2. *New project*: ponle un nombre (ej. `catalina`), una contraseña para la base de datos (guárdala) y la región más cercana (South America / São Paulo).

### 2. Crear la tabla y los permisos
1. En el menú izquierdo: **SQL Editor → New query**.
2. Abre `supabase_setup.sql`, copia todo, pégalo y presiona **Run**. Debe decir *Success*.

### 3. Crear las 2 cuentas
1. **Authentication → Users → Add user → Create new user**.
2. Crea una con tu correo y otra con el de Catalina (cada una con su contraseña). Marca **Auto Confirm User**.
3. Para que nadie más pueda registrarse: en **Authentication** (sección de configuración de *Sign In / Providers* → *Email*) desactiva la opción de permitir nuevos registros (*Allow new users to sign up*).
   Los nombres de los menús de Supabase cambian de vez en cuando; si no encuentras algo, avísame.

### 4. Conectar la página
1. **Project Settings → API**: copia el **Project URL** y la clave **anon** (o **publishable**).
2. Pégalos en `config.js`:
   ```js
   window.CATALINA_CONFIG = {
     supabaseUrl: "https://abcdefgh.supabase.co",
     supabaseAnonKey: "eyJ..."
   };
   ```
   Esas dos son públicas a propósito; la seguridad la dan los permisos del paso 2. **Nunca** pegues la clave `service_role` ni la `secret`.

### 5. Subir a GitHub Pages
```bash
git add .
git commit -m "conecto la base de datos"
git push
```
(Si es la primera vez: crea un repo **público** en GitHub, `git remote add origin https://github.com/TU-USUARIO/para-catalina.git`, `git push -u origin main`, y en *Settings → Pages* elige la rama `main`, carpeta `/ (root)`.)

Queda en `https://TU-USUARIO.github.io/para-catalina/`.

### 6. Usarlo
En la pestaña **Fotos** → *Entrar para subir fotos* → correo y contraseña. Queda la sesión abierta en ese dispositivo. Desde ahí cada uno sube sus fotos y las ven los dos.

## Importante: la base de datos gratis se pausa

Supabase pausa los proyectos gratis que pasan **7 días sin actividad**. No se pierde nada, pero la galería deja de cargar hasta que lo reactives (botón *Restore* en el panel de Supabase).

Para evitarlo, el repo trae un aviso automático (`.github/workflows/mantener-activo.yml`) que consulta la base de datos 2 veces por semana. Funciona solo, sin configurar nada. Dos detalles:

- GitHub desactiva las tareas programadas de un repo si pasan ~60 días sin ningún cambio en él. Si pasa, en la pestaña *Actions* del repo se vuelven a activar con un clic.
- Que Catalina o tú abran la página también cuenta como actividad.

## Cambiar cosas

Modificas el archivo y `git add . && git commit -m "cambios" && git push`.
