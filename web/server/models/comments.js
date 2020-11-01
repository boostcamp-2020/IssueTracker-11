import pool from '../config/database.js';

const GET_QUERY = `SELECT * FROM comments`;
const POST_QUERY = 'INSERT INTO comments SET ?';
const PUT_QUERY = ``;
const DELETE_QUERY = ``;

class commentModel {
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

    static post = async (issue_id, contents, author) => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            const result = await conn.query(POST_QUERY, {
                issue_id,
                contents,
                author,
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

export default commentModel;
