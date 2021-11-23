import { useForm } from 'react-hook-form'
import React from 'react'
import {
  FormErrorMessage,
  FormLabel,
  FormControl,
  Input,
  Button,
  Stack,
  Flex,
  useToast,
} from '@chakra-ui/react'

export type LoginFormData = {
  user: string
  password: string
}

type LoginFormProps = {
  onSubmit: (data: LoginFormData) => void
}

const LoginForm = ({ onSubmit }: LoginFormProps) => {
  const {
    handleSubmit,
    register,
    formState: { errors, isSubmitting },
  } = useForm()

  const handleOnSubmit = handleSubmit(onSubmit)

  return (
    <form onSubmit={handleOnSubmit}>
      <FormControl isInvalid={errors.user}>
        <FormLabel>User</FormLabel>
        <Input
          id="user"
          placeholder="Usuario"
          type="text"
          {...register('user', {
            required: 'Es obligatorio',
          })}
        />
      </FormControl>
      <FormErrorMessage>{errors.user && errors.user.message}</FormErrorMessage>
      <FormControl isInvalid={errors.pasword}>
        <FormLabel>Password</FormLabel>
        <Input
          id="password"
          placeholder="Contraseña"
          type="password"
          {...register('password', {
            required: 'Es obligatorio',
          })}
        />
      </FormControl>
      <FormErrorMessage>
        {errors.password && errors.password.message}
      </FormErrorMessage>
      <Stack spacing={10} pt={2}>
        <Button
          bg={'teal.400'}
          color={'white'}
          _hover={{
            bg: 'teal.500',
          }}
          type="submit"
        >
          Iniciar sesión
        </Button>
      </Stack>
    </form>
  )
}

export default LoginForm
