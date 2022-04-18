const Pool = require('pg').Pool
const pool = new Pool({
  user: 'me',
  host: 'localhost',
  database: 'api',
  password: 'sa',
  port: 5432,
})

const getProd = (request, response) => {
  pool.query('SELECT * FROM public."Product" ORDER BY "ProductID" ASC', (error, results) => {
<<<<<<< HEAD
=======
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const getProdById = (request, response) => {
  const id = parseInt(request.params.id)

  pool.query('SELECT * FROM public."Product" WHERE "ProductID"  = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const createProd = (request, response) => {
  try {
    const { User_ID,	prodcut_title, metaTitle,
      summary,	product_price, discount,
      quantity,	group_qty, status,
      content,	serial_no, image_url } = request.body
    
      console.log(request.body) 

    pool.query('INSERT INTO public."Product" ("User_ID",	"prodcut_title", "metaTitle","summary",	"product_price", "discount", "quantity",	"group_qty", "status", "content",	"serial_no", "image_url", "current_order_qty","createdAt") VALUES ($1, $2, $3, ' +
    '           $4, $5, $6, ' +
    '           $7, $8, $9, ' +
    '           $10, $11, $12, 0, current_date)', [User_ID,	prodcut_title, metaTitle,
      summary,	product_price, discount,
      quantity,	group_qty, status,
      content,	serial_no, image_url], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).send() //results.rows[0].ProductId)    
    })
} catch (err) {
    console.error(err.message)
}
}

const updateProd = (request, response) => {
  try{
    const {ProductId, User_ID,	prodcut_title, metaTitle,
      summary,	product_price, discount,
      quantity,	group_qty, status,
      content,	serial_no, image_url } = request.body
    
    console.log(request.body) 
    console.log(ProductId) 

    var sql = 'UPDATE public."Product" SET ' +
    '  "User_ID" = $1,	"prodcut_title" = $2, "metaTitle" =$3,' +
    '	"summary" = $4,	"product_price" = $5, "discount" = $6,' +
    '	"quantity" = $7,	"group_qty" = $8, "status" = $9,	' +
    '  "content" = $10,	"serial_no" = $11, "image_url" = $12, "updatedAt" = current_date  WHERE "ProductID" = $13' 

    pool.query(sql
      , [User_ID,	prodcut_title, metaTitle,
      summary,	product_price, discount,
      quantity,	group_qty, status,
      content,	serial_no, image_url, ProductId], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200)
    })
}
  catch (err) {
    console.error(err.message)
}
}

const getCategory = (request, response) => {
  pool.query('SELECT * FROM public."Category"', (error, results) => {
>>>>>>> 659d1200e97fb5258203acc7f3d5b05d8706d57b
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const getUsers = (request, response) => {
    pool.query('SELECT * FROM users ORDER BY id ASC', (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }

  const getUserById = (request, response) => {
    const id = parseInt(request.params.id)
  
    pool.query('SELECT * FROM users WHERE id = $1', [id], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }

  const createUser = (request, response) => {
    const { name, email } = request.body
  
    pool.query('INSERT INTO users (name, email) VALUES ($1, $2)', [name, email], (error, results) => {
      if (error) {
        throw error
      }
      response.status(201).send(`User added with ID: ${result.insertId}`)
    })
  }

  const updateUser = (request, response) => {
    const id = parseInt(request.params.id)
    const { name, email } = request.body
  
    pool.query(
      'UPDATE users SET name = $1, email = $2 WHERE id = $3',
      [name, email, id],
      (error, results) => {
        if (error) {
          throw error
        }
        response.status(200).send(`User modified with ID: ${id}`)
      }
    )
  }

  const deleteUser = (request, response) => {
    const id = parseInt(request.params.id)
  
    pool.query('DELETE FROM users WHERE id = $1', [id], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).send(`User deleted with ID: ${id}`)
    })
  }

  module.exports = {
    getProd,
    getProdById,
    createProd,
    updateProd,
    getCategory,
    getUsers,
    getUserById,
    createUser,
    updateUser,
    deleteUser,
  }