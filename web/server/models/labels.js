import pool from '../config/database.js';

const GET_QUERY = `SELECT * FROM labels`;
const POST_QUERY = 'INSERT INTO labels SET ?';
const PUT_QUERY = ``;
const DELETE_QUERY = ``;

class labelModel {
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

    static post = async (name, description, color) => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            const result = await conn.query(POST_QUERY, {
                name,
                description,
                color,
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

export default labelModel;
