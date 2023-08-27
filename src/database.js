const {PrismaClient} = require('@prisma/client')
const prisma = new PrismaClient()

if (prisma) {
    console.log("Conexion exitosa")
}else{ 
    console.log("Conexion Fallida")
}

module.exports = prisma
