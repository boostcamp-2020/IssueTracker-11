import userModel from '../models/users.js';
import Controller from './controller.js';

class UserController extends Controller {
    constructor(userModel) {
        super(userModel);
    }

    post = async (req, res) => {
        const { email, password, nickname } = req.body;
        if (!email || !password || !nickname) {
            return res.status(422).send('Unprocessable Entity');
        }

        try {
            await this.Model.post({ email, password, nickname });
            res.status(201).send('Created');
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    put = async (req, res) => {};
    delete = async (req, res) => {};
}

export default new UserController(userModel);
