import issueModel from '../models/issues.js';
import Controller from './controller.js';

const TITLE_LIMIT = 45;
const CONTENT_LIMIT = 500;

class IssueController extends Controller {
    constructor(issueModel) {
        super(issueModel);
    }

    post = async (req, res) => {
        const { title, contents, author, milestone_id } = req.body;
        if (!title || !author || title.length > TITLE_LIMIT || (!!contents && contents.length > CONTENT_LIMIT)) {
            return res.status(422).send({ status: 'Unprocessable Entity' });
        }

        try {
            await this.Model.post({ title, contents, author, milestone_id });
            res.status(201).send({ status: 'Created' });
        } catch (error) {
            res.status(500).send({ status: error.message });
        }
    };

    put = async (req, res) => {
        const { title, contents, milestone_id } = req.body;
        const id = req.params.id;

        if (!title || !id || title.length > TITLE_LIMIT || (!!contents && contents.length > CONTENT_LIMIT)) {
            return res.status(422).send({ status: 'Unprocessable Entity' });
        }

        try {
            await this.Model.put({ title, contents, milestone_id }, id);
            return res.status(200).send({ status: 'OK' });
        } catch (error) {
            res.status(500).send({ status: error.message });
        }
    };
}

export default new IssueController(issueModel);
