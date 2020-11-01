import pool from '../config/database.js';

const GET_QUERY = `SELECT * FROM issues`;
const POST_QUERY = 'INSERT INTO issues SET ?';
const PUT_QUERY = ``;
const DELETE_QUERY = ``;

class issueModel {
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

    static post = async (title, contents, author, milestone_id) => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            return await conn.query(POST_QUERY, {
                title,
                contents,
                author,
                milestone_id,
            });
            await conn.commit();
        } catch (error) {
            console.error(error);
        } finally {
            conn.release();
        }
    };
}

export default issueModel;
