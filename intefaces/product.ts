export default interface Product {
  id: number
  categories: string[]
  name: string
  variantName?: string
  imageUrl: string
  price: number
  description: string
}
