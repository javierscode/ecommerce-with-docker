export default interface Product {
  id: string;
  categories: string[]
  name: string
  variantName?: string
  imageUrl: string
  price: number
  description: string
}
