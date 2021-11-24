import { NextApiHandler } from "next";
import Product from '../../../intefaces/product'
import { createConnection } from '../../../lib/db'

type productsFromDb = {
  id: string
  name: string
  description: string
  image_url: string
  price: number
  category: string
}

const handler: NextApiHandler = async (req, res) => {
  const db = await createConnection()

  const category = req.query.category as string;

  const query = `
  SELECT p.id, p.name, p.description, p.image_url, p.price, c.name as category
  FROM Products_Categories pc
  JOIN Products p ON pc.product_id = p.id
  JOIN Categories c ON pc.category_id = c.id
  ORDER BY p.id;`

  const [products] = await db.query(query)

  const productsFromDb = products as Array<productsFromDb>

  const productsToReturn: Array<Product> = productsFromDb.reduce(
    (acc, product) => {
      const productFinded = acc.find((p) => p.id === product.id)

      if (productFinded) {
        productFinded.categories.push(product.category)
      } else {
        acc.push({
          id: product.id,
          name: product.name,
          description: product.description,
          imageUrl: product.image_url,
          price: product.price,
          categories: [product.category],
        })
      }

      return acc
    },
    [] as Array<Product>
  )
  
  res.json(category ? productsToReturn.filter((product) => product.categories.includes(category)) : productsToReturn)
}

export default handler