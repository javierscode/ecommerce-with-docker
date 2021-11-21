import { useForm } from 'react-hook-form'
import React, { useContext } from 'react'
import {
  FormErrorMessage,
  FormLabel,
  FormControl,
  Input,
  Button,
  Flex,
  useToast,
} from '@chakra-ui/react'
import ShopContext from '../../context/ShopContext'
import { Router, useRouter } from 'next/router'

export type shippingFormData = {
  name: string
  surname: string
  adress: string
  postalCode: string
  city: string
}

type shippingFormProps = {
  onSubmit: (data: shippingFormData) => void
}

const ShippingForm = ({ onSubmit }: shippingFormProps) => {
  const {
    handleSubmit,
    register,
    formState: { errors, isSubmitting },
  } = useForm()

  const handleOnSubmit = handleSubmit(onSubmit)

  return (
    <form onSubmit={handleOnSubmit}>
      <Flex flexDirection="column" gridGap={5}>
        <Flex flexDirection={{ base: 'column', md: 'row' }} gridGap={5}>
          <FormControl isInvalid={errors.name}>
            <FormLabel htmlFor="name">Nombre*</FormLabel>
            <Input
              id="name"
              placeholder="Nombre"
              {...register('name', {
                required: 'Es obligatorio',
                minLength: {
                  value: 4,
                  message: 'la longitud mínima es de 4 caracteres',
                },
              })}
            />
            <FormErrorMessage>
              {errors.name && errors.name.message}
            </FormErrorMessage>
          </FormControl>
          <FormControl isInvalid={errors.surname}>
            <FormLabel htmlFor="surname">Apellidos*</FormLabel>
            <Input
              id="surname"
              placeholder="Apellidos"
              {...register('surname', {
                required: 'Es obligatorio',
                minLength: {
                  value: 4,
                  message: 'la longitud mínima es de 4 caracteres',
                },
              })}
            />
            <FormErrorMessage>
              {errors.surname && errors.surname.message}
            </FormErrorMessage>
          </FormControl>
        </Flex>
        <FormControl isInvalid={errors.adress}>
          <FormLabel htmlFor="adress">Dirección*</FormLabel>
          <Input
            id="adress"
            placeholder="Dirección"
            {...register('adress', {
              required: 'Es obligatorio',
              minLength: {
                value: 6,
                message: 'la longitud mínima es de 6 caracteres',
              },
            })}
          />
          <FormErrorMessage>
            {errors.adress && errors.adress.message}
          </FormErrorMessage>
        </FormControl>
        <Flex flexDirection={{ base: 'column', md: 'row' }} gridGap={5}>
          <FormControl isInvalid={errors.name}>
            <FormLabel htmlFor="postalCode">Código Postal*</FormLabel>
            <Input
              id="postalCode"
              placeholder="Código Postal"
              type="number"
              {...register('postalCode', {
                required: 'Es obligatorio',
                pattern: {
                  message: 'The postal code should be 5 numbers',
                  value: /^\d{5}$/,
                },
              })}
            />
            <FormErrorMessage>
              {errors.postalCode && errors.postalCode.message}
            </FormErrorMessage>
          </FormControl>
          <FormControl isInvalid={errors.surname}>
            <FormLabel htmlFor="city">Ciudad*</FormLabel>
            <Input
              id="city"
              placeholder="Ciudad"
              {...register('city', {
                required: 'Es obligatorio',
                minLength: {
                  value: 4,
                  message: 'la longitud mínima es de 4 caracteres',
                },
              })}
            />
            <FormErrorMessage>
              {errors.city && errors.city.message}
            </FormErrorMessage>
          </FormControl>
        </Flex>
        <Button
          mt={4}
          colorScheme="teal"
          isLoading={isSubmitting}
          type="submit"
        >
          Realizar el pedido
        </Button>
      </Flex>
    </form>
  )
}

export default ShippingForm
