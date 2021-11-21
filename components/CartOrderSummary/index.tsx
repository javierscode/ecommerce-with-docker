import {
  Button,
  Flex,
  Heading,
  Stack,
  Text,
  useColorModeValue as mode,
} from '@chakra-ui/react'
import { useContext, useMemo } from 'react'
import { FaArrowRight } from 'react-icons/fa'
import ShopContext from '../../context/ShopContext'
import CartItem from '../../intefaces/ cart'
import NextLink from 'next/link'

type OrderSummaryItemProps = {
  label: string
  value?: string
  children?: React.ReactNode
}

const OrderSummaryItem = (props: OrderSummaryItemProps) => {
  const { label, value, children } = props
  return (
    <Flex justify="space-between" fontSize="sm">
      <Text fontWeight="medium" color={mode('gray.600', 'gray.400')}>
        {label}
      </Text>
      {value ? <Text fontWeight="medium">{value}</Text> : children}
    </Flex>
  )
}

const getTotalPrice = (cart: Array<CartItem>) => {
  return (
    Math.round(
      cart.reduce((acc, item) => acc + item.price * item.quantity, 0) * 100
    ) / 100
  )
}

const getTaxes = (cart: Array<CartItem>, percentage: number) => {
  return Math.round(getTotalPrice(cart) * percentage * 100) / 100
}

type CartOrderSummaryProps = {
  disableCheckout?: boolean
}

export const CartOrderSummary = ({
  disableCheckout,
}: CartOrderSummaryProps) => {
  const { cart } = useContext(ShopContext)

  const totalPrice = useMemo(() => getTotalPrice(cart), [cart])

  const totalTaxes = useMemo(() => getTaxes(cart, 0.21), [cart])

  return (
    <Stack spacing="8" borderWidth="1px" rounded="lg" padding="8" width="full">
      <Heading size="md">Resumen del pedido</Heading>

      <Stack spacing="6">
        <OrderSummaryItem label="Subtotal" value={totalPrice + '€'} />
        <OrderSummaryItem label="Impuestos" value={totalTaxes + '€'} />
        <Flex justify="space-between">
          <Text fontSize="lg" fontWeight="semibold">
            Total
          </Text>
          <Text fontSize="xl" fontWeight="extrabold">
            {Math.round((totalPrice + totalTaxes) * 100) / 100}€
          </Text>
        </Flex>
      </Stack>
      {!disableCheckout && <NextLink href="/checkout" passHref>
        <Button
          as={'a'}
          colorScheme="blue"
          size="lg"
          fontSize="md"
          rightIcon={<FaArrowRight />}
          disabled={cart.length === 0}
          pointerEvents={cart.length === 0 ? 'none' : 'auto'}
        >
          Tramitar pedido
        </Button>
      </NextLink>}
    </Stack>
  )
}
