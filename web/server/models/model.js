import pool from '../config/database.js';

class Model {
    constructor({ GET_QUERY, POST_QUERY, PUT_QUERY, DELETE_QUERY }) {
        this.GET_QUERY = GET_QUERY;
        this.POST_QUERY = POST_QUERY;
        this.PUT_QUERY = PUT_QUERY;
        this.DELETE_QUERY = DELETE_QUERY;
    }

    get = async () => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            return pool.query(this.GET_QUERY);
        } catch (error) {
            console.error(error);
        } finally {
            conn.release();
        }
    };

    post = async (POST_DATA) => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            const result = await conn.query(this.POST_QUERY, POST_DATA);
            await conn.commit();
            return result;
        } catch (error) {
            console.error(error);
        } finally {
            conn.release();
        }
    };
}

export default Model;
