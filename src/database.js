const mysql = require("mysql2");
const { DB_HOST, DB_USER, DB_PASS, DB_NAME } = require("./config");

const DBconnection = mysql.createPool({
  host: DB_HOST,
  user: DB_USER,
  password: DB_PASS,
  database: DB_NAME,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

DBconnection.getConnection(function (err) {
    if(err){
        console.log('Failed Connection')
        console.log(err)
    }else{
        console.log('successful connection DB')
    }
})

module.exports = DBconnection
