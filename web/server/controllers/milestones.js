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
            return res.status(422).send({ status: 'Unprocessable Entity' });
        }

        try {
            await this.Model.post({ title, description, due_date });
            res.status(201).send({ status: 'Created' });
        } catch (error) {
            res.status(500).send({ status: error.message });
        }
    };

    put = async (req, res) => {
        const { title, description, due_date } = req.body;
        const id = req.params.id;

        if (!title || !id || (!!description && description.length > DESCRIPTION_LIMIT)) {
            return res.status(422).send({ status: 'Unprocessable Entity' });
        }

        try {
            await this.Model.put({ title, description, due_date }, id);
            res.status(200).send({ status: 'OK' });
        } catch (error) {
            res.status(500).send({ status: error.message });
        }
    };
}

export default new MilestoneController(milestoneModel);
