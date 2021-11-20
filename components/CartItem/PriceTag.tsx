import {
  HStack,
  Text,
  TextProps,
  useColorModeValue as mode,
} from '@chakra-ui/react'
import * as React from 'react'

interface PriceTagProps {
  price: number
}

export type FormatPriceOptions = { locale?: string; currency?: string }

export const PriceTag = (props: PriceTagProps) => {
  const { price } = props
  return (
    <HStack spacing="1">
      <Price>{price + '€'}</Price>
    </HStack>
  )
}

interface PriceProps {
  children?: React.ReactNode
  isOnSale?: boolean
  textProps?: TextProps
}

const Price = (props: PriceProps) => {
  const { isOnSale, children, textProps } = props
  const defaultColor = mode('gray.700', 'gray.400')
  const onSaleColor = mode('gray.400', 'gray.700')
  const color = isOnSale ? onSaleColor : defaultColor
  return (
    <Text
      as="span"
      fontWeight="medium"
      color={color}
      textDecoration={isOnSale ? 'line-through' : 'none'}
      {...textProps}
    >
      {children}
    </Text>
  )
}

const SalePrice = (props: TextProps) => (
  <Text
    as="span"
    fontWeight="semibold"
    color={mode('gray.800', 'gray.100')}
    {...props}
  />
)
