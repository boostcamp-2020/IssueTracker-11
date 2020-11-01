import commentModel from '../models/comments.js';

const CONTENT_LIMIT = 500;

class commentController {
    static get = async (req, res) => {
        try {
            const [result] = await commentModel.get();
            return result.length === 0 ? res.status(204).send('No Content') : res.status(200).send(result);
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    static post = async (req, res) => {
        const { issue_id, contents, author } = req.body;
        if (!issue_id || !author || (!!contents && contents.length > CONTENT_LIMIT)) {
            return res.status(422).send('Unprocessable Entity');
        }

        try {
            const results = await commentModel.post(issue_id, contents, author);
            return !results ? res.status(202).send('Accepted') : res.status(201).send('Created');
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    static put = (req, res) => {};
    static delete = (req, res) => {};
}

export default commentController;
