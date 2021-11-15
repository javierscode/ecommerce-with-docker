import { Grid } from '@chakra-ui/layout'
import { mockedProductsType } from '../../pages/api/get-products'
import Card from '../Card'

interface CardListProps {
  products: mockedProductsType
}

const CardList = ({ products }: CardListProps) => (
  <Grid
    templateColumns="repeat(auto-fill, minmax(min(100%,15rem), 1fr))"
    gap={4}
  >
    {products.map((product, index) => (
      <Card
        key={index}
        categories={product.categories}
        image_url={product.image_url}
        name={product.name}
        price={product.price}
        variant_name={product.variant_name || undefined}
      />
    ))}
  </Grid>
)

export default CardList
