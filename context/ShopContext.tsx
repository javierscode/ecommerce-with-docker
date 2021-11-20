import React from 'react'
import CartItem from '../intefaces/ cart'
import Product from '../intefaces/product'

const DEFAULT_STATE = {
  cart: [] as CartItem[],
  addProductToCart: (product: Product) => {},
  removeProductFromCart: (productId: string) => {},
  changeProductQuantityFromCart: (productId: string, quantity: number) => {},
}

const ShopContext = React.createContext(DEFAULT_STATE)

export default ShopContext
