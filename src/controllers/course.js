const DBconnection = require("../database");


function getcourse(req,res){
    const query = `SELECT COURSE.NAME_COURSE, COURSE.DESCRIPTION_CO , PERSON.NAME_PERSON, PERSON.LASTNAME, DOCENT.SPECIALITY 
    FROM DOCENT
    INNER JOIN COURSE
    ON COURSE.FK_IDDOCENT = DOCENT.IDDOCENT
    INNER JOIN PERSON
    ON PERSON.IDPERSON = DOCENT.FK_IDPERSON
    ORDER BY PERSON.IDPERSON ASC;`

    DBconnection.query(query, (err,rows,fields)=>{
        if (!err) {
            if(rows.length === 0){
                res.status(404).json({ msg: "Not Foud 😕" })
            }else {
                res.json(rows)
            }   
        }else{
            res.status(500).json({msg: "!Error"})
        }
    })
}

module.exports = {
    getcourse
}