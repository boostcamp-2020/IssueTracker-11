import Model from './model.js';
import pool from '../config/database.js';

const Query = {
    GET_QUERY: `SELECT * FROM comments WHERE issue_id = `,
    POST_QUERY: 'INSERT INTO comments SET ?',
    PUT_QUERY: ({ issue_id, contents, author }) =>
        `UPDATE comments SET issue_id = '${issue_id}', contents = '${contents}', author = '${author}', updated_at = now() WHERE comment_id = `,
    DELETE_QUERY: `DELETE FROM comments WHERE comment_id = `,
    SOFT_DELETE_QUERY: `UPDATE comments SET deleted_at = now() WHERE comment_id = `,
};

class CommentModel extends Model {
    constructor(Query) {
        super(Query);
    }

    get = async (issue_id) => {
        const conn = await pool.getConnection(async (conn) => conn);
        try {
            await conn.beginTransaction();
            return conn.query(this.GET_QUERY + issue_id);
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
}

export default new CommentModel(Query);
