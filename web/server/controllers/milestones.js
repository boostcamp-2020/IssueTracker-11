import milestoneModel from '../models/milestones.js';
import Controller from './controller.js';

const DESCRIPTION_LIMIT = 128;

class MilestoneController extends Controller {
    constructor(milestoneModel) {
        super(milestoneModel);
    }

    post = async (req, res) => {
        const { title, description, due_date } = req.body;
        if (!title || (!!description && description.length > DESCRIPTION_LIMIT)) {
            return res.status(422).send('Unprocessable Entity');
        }

        try {
            const results = await this.Model.post({ title, description, due_date });
            return !results ? res.status(202).send('Accepted') : res.status(201).send('Created');
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    put = async (req, res) => {
        const { title, description, due_date } = req.body;
        const id = req.params.id;

        if (!title || (!!description && description.length > DESCRIPTION_LIMIT)) {
            return res.status(422).send('Unprocessable Entity');
        }
        if (!id) {
            return res.status(422).send('Unprocessable Entity');
        }

        try {
            const results = await this.Model.put({ title, description, due_date }, id);
            return !results ? res.status(202).send('Accepted') : res.status(201).send('Created'); // TODO : To modify
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };
}

export default new MilestoneController(milestoneModel);
