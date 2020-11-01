import milestoneModel from '../models/milestones.js';

const DESCRIPTION_LIMIT = 128;

class MilestoneController {
    static get = async (req, res) => {
        try {
            const [result] = await milestoneModel.get();
            return result.length === 0 ? res.status(204).send('No Content') : res.status(200).send(result);
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    static post = async (req, res) => {
        const { title, due_date, description } = req.body;
        if (!title || (!!description && description.length > DESCRIPTION_LIMIT)) {
            return res.status(422).send('Unprocessable Entity');
        }

        try {
            const results = await milestoneModel.post({ title, due_date, description });
            return !results ? res.status(202).send('Accepted') : res.status(201).send('Created');
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    static put = (req, res) => {};
    static delete = (req, res) => {};
}

export default MilestoneController;
