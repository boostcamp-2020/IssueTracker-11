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
        if (!title || title.length > TITLE_LIMIT || (!!contents && contents.length > CONTENT_LIMIT)) {
            return res.status(422).send('Unprocessable Entity');
        }
        if (!author) {
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
        const id = req.params.id;

        if (!title || title.length > TITLE_LIMIT || (!!contents && contents.length > CONTENT_LIMIT)) {
            return res.status(422).send('Unprocessable Entity');
        }
        if (!status || !id) {
            return res.status(422).send('Unprocessable Entity');
        }

        // TODO : 검증 로직이 더 필요하다. 202가 뜨는 상황을 최대한 방지.
        try {
            const results = await this.Model.put({ title, contents, milestone_id, status }, id);
            return !results ? res.status(202).send('Accepted') : res.status(201).send('Created'); // TODO : To modify
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    delete = async (req, res) => {
        const id = req.params.id;
        try {
            const results = await this.Model.delete(id);
            console.log('반환 결과 : ', results);
            return !results ? res.status(202).send('Accepted') : res.status(201).send('Created'); // TODO : To modify
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };
}

export default new IssueController(issueModel);
