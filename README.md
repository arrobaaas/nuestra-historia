# 💖 Nuestra Historia

**Una historia de amor digital: recuerdos, razones y planes.**

[![Live Demo](https://img.shields.io/badge/Demo-Online-22c55e?style=for-the-badge)](https://arrobaaas.github.io/nuestra-historia/)

## ✨ Sobre el proyecto

**Nuestra Historia** es una aplicación web personal creada como un homenaje digital a mi pareja: una carta, las 100 razones de nuestro amor, la galería de fotos compartida, las ideas de salidas y nuestra canción favorita.

Nació como un gesto romántico, pero está construida con tecnologías y prácticas reales del desarrollo de software:

- **Frontend**: HTML5 semántico, Tailwind CSS y JavaScript en vanilla.
- **Backend**: Supabase (PostgreSQL + Autenticación + Storage + API REST).
- **Seguridad**: Row Level Security (RLS) y políticas de acceso.
- **Infra**: GitHub Pages + GitHub Actions.

## ✨ Características

- 📜 **Carta y las 100 razones de amor** con buscador y filtros por categorías.
- 📸 **Galería de fotos compartida** con autenticación, subida y borrado de imágenes.
- 🗺️ **Ideas de salidas** con tarjetas interactivas y randomizer.
- 🎵 **Música** de nuestra historia.
- 🎉 **Experiencias visuales**: confeti y animaciones.

## 🛠️ Tecnologías

| Área | Tecnologías |
|---|---|
| Frontend | HTML5, Tailwind CSS, JavaScript (ES6+) |
| Backend / Base de datos | Supabase (PostgreSQL, Auth, Storage, REST API) |
| CI/CD | GitHub Actions |
| Hosting | GitHub Pages |
| Seguridad | RLS, XSS-safe rendering, JWT / anon key |

## 🔐 Seguridad

- No se exponen claves secretas en el frontend; solo la clave *anon/publishable*.
- RLS habilitado en la tabla `fotos`.
- Políticas de lectura pública y escritura/borrado autenticado.
- Borrado restringido al propietario (`auth.uid() = subida_por`).
- Renderizado seguro contra XSS (`escapeHtml`).

## 🚀 Despliegue

- Hosting: GitHub Pages desde rama `main`.
- CI: GitHub Actions (`mantener-activo.yml`) para mantener activa la base de datos gratuita.

## 📌 Demo en vivo

**https://arrobaaas.github.io/nuestra-historia/**

## 👤 Autor

**Nicolás** — para Catalina ♡
