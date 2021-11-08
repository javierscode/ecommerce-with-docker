import { NextApiHandler } from 'next'
import { createConnection } from '../../lib/db'

const handler: NextApiHandler = async (_, res) => {

  const db = await createConnection();

  const [rows, fields]  = await db.query('SELECT * FROM test');

  res.json([rows, fields])
 

}

export default handler
