import '../styles/globals.css'
import type { AppProps } from 'next/app'
import { ChakraProvider } from '@chakra-ui/react'
import Navigation from '../components/Navigation'
import ShopProvider from '../context/ShopProvider'

function MyApp({ Component, pageProps }: AppProps) {
  return (
    <ChakraProvider>
      <ShopProvider>
        <Navigation />
        <Component {...pageProps} />
      </ShopProvider>
    </ChakraProvider>
  )
}

export default MyApp
