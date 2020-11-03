import assigneeModel from '../models/assignees.js';
import Controller from './controller.js';

class AssigneeController extends Controller {
    constructor(assigneeModel) {
        super(assigneeModel);
    }

    post = async (req, res) => {
        const user_id = req.params.id;
        const ids = req.body.ids;

        try {
            await ids.forEach((issue_id) => {
                this.Model.post({ issue_id, user_id });
            });
            return res.status(201).send('Created');
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    delete = async (req, res) => {
        const user_id = req.params.id;
        const ids = req.body.ids;
        try {
            await ids.forEach((issue_id) => {
                this.Model.delete(user_id, issue_id);
            });
            return res.status(201).send('Created'); // TODO : To modify
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };
}

export default new AssigneeController(assigneeModel);
