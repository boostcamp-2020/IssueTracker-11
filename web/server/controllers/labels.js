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
            return res.status(422).send('Unprocessable Entity');
        }

        try {
            const results = await this.Model.post({ name, description, color });
            return !results ? res.status(202).send('Accepted') : res.status(201).send('Created');
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    put = async (req, res) => {
        const { name, description, color } = req.body;
        const id = req.params.id;
        console.log(id);

        if (!name || (!!description && description.length > DESCRIPTION_LIMIT)) {
            return res.status(422).send('Unprocessable Entity');
        }
        if (!id) {
            return res.status(422).send('Unprocessable Entity');
        }

        try {
            const results = await this.Model.put({ name, description, color }, id);
            return !results ? res.status(202).send('Accepted') : res.status(201).send('Created'); // TODO : To modify
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };
}

export default new LabelController(labelModel);
