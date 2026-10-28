# Para Catalina ♡

Sitio web con la carta, las 100 razones, la galería de fotos, las ideas de salidas y nuestra canción.

## Archivos

- `index.html`: la página
- `tailwind.css`: estilos (ya compilados, no hay que instalar nada)
- `cancion.mp3`: Embarrassed (이불킥), el botón verde que se puede mover por la pantalla

Los tres tienen que estar siempre en la misma carpeta.

## Subirlo gratis con GitHub Pages

1. Crea una cuenta en https://github.com y un repositorio nuevo (por ejemplo `para-catalina`).
   En el plan gratis, GitHub Pages solo funciona con repositorios **públicos**.
2. Sube este proyecto:
   ```bash
   git remote add origin https://github.com/TU-USUARIO/para-catalina.git
   git push -u origin main
   ```
   (o desde la web: *Add file → Upload files* y arrastra `index.html`, `tailwind.css`, `cancion.mp3` y `.nojekyll`)
3. En el repo: **Settings → Pages → Build and deployment → Source: Deploy from a branch**, rama `main`, carpeta `/ (root)` → **Save**.
4. En 1 o 2 minutos queda en: `https://TU-USUARIO.github.io/para-catalina/`

Ese link se lo mandas a Catalina por WhatsApp.

## Para actualizar algo

Cambias el archivo, y luego:

```bash
git add .
git commit -m "cambios"
git push
```

## Ojo con las fotos

Las fotos que se suben desde el botón "Subir Foto Nueva" se guardan solo en el navegador de ese dispositivo.
Si las subes desde tu celular, Catalina no las va a ver en el suyo.
Para que las vea ella, hay que poner las fotos dentro del repositorio (carpeta `fotos/`) y enlazarlas en `index.html`.
