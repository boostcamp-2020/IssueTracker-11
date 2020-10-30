import pool from '../config/database.js';

const GET_QUERY = `SELECT * FROM labels`;
const POST_QUERY = 'INSERT INTO labels SET ?';
const PUT_QUERY = ``;
const DELETE_QUERY = ``;

// TODO : set right status code!

class labelController {
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
        const { name, description, color } = req.body;
        // TODO : title value check!

        const connection = await pool.getConnection(async (connection) => connection);
        try {
            await connection.beginTransaction();
            const results = await connection.query(POST_QUERY, {
                name: name,
                color: color,
                description: description,
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

export default labelController;
