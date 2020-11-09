import Model from './model.js';
import pool from '../config/database.js';

const Query = {
    GET_QUERY: `SELECT * FROM issues_labels `,
    POST_QUERY: 'INSERT INTO issues_labels SET ?',
    DELETE_QUERY: (label_id, issue_id) =>
        `DELETE FROM issues_labels WHERE (label_id, issue_id) in ((${label_id}, ${issue_id}))`,
};

class issueLabelsModel extends Model {
    constructor(Query) {
        super(Query);
    }

    delete = async (label_id, issue_id) => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            await conn.query(this.DELETE_QUERY(label_id, issue_id));
            await conn.commit();
        } catch (error) {
            conn.rollback();
            console.error(error);
        } finally {
            conn.release();
        }
    };
}

export default new issueLabelsModel(Query);
