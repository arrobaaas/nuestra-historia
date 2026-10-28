// Conexión a la base de datos (Supabase). Ver README.md, paso 4.
// Estos dos datos son PÚBLICOS por diseño (van en la página). La seguridad la dan las reglas del archivo supabase_setup.sql.
// NUNCA pegues aquí la clave "service_role" ni la "secret".
window.CATALINA_CONFIG = {
  supabaseUrl: "",       // ej. "https://abcdefgh.supabase.co"
  supabaseAnonKey: ""    // la clave "anon" (empieza con eyJ...) o "publishable" (empieza con sb_publishable_...)
};
