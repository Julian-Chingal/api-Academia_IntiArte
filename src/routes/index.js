const router = require('express').Router()
const {readdirSync} = require('fs');
const path = require('path');

// Obten la ruta del directorio actual de este archivo
const PATH_DIRECTORY = __dirname;

// router.use('course', require('./course'))

// Escanea el directorio en busca de archivos JavaScript
readdirSync(PATH_DIRECTORY)
  .filter(file => file !== 'index.js' && file.endsWith('.js'))
  .forEach(file => {
    const routeModule = require(path.join(PATH_DIRECTORY, file));
    const routeName = path.basename(file, '.js');
    router.use(`/${routeName}`, routeModule);
  });

module.exports = router
