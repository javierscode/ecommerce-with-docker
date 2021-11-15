import {
  Flex,
  Circle,
  Box,
  Image,
  Badge,
  useColorModeValue,
  Icon,
  chakra,
  Tooltip,
  Text,
} from '@chakra-ui/react'
import { FiShoppingCart } from 'react-icons/fi'


interface CardProps {
    categories: string[]
    name: string
    variant_name?: string
    image_url: string
    price: number
}

function Card({categories, name, variant_name, image_url, price}: CardProps) {
  return (
    <Box
      bg={useColorModeValue('white', 'gray.800')}
      maxW="sm"
      borderWidth="1px"
      rounded="lg"
      shadow="lg"
    >
      <Image
        src={image_url}
        alt={`Picture of ${name}`}
        roundedTop="lg"
      />
      <Box p="6">
        <Flex alignItems="baseline" gridGap={2}>
          {categories.map((category) => {
            return (
              <Badge
                variantColor="teal"
                variant="solid"
                rounded="full"
                px="2"
                py="1"
                key={category}
              >
                {category}
              </Badge>
            )
          })}
        </Flex>
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
          <Tooltip
            label="Add to cart"
            bg="white"
            placement={'top'}
            color={'gray.800'}
            fontSize={'1.2em'}
          >
            <chakra.a href={'#'} display={'flex'}>
              <Icon as={FiShoppingCart} h={7} w={7} alignSelf={'center'} />
            </chakra.a>
          </Tooltip>
        </Flex>
        <Flex justifyContent="space-between" alignItems="baseline">
          {variant_name && <Text>{variant_name}</Text>}
          <Box fontSize="2xl" color={useColorModeValue('gray.800', 'white')}>
            {price.toFixed(2)}
            <Box as="span" color={'gray.600'} fontSize="lg">
              €
            </Box>
          </Box>
        </Flex>
      </Box>
    </Box>
  )
}

export default Card
