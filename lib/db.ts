import mysql from "mysql2/promise";

// create the connection to database
export const createConnection = () => mysql.createConnection({
  host: "host.docker.internal",
  database: process.env.MYSQL_DATABASE || 'database',
  user: process.env.MYSQL_USER || 'user',
  password: process.env.MYSQL_PASSWORD || 'password',
  port: 3306
});
