import pool from '../config/database.js';

const GET_QUERY = `SELECT * FROM comments`;
const POST_QUERY = 'INSERT INTO comments SET ?';
const PUT_QUERY = ``;
const DELETE_QUERY = ``;

// TODO : set right status code!

class commentController {
    static get = async (req, res) => {
        const connection = await pool.getConnection(async (connection) => connection);
        try {
            const [result] = await connection.query(GET_QUERY);
            return res.status(200).send(result);
        } catch (error) {
            console.error(error);
        } finally {
            connection.release();
        }
    };

    static post = async (req, res) => {
        const { issue_id, contents, author } = req.body;
        // TODO : issue_id value check!

        const connection = await pool.getConnection(async (connection) => connection);
        try {
            await connection.beginTransaction();
            const results = await connection.query(POST_QUERY, {
                issue_id: issue_id,
                contents: contents,
                author: author,
            });
            await connection.commit();
            // TODO : results's status check!
            res.status(200).send(results);
        } catch (error) {
            console.error(error);
        } finally {
            connection.release();
        }
    };

    static put = (req, res) => {};
    static delete = (req, res) => {};
}

export default commentController;
