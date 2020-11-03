import issueMilestonesModel from '../models/issueMilestones.js';
import Controller from './controller.js';

class issueMilestonesController extends Controller {
    constructor(issueMilestonesModel) {
        super(issueMilestonesModel);
    }

    post = async (req, res) => {
        const milestone_id = req.params.id;
        const ids = req.body.ids;

        try {
            await ids.forEach((issue_id) => {
                this.Model.post({ milestone_id }, issue_id);
            });
            return res.status(201).send('Created'); // TODO : To modify
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    delete = async (req, res) => {
        const ids = req.body.ids;
        console.log(ids);
        try {
            await ids.forEach((issue_id) => {
                console.log(issue_id);
                this.Model.delete(issue_id);
            });
            return res.status(201).send('Created'); // TODO : To modify
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };
}
/**
 *
 * 
	put = async (req, res) => {
        const { issue_id, contents, author } = req.body;
        const id = req.params.id;

        if (!issue_id || !author || (!!contents && contents.length > CONTENT_LIMIT)) {
            return res.status(422).send('Unprocessable Entity');
        }

        try {
            const results = await this.Model.put({ issue_id, contents, author }, id);
            return !results ? res.status(202).send('Accepted') : res.status(201).send('Created'); // TODO : To modify
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };
 */

export default new issueMilestonesController(issueMilestonesModel);
