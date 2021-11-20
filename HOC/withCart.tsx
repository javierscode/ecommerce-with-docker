// HOC/withAuth.jsx
import { NextPage } from 'next'
import { useRouter } from 'next/router'
import { useContext } from 'react'
import ShopContext from '../context/ShopContext'

export function withCart<P>(Page: NextPage<P>) {
  return function WrappedPage(props: P) {
    const Router = useRouter()
    const { cart } = useContext(ShopContext)

    if (typeof window !== 'undefined') {
      // If there is no product in the shopping cart we redirect to "/" page.
      if (cart.length === 0) {
        Router.replace('/')
        return null
      }
      // If we have any product in the shopping cart we just render the component that was passed with all its props
      return <Page {...props} />
    }

    // If we are on server, return null
    return null
  }
}
