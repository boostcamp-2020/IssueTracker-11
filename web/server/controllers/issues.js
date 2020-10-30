import pool from '../config/database.js';

const GET_QUERY = `SELECT * FROM issues`;
const POST_QUERY = 'INSERT INTO issues SET ?';
const PUT_QUERY = ``;
const DELETE_QUERY = ``;

// TODO : set right status code!

class issueController {
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
        const { title, contents, author, milestone_id } = req.body;
        // TODO : title value check!

        const connection = await pool.getConnection(async (connection) => connection);
        try {
            await connection.beginTransaction();
            const results = await connection.query(POST_QUERY, {
                title: title,
                contents: contents,
                author: author,
                milestone_id: milestone_id,
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

export default issueController;
