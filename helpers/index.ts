import CartItem from '../intefaces/ cart'
import Product from '../intefaces/product'

export const getAllAvailableCategories = (products: Array<Product>) => {
  const categories: Array<string> = []

  products.forEach((product) => {
    product.categories.forEach((category) => {
      if (!categories.includes(category)) {
        categories.push(category)
      }
    })
  })

  return categories
}

export const getTotalQuantity = (cart: Array<CartItem>) => {
  let total = 0
  cart.forEach((item) => {
    total += item.quantity
  })
  return total
}
