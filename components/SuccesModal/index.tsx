import { CheckCircleIcon } from '@chakra-ui/icons'
import {
  Modal,
  ModalBody,
  ModalHeader,
  ModalOverlay,
  ModalFooter,
  ModalContent,
} from '@chakra-ui/modal'

import { Button, Text, Heading } from '@chakra-ui/react'

type SuccessModalProps = {
  isOpen: boolean
  onClose: () => void
}

const SuccessModal = ({ onClose, isOpen }: SuccessModalProps) => {
  return (
    <Modal onClose={onClose} isOpen={isOpen} isCentered>
      <ModalOverlay />
      <ModalContent padding={8}>
        <ModalBody textAlign="center">
          <CheckCircleIcon boxSize={'50px'} color={'green.500'} />
          <Heading as="h2" size="xl" mt={6} mb={2}>
            El pedido se ha realizado con éxito
          </Heading>
          <Text color={'gray.500'}>
            Los productos no tardarán en llegar a su destino
          </Text>
        </ModalBody>
        <ModalFooter justifyContent="center">
          <Button onClick={onClose} colorScheme="teal">¡GENIAL!</Button>
        </ModalFooter>
      </ModalContent>
    </Modal>
  )
}

export default SuccessModal
