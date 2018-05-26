const pessoas = require('../models/pessoas')

const index = async(connection, req, res) =>{
    const results = await pessoas.findAll(connection)
    res.render('pessoas/index', { pessoas: results})
}

const deleteOne = async(connection, req, res) =>{
    await pessoas.deleteOne(connection, req.params.id)
    res.redirect('/pessoas')
}

const createForm = (req, res) => {
    res.render('pessoas/create')
}

module.exports = {
    index,
    deleteOne,
    createForm
}