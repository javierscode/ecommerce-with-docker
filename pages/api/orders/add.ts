import { ResultSetHeader } from 'mysql2'
import { NextApiHandler } from 'next'
import { shippingFormData } from '../../../components/ShippingForm'
import { createConnection } from '../../../lib/db'

type cartInfo = {
  productId: number
  quantity: number
}

type postedInfo = {
  customer: shippingFormData
  cart: Array<cartInfo>
}

const handler: NextApiHandler = async (req, res) => {
  if (req.method === 'POST') {
    const db = await createConnection()

    const { customer, cart } = req.body as postedInfo

    const orderQuery = `
    INSERT INTO Orders (
        date_created,
        customer_name,
        customer_surname,
        customer_address,
        customer_postal_code,
        customer_city
        ) VALUES (
        NOW(),
        "${customer.name}",
        "${customer.surname}",
        "${customer.adress}",
        "${customer.postalCode}",
        "${customer.city}"
        )
    `

    const [order] = await db.query(orderQuery)

    const result = order as ResultSetHeader

    const OrderId = result.insertId

    const cartQuery = (cart: cartInfo) => `
    INSERT INTO Carts (product_id, quantity) VALUES ("${cart.productId}","${cart.quantity}")
    `

    const cartsIds = await Promise.all(
      cart.map(async (item) => {
        const query = cartQuery(item)
        const [cart] = await db.query(query)
        const cartResult = cart as ResultSetHeader

        return cartResult.insertId
      })
    )

    const orderCartsQueryFistLines = `
    INSERT INTO Orders_Carts (
        order_id,
        cart_id
        ) VALUES
    `
    const ordersCartsQueryValues = cartsIds.map(
      (id) => `("${OrderId}", "${id}")`
    )

    const orderCartsQuery = `${orderCartsQueryFistLines} ${ordersCartsQueryValues.join(
      ','
    )}`

    await db.query(orderCartsQuery)

    res.status(200).json({
      message: 'Order created',
    })
  } else {
    res.status(405).json({ message: 'Method not allowed' })
  }
}

export default handler
