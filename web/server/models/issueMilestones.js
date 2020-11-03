import Model from './model.js';
import pool from '../config/database.js';

const Query = {
    POST_QUERY: ({ milestone_id }) =>
        `UPDATE issues SET milestone_id = ${milestone_id}, updated_at = now() WHERE issue_id = `,
    DELETE_QUERY: `UPDATE issues SET milestone_id = NULL, updated_at = now() WHERE issue_id = `,
};

class issueLabelsModel extends Model {
    constructor(Query) {
        super(Query);
    }

    post = async (PUT_DATA, ID) => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            const result = await conn.query(this.POST_QUERY(PUT_DATA) + ID);
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
        }
    };
}

export default new issueLabelsModel(Query);
