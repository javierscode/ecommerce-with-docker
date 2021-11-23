import React from 'react'
import { shippingFormData } from '../components/ShippingForm'
import CartItem from '../intefaces/ cart'
import { Order } from '../intefaces/order'
import Product from '../intefaces/product'

const DEFAULT_STATE = {
  cart: [] as CartItem[],
  addProductToCart: (product: Product) => {},
  removeProductFromCart: (productId: string) => {},
  changeProductQuantityFromCart: (productId: string, quantity: number) => {},
  cartInitiated: false,
  sendOrder: async(data: shippingFormData):Promise<Response> => { return new Promise((resolve, reject) => { resolve(new Response()) }) },
  clearCart: () => {},
  authorized: false,
  login: (user:string, password:string) :Promise<Response> => { return new Promise((resolve, reject) => { resolve(new Response()) }) },
  getOrders: async():Promise<Array<Order>> => { return new Promise((resolve, reject) => { resolve([]) }) },
}

const ShopContext = React.createContext(DEFAULT_STATE)

export default ShopContext
