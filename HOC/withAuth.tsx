

// HOC/withAuth.jsx
import { NextPage } from 'next'
import { useRouter } from 'next/router'
import { useContext, useEffect, useState } from 'react'
import ShopContext from '../context/ShopContext'


export function withAuth<P>(Page: NextPage<P>) {
  return function WrappedPage(props: P) {
    const Router = useRouter()
    const { authorized } = useContext(ShopContext)

    const [renderPage, setRenderPage] = useState(false)

    useEffect(() => {
        if (authorized) {
            setRenderPage(true)
        } else {
            Router.replace('/login')
        }
    }, [authorized, Router])

    return renderPage ? <Page {...props} /> : null
  }
}
