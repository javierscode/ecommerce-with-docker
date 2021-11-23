import { ResultSetHeader, RowDataPacket } from 'mysql2'
import { NextApiHandler } from 'next'
import { shippingFormData } from '../../../components/ShippingForm'
import { createConnection } from '../../../lib/db'

type postedInfo = {
  user: string
  password: string
}

const handler: NextApiHandler = async (req, res) => {
  if (req.method !== 'POST') {
    res.status(405).end()
    return
  }

  const db = await createConnection()

  const { user, password } = req.body as postedInfo

  const query = `
    SELECT * FROM Users
    WHERE username = '${user}'
    AND password = '${password}'
    `

  const [fields] = await db.query(query)

  const users = fields as RowDataPacket[]

  users.length === 0 ? res.status(401).end() : res.json(fields)
  

}

export default handler
