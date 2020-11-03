import issueLabelsModel from '../models/issueLabels.js';
import Controller from './controller.js';

class IssueLabelController extends Controller {
    constructor(issueLabelsModel) {
        super(issueLabelsModel);
    }

    post = async (req, res) => {
        const label_id = req.params.id;
        const ids = req.body.ids;

        try {
            await ids.forEach((issue_id) => {
                this.Model.post({ issue_id, label_id });
            });
            return res.status(201).send('Created');
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    delete = async (req, res) => {
        const label_id = req.params.id;
        const ids = req.body.ids;
        try {
            await ids.forEach((issue_id) => {
                this.Model.delete(label_id, issue_id);
            });
            return res.status(201).send('Created'); // TODO : To modify
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };
}

export default new IssueLabelController(issueLabelsModel);
