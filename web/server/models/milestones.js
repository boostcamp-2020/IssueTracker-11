import pool from '../config/database.js';

const GET_QUERY = `SELECT * FROM milestones`;
const POST_QUERY = 'INSERT INTO milestones SET ?';
const PUT_QUERY = ``;
const DELETE_QUERY = ``;

class milestoneModel {
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

    static post = async (title, due_date, description) => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            const result = await conn.query(POST_QUERY, {
                title,
                due_date,
                description,
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

export default milestoneModel;
