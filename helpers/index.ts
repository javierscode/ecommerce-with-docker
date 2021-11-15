import { mockedProductsType } from "../pages/api/get-products"

export const getAllAvailableCategories = (products: mockedProductsType) => {
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
