import labelModel from '../models/labels.js';
import Controller from './controller.js';

const DESCRIPTION_LIMIT = 128;

class LabelController extends Controller {
    constructor(labelModel) {
        super(labelModel);
    }

    post = async (req, res) => {
        const { name, description, color } = req.body;
        if (!name || (!!description && description.length > DESCRIPTION_LIMIT)) {
            return res.status(422).send({ status: 'Unprocessable Entity' });
        }

        try {
            await this.Model.post({ name, description, color });
            res.status(201).send({ status: 'Created' });
        } catch (error) {
            res.status(500).send({ status: error.message });
        }
    };

    put = async (req, res) => {
        const { name, description, color } = req.body;
        const id = req.params.id;

        if (!name || !id || (!!description && description.length > DESCRIPTION_LIMIT)) {
            return res.status(422).send({ status: 'Unprocessable Entity' });
        }

        try {
            await this.Model.put({ name, description, color }, id);
            res.status(200).send({ status: 'OK' });
        } catch (error) {
            res.status(500).send({ status: error.message });
        }
    };
}

export default new LabelController(labelModel);
