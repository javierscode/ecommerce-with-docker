import {
  Flex,
  Box,
  Image,
  Badge,
  useColorModeValue,
  useToast,
  Text,
  Button,
} from '@chakra-ui/react'
import { useContext } from 'react'
import { FiShoppingCart } from 'react-icons/fi'
import ShopContext from '../../context/ShopContext'
import Product from '../../intefaces/product'
import NextLink from 'next/link'
import ListOfTags from '../ListOfTags'

function Card(props: Product) {
  const toast = useToast()
  const { addProductToCart } = useContext(ShopContext)

  const { imageUrl, categories, name, variantName, price } = props

  const handleClick = () => {
    try {
      addProductToCart(props)
      toast({
        title: 'Producto añadido al carrito',
        description: name,
        status: 'success',
        duration: 5000,
        isClosable: true,
        position: 'bottom-right',
      })
    } catch (error) {
      toast({
        title: 'Error',
        description: 'No se ha podido añadir el producto al carrito',
        status: 'error',
        duration: 5000,
        isClosable: true,
        position: 'bottom-right',
      })
    }
  }
  return (
    <Box
      bg={useColorModeValue('white', 'gray.800')}
      maxW="sm"
      borderWidth="1px"
      rounded="lg"
      shadow="lg"
    >
      {' '}
      <NextLink href="/product/[id]" as={`/product/${props.id}`}>
        <a>
        <Image src={imageUrl} alt={`Picture of ${name}`} roundedTop="lg" />
        <Box p="6">
          <ListOfTags tags={categories} />
          <Flex mt="1" justifyContent="space-between" alignContent="center">
            <Box
              fontSize="lg"
              fontWeight="semibold"
              as="h4"
              lineHeight="tight"
              isTruncated
            >
              {name}
            </Box>
          </Flex>
          <Flex justifyContent="space-between" alignItems="baseline">
            {variantName && <Text>{variantName}</Text>}
            <Box
              fontSize="2xl"
              color={useColorModeValue('gray.800', 'white')}
              marginLeft="auto"
            >
              {price.toFixed(2)}
              <Box as="span" color={'gray.600'} fontSize="lg">
                €
              </Box>
            </Box>
          </Flex>
        </Box>
        </a>
      </NextLink>
      <Button
        roundedTop="none"
        w="100%"
        rightIcon={<FiShoppingCart />}
        onClick={handleClick}
        colorScheme="teal"
      >
        Añadir al carrito
      </Button>
    </Box>
  )
}

export default Card
