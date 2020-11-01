import commentModel from '../models/comments.js';
import Controller from './controller.js';

const CONTENT_LIMIT = 500;

class CommentController extends Controller {
    constructor(commentModel) {
        super(commentModel);
    }

    post = async (req, res) => {
        const { issue_id, contents, author } = req.body;
        if (!issue_id || !author || (!!contents && contents.length > CONTENT_LIMIT)) {
            return res.status(422).send('Unprocessable Entity');
        }

        try {
            const results = await this.Model.post({ issue_id, contents, author });
            return !results ? res.status(202).send('Accepted') : res.status(201).send('Created');
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    put = async (req, res) => {};
    delete = async (req, res) => {};
}

export default new CommentController(commentModel);
