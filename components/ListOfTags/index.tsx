import { HStack, Tag } from '@chakra-ui/react'

type ListOfTagsProps = {
  tags: Array<string>
}

const ListOfTags = ({ tags }: ListOfTagsProps) => {
  return (
    <HStack spacing={2}>
      {tags.map((tag) => {
        return (
          <Tag size={'md'} variant="solid" colorScheme="teal" key={tag}>
            {tag}
          </Tag>
        )
      })}
    </HStack>
  )
}

export default ListOfTags
