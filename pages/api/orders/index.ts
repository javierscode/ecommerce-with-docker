import { RowDataPacket } from 'mysql2'
import { NextApiHandler } from 'next'
import { createConnection } from '../../../lib/db'

type postedInfo = {
  user: string
  password: string
}

const handler: NextApiHandler = async (req, res) => {

  if(req.method !== 'POST') {
    res.status(405).end(`Method ${req.method} Not Allowed`)
  }


   const db = await createConnection()

  const { user, password } = req.body as postedInfo

  const usersQuery = `
    SELECT * FROM Users
    WHERE username = '${user}'
    AND password = '${password}'
    `

  const [fields] = await db.query(usersQuery)

  const users = fields as RowDataPacket[]

  if(users.length === 0) {
    res.status(401).end('Unauthorized')
  }

  const query = `
  SELECT * FROM Orders
  LEFT JOIN Orders_Carts ON Orders.id = Orders_Carts.order_id
  LEFT JOIN Carts ON Orders_Carts.cart_id = Carts.id
  LEFT JOIN Products ON Carts.product_id = Products.id
  ORDER BY Orders.id`

  const [orders] = await db.query(query)

  res.json(orders)
}

export default handler
