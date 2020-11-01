import pool from '../config/database.js';

const GET_QUERY = `SELECT * FROM users`;
const POST_QUERY = 'INSERT INTO users SET ?';
const PUT_QUERY = ``;
const DELETE_QUERY = ``;

class userModel {
    static get = async () => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            return pool.query(GET_QUERY);
        } catch (error) {
            console.error(error);
        } finally {
            conn.release();
        }
    };

    static post = async (email, password, nickname) => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            const result = await conn.query(POST_QUERY, {
                email,
                password,
                nickname,
            });
            await conn.commit();
            return result;
        } catch (error) {
            console.error(error);
        } finally {
            conn.release();
        }
    };
}

export default userModel;
