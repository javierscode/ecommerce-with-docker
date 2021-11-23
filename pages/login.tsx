import {
  Flex,
  Box,
  FormControl,
  FormLabel,
  Input,
  Checkbox,
  Stack,
  Link,
  Button,
  Heading,
  Text,
  useColorModeValue,
  useToast,
} from '@chakra-ui/react'
import { useRouter } from 'next/router'
import { useContext } from 'react'
import LoginForm, { LoginFormData } from '../components/LoginForm'
import ShopContext from '../context/ShopContext'

const Login = () => {
  const { login } = useContext(ShopContext)
  const toast = useToast()
  const Router = useRouter()

  const onSubmit = async (data: LoginFormData) => {
    try {
      const { user, password } = data
      console.log(user, password);
      
      const response = await login(user, password)

      if (!response.ok) {
        throw new Error('Error sending order')
      }
      Router.push('/admin')
    } catch (e) {
      toast({
        title: 'Error',
        description: 'Ha ocurrido un error al hacer login',
        status: 'error',
        duration: 5000,
        isClosable: true,
      })
    }
  }
  return (
    <Flex
      minH={'100vh'}
      align={'center'}
      justify={'center'}
      bg={useColorModeValue('gray.50', 'gray.800')}
    >
      <Stack spacing={8} mx={'auto'} maxW={'lg'} px={6}>
        <Stack align={'center'}>
          <Heading fontSize={'4xl'}>Inicia sesión</Heading>
          <Text fontSize={'lg'} color={'gray.600'}>
            Para acceder al panel de control hacen falta privilegios de
            administrador✌️
          </Text>
        </Stack>
        <Box
          rounded={'lg'}
          bg={useColorModeValue('white', 'gray.700')}
          boxShadow={'lg'}
          p={8}
        >
          <Stack spacing={4}>
            <LoginForm onSubmit={onSubmit} />
          </Stack>
        </Box>
      </Stack>
    </Flex>
  )
}

export default Login
