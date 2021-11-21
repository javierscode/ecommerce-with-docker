import { useDisclosure } from '@chakra-ui/hooks'
import {
  Container,
  Box,
  Stack,
  Heading,
  Flex,

} from '@chakra-ui/layout'
import { useToast } from '@chakra-ui/toast'
import { useRouter } from 'next/router'
import { useContext } from 'react'
import { CartOrderSummary } from '../components/CartOrderSummary'
import ShippingForm, { shippingFormData } from '../components/ShippingForm'
import SuccessModal from '../components/SuccesModal'
import ShopContext from '../context/ShopContext'
import { withCart } from '../HOC/withCart'

const CheckoutPage = () => {

  const Router = useRouter()
  const { sendOrder, clearCart } = useContext(ShopContext)
  const toast = useToast()
  const { isOpen, onOpen, onClose } = useDisclosure()

  const handleModalClose = () => {
    onClose()
    clearCart()
    Router.replace('/')
  }


  const onSubmit = async (data: shippingFormData) => {
    try {
      await sendOrder(data)
      onOpen()
    }catch(e){
      toast({
          title: 'Error',
          description: 'Ha ocurrido un error al enviar el pedido',
          status: 'error',
          duration: 5000,
          isClosable: true
      })
    }
}
  return (
    <>
    <Container maxW="container.xl">
      <Box
        maxW={{ base: '3xl', lg: '7xl' }}
        mx="auto"
        px={{ base: '8', md: '12' }}
        py={{ base: '8', md: '12' }}
      >
        <Stack
          direction={{ base: 'column', lg: 'row' }}
          align={{ lg: 'flex-start' }}
          spacing={{ base: '8', md: '16' }}
        >
          <Stack spacing={{ base: '8', md: '10' }} flex="2">
            <Heading fontSize="2xl" fontWeight="extrabold">
              Datos de envío
            </Heading>
            <Stack spacing="6">
             <ShippingForm onSubmit={onSubmit}/>
            </Stack>
          </Stack>
          <Flex direction="column" align="center" flex="1">
            <CartOrderSummary disableCheckout />
          </Flex>
        </Stack>
      </Box>
    </Container>
    <SuccessModal onClose={handleModalClose} isOpen={isOpen} />
    </>
  )
}

export default withCart(CheckoutPage)
