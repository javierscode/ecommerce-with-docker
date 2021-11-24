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
import { Order, OrderByDB } from '../intefaces/order'

type ShopProviderProps = {
  children: React.ReactNode
}

type User = {
  user: string
  password: string
  authorized: boolean
}

const ShopProvider = ({ children }: ShopProviderProps) => {
  const [cartState, dispatch] = useReducer(cartReducer, [])
  const [cartInitiated, setCartInitiated] = useState(false)
  const [user, setUser] = useState<User | null>(null)

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

  const sendOrder = async (data: shippingFormData) => {
    return Promise.resolve(
      fetch('http://localhost:3000/api/orders/add', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          customer: data,
          cart: cartState.map((product) => ({
            productId: product.id,
            quantity: product.quantity,
          })),
        }),
      })
    )
  }

  const clearCart = () => {
    dispatch({ type: INIT_CART, payload: { initCart: [] } })
  }

  const login = async (user: string, password: string) => {
    const response = await fetch('http://localhost:3000/api/users/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        user,
        password,
      }),
    })

    if (response.ok) {
      setUser({
        user,
        password,
        authorized: true,
      })
    }

    return response
  }

  const getOrders = async () => {
    const response = await fetch('http://localhost:3000/api/orders', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        user: user?.user,
        password: user?.password,
      }),
    })

    const ordersByDB = (await response.json()) as Array<OrderByDB>

    const Orders = [] as Array<Order>

    ordersByDB.forEach((order) => {
            const OrderIndex = Orders.findIndex( (orderItem) => orderItem.id === order.order_id)

      if (OrderIndex >= 0) {
        Orders[OrderIndex].products.push({
          name: order.name,
          variant_name: order.variant_name,
          description: order.description,
          image_url: order.image_url,
          price: order.price,
          quantity: order.quantity,
        })
      } else {
        Orders.push({
          id: order.order_id,
          date_created: order.date_created,
          customer_name: order.customer_name,
          customer_surname: order.customer_surname,
          customer_postal_code: order.customer_postal_code,
          customer_city: order.customer_city,
          products: [
            {
              name: order.name,
              variant_name: order.variant_name,
              description: order.description,
              image_url: order.image_url,
              price: order.price,
              quantity: order.quantity,
            },
          ],
        })
      }
    })

    return Orders
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
        authorized: user?.authorized ?? false,
        getOrders,
      }}
    >
      {children}
    </ShopContext.Provider>
  )
}

export default ShopProvider
