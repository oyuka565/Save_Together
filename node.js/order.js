const pgp = require('pg-promise')();
// Database connection details;
const cn = {
    host: 'localhost', // 'localhost' is the default;
    port: 5432, // 5432 is the default;
    database: 'together',
    user: 'me',
    password: 'password',

    // to auto-exit on idle, without having to shut-down the pool;
    // see https://github.com/vitaly-t/pg-promise#library-de-initialization
    allowExitOnIdle: true
};
const db = pgp(cn); // database instance;

const Pool = require('pg').Pool
const pool = new Pool({
  user: 'me',
  host: 'localhost',
  database: 'together',
  password: 'password',
  port: 5432,
})

const getUserOrders = (request, response) => {
  const userid = request.params.id
  console.log(request.body) 
  console.log(userid) 
  pool.query(''+
  'SELECT "order_person"."Order_person_ID", "order_person"."User_ID", "order_person"."ProductID", '+
  '	  "order_person"."discount", "order_person"."quantity", "order_person"."grandTotal", '+
  '	  "Product"."prodcut_title" as product_title, "Product"."summary", "Product"."image_url", "Product"."current_order_qty",'+
  '	  "Product"."group_qty", '+
  '   CASE "order_person"."order_status" ' +
  '     WHEN 0 THEN $2  '+
  '     WHEN 1 THEN $3 '	+	
  '     WHEN 2 THEN $4		'+
  '     WHEN 3 THEN $5 '+
  '   END statusName '+
  'FROM "order_person" '+
  '	inner join "Product" on '+ 
  '		"order_person"."ProductID" = "Product"."ProductID" '+ 
  'WHERE "order_person"."User_ID" = $1' +
  'ORDER BY "Order_person_ID" DESC', [userid, "Захиалга дутуу", "Хямдрал биелсэн", "Хүргэлтэнд", "Хүргэгдсэн"], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

  const getOrderId = (request, response) => {
    const id = parseInt(request.params.id)
  
    pool.query('SELECT * FROM public."order_person" WHERE "Order_person_ID"  = $1', [id], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }


  async function createOrder  (request, response)  {
    try {
      const { User_ID,	ProductID, discount, quantity,	grandTotal} = request.body
      // console.log(request.body) 
      // Хэрэв захиалгын багц дүүрсэн бол 0, дүүрээгүй бол БАГЦЫН ДУГААР буцаана
      var groupID 

      db.tx(async t => {
          
      var sql =''+
      'SELECT CASE WHEN "order_group"."order_quantity" + 1 < "Product"."group_qty" THEN "Product"."current_order_group_ID" '+
      '        ELSE 0 END groupid '+
      'FROM "order_group" '+
      '	inner join "Product" on '+
      '		"order_group"."order_group_ID" = "Product"."current_order_group_ID" '+
      'WHERE "Product"."ProductID" = $1';
      const user = await t.one(sql, ProductID);
      return {user};}
      )
      .then(({user}) => {
        // print new user id + new event id;
        console.log('DATA:', user.rows[0].groupid);
    })
    .catch(error => {
        console.log('ERROR:', error); // print the error;
    });
      const res = await pool.query(sql, (error, results) => {
          if (error) {
              throw error
            }
            
           console.log('results =' +results) 
      })
      console.log('res =' +res) 
        
      groupID =rows[0].groupid
      console.log('groupID=' + groupID) 
      // Хэрэв захиалга дүүрсан бол
      if (groupID === 0) {
        console.log('Захиалга дүүрсэн') 
          // Групп захиалга руу бичилт нэмнэ
        pool.query('INSERT INTO "order_group" ("ProductID", "order_quantity") VALUES ($1,$2) RETURNING "order_group_ID"'
        , [ProductID, quantity],(error, results) => {
            if (error) {
                throw error
              }
              groupID = results.rows[0].order_group_ID;
        })
        console.log('new groupid =' +groupID) 
        // Product-н current_order_group_ID, current_order_qty-г шинэчилнэ  
        pool.query('UPDATE public."Product" SET ' +
        '  "current_order_qty" = 0, "current_order_group_ID" = $2 WHERE "ProductID" = $1' 
        , [ProductID, groupID], (error, results) => {
          if (error) {
            throw error
          }
        })
      }
      console.log('Insert order_person ') 
      pool.query('INSERT INTO public."order_person" '+
      '("User_ID", "ProductID", "order_status", '+
      ' "discount", "quantity",	"grandTotal",'+
      ' "order_group_ID", "createdAt") '+
      ' VALUES ($1, $2, 0,  ' +
      '         $3, $4, $5, '+
      '         $6, current_date)' ,
       [User_ID, ProductID, discount, quantity, grandTotal, groupID], (error, results) => {
        if (error) { 
          throw error
        }  
      })
   
      console.log('UPDATE public."Product" SET ') 
      pool.query('UPDATE public."Product" SET ' +
      '  "current_order_qty" = "current_order_qty" + $2 WHERE "ProductID" = $1' 
        , [ProductID, quantity], (error, results) => {
        if (error) {
          throw error
        }
      })
      console.log('UPDATE public."order_group" SET ProductID=' + ProductID +' groupID='+groupID +' quantity='+ quantity) 
      pool.query('UPDATE public."order_group" SET ' +
      '  "order_quantity" = "order_quantity" + $3 WHERE "ProductID" = $1 AND "order_group_ID" = $2 ' 
        , [ProductID, groupID, quantity], (error, results) => {
        if (error) {
          throw error
        }
      })
      response.status(200).send() //results.rows[0].ProductId)  

  } catch (err) {
      console.error(err.message)
  }
  }
  
  const updateOrder = (request, response) => {
    try{
      const { Order_person_ID, User_ID,	ProductID, order_status, discount, quantity, grandTotal} = request.body
      
      console.log(request.body) 
      console.log(ProductId) 
  
      var sql = 'UPDATE public."order_person" SET ' +
      '  "User_ID" = $1, "ProductID" = $2, "order_status" =$3,' +
      '	"discount" = $4, "quantity" = $5, "grandTotal" = $6, "updatedAt" = current_date  WHERE "Order_person_ID" = $7' 
  
      pool.query(sql
        , [User_ID,	ProductID, order_status, 
          discount, quantity, grandTotal, Order_person_ID], (error, results) => {
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

  const deleteOrder = (request, response) => {
    const id = parseInt(request.params.id)
  
    pool.query('DELETE FROM "order_person" WHERE id = $1', [id], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).send(`Order deleted with ID: ${id}`)
    })
  }
module.exports = {
    getUserOrders,
    getOrderId,
    createOrder,
    updateOrder,
    deleteOrder
  }