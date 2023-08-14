const { query } = require('express')
const DbConnection = require('../databaseMysql')

// get
 const getUser = (req,res) =>{
    const query = "SELECT PERSON.IDPERSON, CONCAT(PERSON.NAME_PERSON, ' ', PERSON.LASTNAME) AS PERSON_NAME , PERSON.AGE, PERSON.TEL, PERSON.EMAIL FROM PERSON;"

    DbConnection.query(query, (err,rows,field)=>{
        if(!err){
            res.json({"person": rows})
        }else{
            res.status(500).json('!Error')
        }
    })
   
}

const createUser = (req,res)=> {
    
}
 module.exports = {
    getUser
 }