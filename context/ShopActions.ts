import CartItem from '../intefaces/ cart'
import Product from '../intefaces/product'

export const ADD_PRODUCT = 'ADD_PRODUCT'
export const CHANGE_QUANTITY = 'CHANGE_QUANTITY'
export const REMOVE_PRODUCT = 'REMOVE_PRODUCT'
export const INIT_CART = 'INIT_CART'

export type Action = {
  type: string
  payload: {
    product?: Product
    productId?: string
    quantity?: number
    initCart?: Array<CartItem>
  }
}
