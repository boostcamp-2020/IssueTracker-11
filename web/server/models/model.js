import pool from '../config/database.js';

const SOFT_DELETE = 0;
const OPEN_CLOSED = 1;

class Model {
    constructor({ GET_QUERY, POST_QUERY, PUT_QUERY, DELETE_QUERY, ...PATCH_QUERY }) {
        this.GET_QUERY = GET_QUERY;
        this.POST_QUERY = POST_QUERY;
        this.PUT_QUERY = PUT_QUERY;
        this.DELETE_QUERY = DELETE_QUERY;
        this.PATCH_QUERY = PATCH_QUERY;
        console.log(this.PATCH_QUERY);
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

    put = async (PUT_DATA, ID) => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            const result = await conn.query(this.PUT_QUERY + ID, PUT_DATA);
            await conn.commit();
            return result;
        } catch (error) {
            console.error(error);
        } finally {
            conn.release();
        }
    };

    delete = async (ID) => {
        console.log(1);
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            console.log(this.DELETE_QUERY + ID);
            const result = await conn.query(this.DELETE_QUERY + ID);
            await conn.commit();
            console.log(2);
            return result;
        } catch (error) {
            console.error(error);
        } finally {
            conn.release();
        }
    };

    patch = async (OPTION) => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            const result = await conn.query(this.PUT_QUERY[OPTION]);
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
