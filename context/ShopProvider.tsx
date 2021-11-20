import React, { useReducer, useEffect } from 'react'

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

type ShopProviderProps = {
  children: React.ReactNode
}

const ShopProvider = ({ children }: ShopProviderProps) => {
  const [cartState, dispatch] = useReducer(cartReducer, [])

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

  return (
    <ShopContext.Provider
      value={{
        cart: cartState,
        addProductToCart,
        removeProductFromCart,
        changeProductQuantityFromCart,
      }}
    >
      {children}
    </ShopContext.Provider>
  )
}

export default ShopProvider
