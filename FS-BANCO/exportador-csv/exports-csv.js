const mysql = require('mysql')

const connection = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: '',
    database: 'cadastro'
})

const fs = require('fs')
const writable  = fs.createWriteStream('pessoas.csv')
writable.write('id,nome\n', ()=>{
    connection.connect((err) =>{
        const query  = connection.query('select * from pessoas')
        query.on('result', (row) =>{
            connection.pause()
            const data = row.id+','+row.nome+'\n'
            setTimeout(()=>{
                writable.write(data, ()=>{
                    connection.resume()
                })
            },1)
        })
        query.on('end',() =>{
            connection.end()
            console.log('finished')
        })
    })  
})