import issueModel from '../models/issues.js';

const TITLE_LIMIT = 45;
const CONTENT_LIMIT = 500;

class issueController {
    static get = async (req, res) => {
        try {
            const [result] = await issueModel.get();
            return result.length === 0 ? res.status(204).send('No Content') : res.status(200).send(result);
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    static post = async (req, res) => {
        const { title, contents, author, milestone_id } = req.body;
        if (!title || !author || title.length > TITLE_LIMIT || (!!contents && contents.length > CONTENT_LIMIT)) {
            return res.status(422).send('Unprocessable Entity');
        }
        // Is there really this author and milestone_id? plz write checking logic.

        try {
            const results = await issueModel.post(title, contents, author, milestone_id);
            return !results ? res.status(202).send('Accepted') : res.status(201).send('Created');
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    static put = (req, res) => {
        const { title, contents, milestone_id, status } = req.body;
        // TODO : 이어서 작성할 것.
    };

    static delete = (req, res) => {};
}

export default issueController;
