import {
  Box,
  Heading,
  Text,
  Image,
  useColorModeValue,
  Button,
  useToast,
} from '@chakra-ui/react'
import { useContext } from 'react'
import { FiShoppingCart } from 'react-icons/fi'
import ShopContext from '../../context/ShopContext'

import Product from '../../intefaces/product'
import ListOfTags from '../ListOfTags'

type ProductDetailsProps = {
  product: Product
}

const ProductDetails = ({ product }: ProductDetailsProps) => {
    
  const { addProductToCart } = useContext(ShopContext)
  const toast = useToast()

  const handleClick = () => {
    try {
      addProductToCart(product)
      toast({
        title: 'Producto añadido al carrito',
        description: product.name,
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
      marginTop={{ base: '1', md: '5' }}
      display="flex"
      flexDirection={{ base: 'column', md: 'row' }}
      justifyContent="space-between"
      gridGap={4}
    >
      <Box display="flex" flex="1" position="relative" alignItems="center">
        <Box
          width={{ base: '100%', md: '85%' }}
          height={{ base: '100%', md: '85%' }}
          zIndex="2"
          margin="auto"
        >
          <Image
            borderRadius="lg"
            src={product.imageUrl}
            alt="some good alt text"
            objectFit="contain"
            height="100%"
            margin="auto"
          />
        </Box>
        <Box zIndex="1" width="100%" position="absolute" height="100%">
          <Box
            bgGradient={useColorModeValue(
              'radial(teal.600 1px, transparent 1px)',
              'radial(teal.300 1px, transparent 1px)'
            )}
            backgroundSize="20px 20px"
            opacity="0.4"
            height="100%"
          />
        </Box>
      </Box>
      <Box
        display="flex"
        flex="1"
        flexDirection="column"
        justifyContent="center"
        marginTop={{ base: '3', md: '0' }}
        gridGap={4}
      >
        <Box>
          <ListOfTags tags={product.categories} />
          <Heading marginTop="1">{product.name}</Heading>
        </Box>
        <Text
          as="p"
          color={useColorModeValue('gray.700', 'gray.200')}
          fontSize="lg"
          textAlign="justify"
        >
          {product.description}
        </Text>
        <Button
          colorScheme="teal"
          rightIcon={<FiShoppingCart />}
          onClick={handleClick}
        >
          Añadir al carrito
        </Button>
      </Box>
    </Box>
  )
}

export default ProductDetails
