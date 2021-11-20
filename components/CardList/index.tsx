import { Grid } from '@chakra-ui/layout'
import Product from '../../intefaces/product'
import Card from '../Card'

interface CardListProps {
  products: Array<Product>
}

const CardList = ({ products }: CardListProps) => (
  <Grid
    templateColumns="repeat(auto-fill, minmax(min(100%,15rem), 1fr))"
    gap={4}
  >
    {products.map((product, index) => (
      <Card
        key={index}
        id={product.id}
        description={product.description}
        categories={product.categories}
        imageUrl={product.imageUrl}
        name={product.name}
        price={product.price}
        variantName={product.variantName || undefined}
      />
    ))}
  </Grid>
)

export default CardList
