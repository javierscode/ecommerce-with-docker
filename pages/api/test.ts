import { NextApiHandler } from 'next'
import { createConnection } from '../../lib/db'


const handler: NextApiHandler = async (_, res) => {
  const db = await createConnection()

  db
    ? res.status(200).json({ message: 'Connected to database' })
    : res.status(500).json({ message: 'Error connecting to database' })
}

export default handler
