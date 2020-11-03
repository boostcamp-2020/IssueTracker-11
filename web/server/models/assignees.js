import Model from './model.js';
import pool from '../config/database.js';

const Query = {
    GET_QUERY: `SELECT * FROM assignees `,
    POST_QUERY: 'INSERT INTO assignees SET ?',
    DELETE_QUERY: (user_id, issue_id) =>
        `DELETE FROM assignees WHERE (user_id, issue_id) in ((${user_id}, ${issue_id}))`,
};

class issueLabelsModel extends Model {
    constructor(Query) {
        super(Query);
    }

    delete = async (user_id, issue_id) => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            const result = await conn.query(this.DELETE_QUERY(user_id, issue_id));
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
