import mysql from 'mysql2/promise';
import dotenv from 'dotenv';
dotenv.config();

const option = {
    host: process.env.DB_HOST,
    user: process.env.DB_ADRESS,
    port: process.env.DB_PORT,
    password: process.env.DB_PASSWORD,
    connectionLimit: 8,
    database: process.env.DB_NAME,
};

const pool = mysql.createPool(option);

export default pool;
