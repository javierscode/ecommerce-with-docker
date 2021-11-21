// HOC/withAuth.jsx
import { NextPage } from 'next'
import { useRouter } from 'next/router'
import { useContext, useEffect, useState } from 'react'
import ShopContext from '../context/ShopContext'
import CartItem from '../intefaces/ cart'

export function withCart<P>(Page: NextPage<P>) {
  return function WrappedPage(props: P) {
    const Router = useRouter()
    const { cart, cartInitiated } = useContext(ShopContext)

    const [renderPage, setRenderPage] = useState(false)

    useEffect(() => {
      if (cart.length == 0 && cartInitiated) {
        Router.replace('/')
      }
      if (cart.length > 0 && cartInitiated) {
        setRenderPage(true)
      }
    }, [Router, cart.length, cartInitiated])

    return renderPage ? <Page {...props} /> : null
  }
}
