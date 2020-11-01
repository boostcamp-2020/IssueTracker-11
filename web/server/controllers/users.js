import userModel from '../models/users.js';

class userController {
    static get = async (req, res) => {
        try {
            const [result] = await userModel.get();
            return result.length === 0 ? res.status(204).send('No Content') : res.status(200).send(result);
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    static post = async (req, res) => {
        const { email, password, nickname } = req.body;
        if (!email || !password || !nickname) {
            return res.status(422).send('Unprocessable Entity');
        }

        try {
            const results = await userModel.post({ email, password, nickname });
            return !results ? res.status(202).send('Accepted') : res.status(201).send('Created');
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    static put = (req, res) => {};
    static delete = (req, res) => {};
}

export default userController;
