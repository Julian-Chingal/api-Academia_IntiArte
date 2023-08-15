require('dotenv').config()

module.exports = {
    DB_HOST: process.env.DB_HOST || "localhost",
    DB_USER: process.env.DB_USER || "root",
    DB_PASS: process.env.DB_PASS || "root",
    DB_NAME: process.env.DB_NAME || "academia",
    PORT: process.env.PORT || 3000
    // DB_URL_SUPABASE: process.env.DB_URL_SUPABASE,
    // DB_KEY_SUPABASE: process.env.DB_KEY_SUPABASE
}