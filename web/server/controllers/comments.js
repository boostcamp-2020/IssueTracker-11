import commentModel from '../models/comments.js';
import Controller from './controller.js';

const CONTENT_LIMIT = 500;

class CommentController extends Controller {
    constructor(commentModel) {
        super(commentModel);
    }

    get = async (req, res) => {
        try {
            if (req.originalUrl.includes('comments')) {
                const issue_id = Number(req.originalUrl.replace(/[^0-9]/g, ''));
                const [result] = await this.Model.get(`WHERE issue_id = ${issue_id} AND deleted_at IS NULL`);
                return result.length === 0
                    ? res.status(200).send({ data: [] })
                    : res.status(200).send({ status: 'OK', data: result });
            }
        } catch (error) {
            res.status(500).send({ status: error.message });
        }
    };

    post = async (req, res) => {
        const issue_id = Number(req.originalUrl.replace(/[^0-9]/g, ''));
        const { contents, author } = req.body;
        if (!issue_id || !author || (!!contents && contents.length > CONTENT_LIMIT)) {
            return res.status(422).send({ status: 'Unprocessable Entity' });
        }

        try {
            await this.Model.post({ issue_id, contents, author });
            return res.status(201).send({ status: 'Created' });
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    put = async (req, res) => {
        const { issue_id, contents, author } = req.body;
        const id = req.params.id;

        if (!issue_id || !author || (!!contents && contents.length > CONTENT_LIMIT)) {
            return res.status(422).send({ status: 'Unprocessable Entity' });
        }

        try {
            await this.Model.put({ issue_id, contents, author }, id);
            return res.status(200).send({ status: 'OK' });
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };
}

export default new CommentController(commentModel);
