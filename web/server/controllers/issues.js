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
            return res.status(422).send('Unprocessable Entity');
        }
        // Is there really this author and milestone_id? plz write checking logic.

        try {
            const results = await this.Model.post({ title, contents, author, milestone_id });
            return !results ? res.status(202).send('Accepted') : res.status(201).send('Created');
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    put = async (req, res) => {
        const { title, contents, milestone_id, status } = req.body;
        // TODO : 이어서 작성할 것.
    };

    delete = async (req, res) => {};
}

export default new IssueController(issueModel);
