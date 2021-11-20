import {
  Box,
  Image,
  Stack,
  Text,
  useColorModeValue as mode,
} from '@chakra-ui/react'
import * as React from 'react'

export type CartProductMetaProps = {
  name: string
  variantName: string | null
  image: string
}

export const CartProductMeta = (props: CartProductMetaProps) => {
  const { image, name, variantName } = props
  return (
    <Stack direction="row" spacing="5" width="full">
      <Image
        rounded="lg"
        width="120px"
        height="120px"
        fit="cover"
        src={image}
        alt={name}
        draggable="false"
        loading="lazy"
      />
      <Box pt="4">
        <Stack spacing="0.5">
          <Text fontWeight="medium">{name}</Text>
          {variantName && (
            <Text color={mode('gray.600', 'gray.400')} fontSize="sm">
              {variantName}
            </Text>
          )}
        </Stack>
      </Box>
    </Stack>
  )
}
