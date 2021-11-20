import { NextApiHandler } from 'next'
import mockedProducts from '../../../lib/products.json'
export type mockedProductsType = typeof mockedProducts

const handler: NextApiHandler = async (req, res) => {

  const { id } = req.query

  if (!id) {
    res.status(400).json({})
    return
  }
  const product = mockedProducts.find((p) => p.id === parseInt(id as string))
  res.json(product)
}

export default handler
