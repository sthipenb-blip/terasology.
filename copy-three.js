// Copia three.js (r128) dentro de www/ para que el juego funcione sin internet.
const fs = require('fs'), path = require('path');
const from = path.join(__dirname, 'node_modules', 'three', 'build', 'three.min.js');
const to = path.join(__dirname, 'www', 'three.min.js');
if (!fs.existsSync(from)) { console.error('Falta node_modules/three. Ejecuta: npm install'); process.exit(1); }
fs.copyFileSync(from, to);
console.log('three.min.js copiado a www/ (' + fs.statSync(to).size + ' bytes)');
