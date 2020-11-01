import labelModel from '../models/labels.js';

const DESCRIPTION_LIMIT = 128;

class labelController {
    static get = async (req, res) => {
        try {
            const [result] = await labelModel.get();
            return result.length === 0 ? res.status(204).send('No Content') : res.status(200).send(result);
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    static post = async (req, res) => {
        const { name, description, color } = req.body;
        if (!name || (!!description && description.length > DESCRIPTION_LIMIT)) {
            return res.status(422).send('Unprocessable Entity');
        }

        try {
            const results = await labelModel.post(name, description, color);
            return !results ? res.status(202).send('Accepted') : res.status(201).send('Created');
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    static put = (req, res) => {};
    static delete = (req, res) => {};
}

export default labelController;
