import { Container, Heading } from '@chakra-ui/react'
import { GetServerSideProps } from 'next'
import CardList from '../../components/CardList'
import ProductDetails from '../../components/PorductDetails'
import Product from '../../intefaces/product'

type ProductPageProps = {
  product: Product
  relatedProducts: Product[]
}

const ProductPage = ({ product, relatedProducts }: ProductPageProps) => {
  console.log(product)
  console.log(relatedProducts)

  return (
    <Container
      maxW="container.xl"
      display="flex"
      flexDirection="column"
      gridGap={4}
      pt={4}
      pb={8}
    >
      <ProductDetails product={product} />
      <Heading as="h2" size="lg" my={4}>
        Te podría interesar
      </Heading>
      <CardList products={relatedProducts} />
    </Container>
  )
}

export const getServerSideProps: GetServerSideProps = async (context) => {
  const { id } = context.query

  const response = await fetch(`http://localhost:3000/api/products/${id}`)

  const product: Product = await response.json()

  const responseRelatedProducts = await fetch(
    `http://localhost:3000/api/products?category=${product.categories[0]}`
  )

  const relatedProducts: Product[] = await responseRelatedProducts.json()

  return {
    props: {
      product,
      relatedProducts: relatedProducts
        .filter((p) => p.id !== product.id)
        .slice(0, 4),
    },
  }
}

export default ProductPage
