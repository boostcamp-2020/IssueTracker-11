const SOFT_DELETE = 'SOFT_DELETE_QUERY';
const OPEN_CLOSED = 'OPEN_CLOSED_QUERY';

class Controller {
    constructor(Model) {
        this.Model = Model;
    }
    get = async (req, res) => {
        try {
            const [result] = await this.Model.get(req.originalUrl);
            return result.length === 0 ? res.status(204).send('No Content') : res.status(200).send(result);
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    post = async (req, res) => {};
    put = async (req, res) => {};

    delete = async (req, res) => {
        const id = req.params.id || req.body.ids;
        const ids = [...id];
        try {
            ids.forEach((id) => {
                this.Model.delete(id);
            });
            return res.status(201).send('Created'); // TODO : To modify
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    patch = async (req, res) => {
        const id = req.params.id || req.body.ids;
        const ids = [...id];
        try {
            const OPTION = req.originalUrl.includes('status') ? OPEN_CLOSED : SOFT_DELETE;
            ids.forEach((id) => {
                this.Model.patch(id, OPTION);
            });
            return res.status(201).send('Created');
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };
}

export default Controller;
