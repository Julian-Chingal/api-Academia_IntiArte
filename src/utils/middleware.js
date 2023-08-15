const loginMiddleware = (req , res, next)=>{
    console.log('este es el intermediario')
    next() 
}

module.exports = {
    loginMiddleware
}