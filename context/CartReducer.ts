import CartItem from '../intefaces/ cart'
import Product from '../intefaces/product'
import {
  Action,
  ADD_PRODUCT,
  REMOVE_PRODUCT,
  INIT_CART,
  CHANGE_QUANTITY,
} from './ShopActions'

const addProductToCart = (product: Product, state: CartItem[]) => {
  const updatedCart = [...state]
  const updatedItemIndex = updatedCart.findIndex(
    (item) => item.id === product.id
  )

  if (updatedItemIndex < 0) {
    updatedCart.push({ ...product, quantity: 1 })
  } else {
    const updatedItem = {
      ...updatedCart[updatedItemIndex],
    }
    updatedItem.quantity++
    updatedCart[updatedItemIndex] = updatedItem
  }
  return updatedCart
}

const removeProductFromCart = (productId: string, state: CartItem[]) => {
  return state.filter((item) => item.id !== productId)
}

const changeProductQuantityFromCart = (
  productId: string,
  quantity: number,
  state: CartItem[]
) => {
  const updatedCart = [...state]
  const updatedItemIndex = updatedCart.findIndex(
    (item) => item.id === productId
  )
  const updatedItem = {
    ...updatedCart[updatedItemIndex],
  }
  updatedItem.quantity = quantity
  if (updatedItem.quantity <= 0) {
    updatedCart.splice(updatedItemIndex, 1)
  } else {
    updatedCart[updatedItemIndex] = updatedItem
  }

  return updatedCart
}

const cartReducer = (state: CartItem[], action: Action) => {
  switch (action.type) {
    case INIT_CART:
      return action.payload.initCart as CartItem[]

    case ADD_PRODUCT:
      const productToAdd = action.payload.product as Product
      return addProductToCart(productToAdd, state)

    case REMOVE_PRODUCT:
      const productIdToRemove = action.payload.productId as string
      return removeProductFromCart(productIdToRemove, state)

    case CHANGE_QUANTITY:
      const productIdToChange = action.payload.productId as string
      const quantity = action.payload.quantity as number
      return changeProductQuantityFromCart(productIdToChange, quantity, state)

    default:
      return state
  }
}

export default cartReducer
