import { useContext } from 'react'
import {
  Box,
  Flex,
  Button,
  useColorModeValue,
  Stack,
  useColorMode,
  Badge,
} from '@chakra-ui/react'
import { MoonIcon, SunIcon } from '@chakra-ui/icons'
import { FiShoppingCart } from 'react-icons/fi'
import NextLink from 'next/link'
import ShopContext from '../../context/ShopContext'
import { getTotalQuantity } from '../../helpers'

export default function Nav() {
  const { colorMode, toggleColorMode } = useColorMode()

  const { cart } = useContext(ShopContext)

  return (
    <Box
      bg={useColorModeValue('gray.100', 'gray.900')}
      px={4}
      position="sticky"
      top={0}
      zIndex={1}
    >
      <Flex h={16} alignItems={'center'} justifyContent={'space-between'}>
        <NextLink href={'/'}>
          <a>Alternative Freshly Cosmetics</a>
        </NextLink>
        <Flex alignItems={'center'}>
          <Stack direction={'row'} spacing={7}>
            <Button onClick={toggleColorMode}>
              {colorMode === 'light' ? <MoonIcon /> : <SunIcon />}
            </Button>
            <NextLink href={'/cart'} passHref>
              <Button as="a">
                <FiShoppingCart />
                {cart.length > 0 && (
                  <Badge
                    size="md"
                    borderRadius="full"
                    paddingX={2}
                    paddingY={1}
                    position="absolute"
                    bottom={-1}
                    right="-1"
                    backgroundColor="red.500"
                    color="white"
                  >
                    {getTotalQuantity(cart)}
                  </Badge>
                )}
              </Button>
            </NextLink>
          </Stack>
        </Flex>
      </Flex>
    </Box>
  )
}
