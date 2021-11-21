import { NextApiHandler } from 'next'
import { createConnection } from '../../../lib/db'


const handler: NextApiHandler = async (req, res) => {
  const db = await createConnection()

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
