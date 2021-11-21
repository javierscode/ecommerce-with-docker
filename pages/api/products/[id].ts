import { NextApiHandler } from 'next'
import Product from '../../../intefaces/product'
import { createConnection } from '../../../lib/db'

type productsFromDb = {
  id: number
  name: string
  description: string
  image_url: string
  price: number
  category: string
}

const handler: NextApiHandler = async (req, res) => {
  const db = await createConnection()

  const { id } = req.query

  const query = `
  SELECT p.id, p.name, p.description, p.image_url, p.price, c.name as category
  FROM Products_Categories pc
  JOIN Products p ON pc.product_id = p.id
  JOIN Categories c ON pc.category_id = c.id
  WHERE p.id = ${id}
  ORDER BY p.id;`

  const [products] = await db.query(query)

  const productsFromDb = products as Array<productsFromDb>

  const productToReturn: Product = productsFromDb.reduce(
    (acc, product) => {

      const sameProduct = acc.id === product.id

      if (sameProduct) {
        acc.categories.push(product.category)
      } else {
        return{
          id: product.id,
          name: product.name,
          description: product.description,
          imageUrl: product.image_url,
          price: product.price,
          categories: [product.category],
        }
      }

      return acc
    },
    {}as Product
  )

  res.json(productToReturn)
}

export default handler
