import {
  CloseButton,
  Flex,
  Select,
  SelectProps,
  Link,
  useColorModeValue,
} from '@chakra-ui/react'
import * as React from 'react'
import CartItem from '../../intefaces/ cart'
import { CartProductMeta } from './CartProductMeta'
import { PriceTag } from './PriceTag'

interface CartItemProps extends CartItem {
  onChangeQuantity?: (quantity: number) => void
  onClickGiftWrapping?: () => void
  onClickDelete?: () => void
}

const QuantitySelect = (props: SelectProps) => {
  const { value}= props

  const allValues = Array(value).fill(0)
  return (
    <Select
      maxW="64px"
      aria-label="Select quantity"
      focusBorderColor={useColorModeValue('blue.500', 'blue.200')}
      {...props}
    >
      {allValues.map((_, index) => (
        <option key={index} value={index + 1}>
          {index + 1}
        </option>
      ))}
    </Select>
  )
}

export const CartItem = (props: CartItemProps) => {
  const {
    name,
    variantName,
    quantity,
    imageUrl,
    price,
    onChangeQuantity,
    onClickDelete,
  } = props

  return (
    <Flex
      direction={{ base: 'column', md: 'row' }}
      justify="space-between"
      align="center"
    >
      <CartProductMeta
        name={name}
        variantName={variantName || ''}
        image={imageUrl}
      />

      {/* Desktop */}
      <Flex
        width="full"
        justify="space-between"
        display={{ base: 'none', md: 'flex' }}
      >
        <QuantitySelect
          value={quantity}
          onChange={(e) => {
            onChangeQuantity?.(+e.currentTarget.value)
          }}
        />
        <PriceTag price={price} />
        <CloseButton
          aria-label={`Delete ${name} from cart`}
          onClick={onClickDelete}
        />
      </Flex>

      {/* Mobile */}
      <Flex
        mt="4"
        align="center"
        width="full"
        justify="space-between"
        display={{ base: 'flex', md: 'none' }}
      >
        <Link fontSize="sm" textDecor="underline">
          Delete
        </Link>
        <QuantitySelect
          value={quantity}
          onChange={(e) => {
            onChangeQuantity?.(+e.currentTarget.value)
          }}
        />
        <PriceTag price={price} />
      </Flex>
    </Flex>
  )
}
