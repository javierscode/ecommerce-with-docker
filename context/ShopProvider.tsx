import React, { useReducer, useEffect, useState } from 'react'

import ShopContext from './ShopContext'
import cartReducer from './CartReducer'
import Product from '../intefaces/product'

import {
  ADD_PRODUCT,
  CHANGE_QUANTITY,
  INIT_CART,
  REMOVE_PRODUCT,
} from './ShopActions'
import CartItem from '../intefaces/ cart'
import { shippingFormData } from '../components/ShippingForm'
import { createConnection } from '../lib/db'

type ShopProviderProps = {
  children: React.ReactNode
}

const ShopProvider = ({ children }: ShopProviderProps) => {
  const [cartState, dispatch] = useReducer(cartReducer, [])
  const [cartInitiated, setCartInitiated] = useState(false)
  const [authorized, setAuthorized] = useState(false)

  useEffect(() => {
    if (window.localStorage.getItem('cart')) {
      const cart = JSON.parse(
        window.localStorage.getItem('cart') || '[]'
      ) as CartItem[]

      dispatch({
        type: INIT_CART,
        payload: {
          initCart: cart,
        },
      })
      setCartInitiated(true)
    }
  }, [])

  useEffect(() => {
    if (cartState !== []) {
      localStorage.setItem('cart', JSON.stringify(cartState))
    }
  }, [cartState])

  const addProductToCart = (product: Product) => {
    dispatch({ type: ADD_PRODUCT, payload: { product } })
  }

  const removeProductFromCart = (productId: string) => {
    dispatch({ type: REMOVE_PRODUCT, payload: { productId } })
  }

  const changeProductQuantityFromCart = (
    productId: string,
    quantity: number
  ) => {
    dispatch({ type: CHANGE_QUANTITY, payload: { productId, quantity } })
  }

  const sendOrder = async(data:shippingFormData) => {

    return Promise.resolve(fetch('http://localhost:3000/api/orders/add',{
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        customer: data,
        cart: cartState.map(product => ({
          productId: product.id,
          quantity: product.quantity
        }))
    })
    }))
  }

  const clearCart = () => {
    dispatch({ type: INIT_CART, payload: { initCart: [] } })
  }

  const login = async (user:string, password:string) => {

    const response = await fetch('http://localhost:3000/api/users/login',{
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        user,
        password
    })
    })

    if (response.ok) {
      setAuthorized(true)
    }

    return response
    
  }

  return (
    <ShopContext.Provider
      value={{
        cart: cartState,
        addProductToCart,
        removeProductFromCart,
        changeProductQuantityFromCart,
        cartInitiated,
        sendOrder,
        clearCart,
        login,
        authorized
      }}
    >
      {children}
    </ShopContext.Provider>
  )
}

export default ShopProvider
