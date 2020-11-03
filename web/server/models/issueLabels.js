import Model from './model.js';
import pool from '../config/database.js';

const Query = {
    POST_QUERY: 'INSERT INTO issues_labels SET ?',
    DELETE_QUERY: `DELETE FROM issues_labels WHERE labels_id = `,
};

class issueLabelsModel extends Model {
    constructor(Query) {
        super(Query);
    }

    post = async (POST_DATA) => {
        console.log(this.POST_QUERY);
        console.log(POST_DATA);
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

    delete = async (issue_id, label_id) => {};
}

export default new issueLabelsModel(Query);
