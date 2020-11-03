import pool from '../config/database.js';

class Model {
    constructor({ GET_QUERY, POST_QUERY, PUT_QUERY, DELETE_QUERY, ...PATCH_QUERY }) {
        this.GET_QUERY = GET_QUERY;
        this.POST_QUERY = POST_QUERY;
        this.PUT_QUERY = PUT_QUERY;
        this.DELETE_QUERY = DELETE_QUERY;
        this.PATCH_QUERY = PATCH_QUERY;
    }

    get = async () => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            return conn.query(this.GET_QUERY);
        } catch (error) {
            conn.rollback();
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
            conn.rollback();
            console.error(error);
        } finally {
            conn.release();
        }
    };

    put = async (PUT_DATA, ID) => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            const result = await conn.query(this.PUT_QUERY(PUT_DATA) + ID);
            await conn.commit();
            return result;
        } catch (error) {
            conn.rollback();
            console.error(error);
        } finally {
            conn.release();
        }
    };

    delete = async (ID) => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            const result = await conn.query(this.DELETE_QUERY + ID);
            await conn.commit();
            return result;
        } catch (error) {
            conn.rollback();
            console.error(error);
        } finally {
            conn.release();
            conn.
        }
    };

    patch = async (ID, OPTION) => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            const result = await conn.query(this.PATCH_QUERY[OPTION] + ID);
            await conn.commit();
            return result;
        } catch (error) {
            conn.rollback();
            console.error(error);
        } finally {
            conn.release();
        }
    };
}

export default Model;
