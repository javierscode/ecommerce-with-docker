import { Box, Container, Heading } from '@chakra-ui/layout'
import { Table, Td, Thead, Tr, Th, Tbody } from '@chakra-ui/table'
import { useCallback, useContext, useEffect, useState } from 'react'
import ShopContext from '../context/ShopContext'
import { withAuth } from '../HOC/withAuth'
import { Order } from '../intefaces/order'

const Administration = () => {
  const [orders, setOrders] = useState<Order[]>([])
  const [loading, setLoading] = useState(true)
  const { getOrders } = useContext(ShopContext)

  const handleGetOrders = useCallback(async () => {
    const orders = await getOrders()
    setOrders(orders)
    setLoading(false)
  }, [getOrders])

  useEffect(() => {
    handleGetOrders()
  }, [handleGetOrders])

  return (
    <Container maxW="container.xl">
      <Box
        maxW={{ base: '3xl', lg: '7xl' }}
        mx="auto"
        px={{ base: '8', md: '12' }}
        py={{ base: '8', md: '12' }}
        display="flex"
        flexDirection="column"
        gridGap={10}
      >
        <Heading>Consulta los últimos pedidos</Heading>

        {loading ? (
          <p>Cargando...</p>
        ) : (
          <Table variant="simple">
            <Thead>
              <Tr>
                <Th>Order Id</Th>
                <Th>Fecha</Th>
                <Th>Nombre completo</Th>
                <Th>Dirección</Th>
                <Th>Nº productos</Th>
                <Th>Total €</Th>
              </Tr>
            </Thead>
            <Tbody>
                {orders.map((order: Order) => (
                    <Tr key={order.id}>
                        <Td>{order.id}</Td>
                        <Td>{new Date(order.date_created).toLocaleDateString()}</Td>
                        <Td>{`${order.customer_name} ${order.customer_surname}`}</Td>
                        <Td>{`${order.customer_postal_code} ${order.customer_city}`}</Td>
                        <Td>{order.products.length}</Td>
                        <Td>{order.products.reduce((acc, product) => acc + product.price, 0)}</Td>
                    </Tr>
                ))}
            </Tbody>
          </Table>
        )}
      </Box>
    </Container>
  )
}

export default withAuth(Administration)
