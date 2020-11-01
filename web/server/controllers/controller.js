class Controller {
    constructor(Model) {
        this.Model = Model;
    }
    get = async (req, res) => {
        try {
            const [result] = await this.Model.get();
            return result.length === 0 ? res.status(204).send('No Content') : res.status(200).send(result);
        } catch (error) {
            res.status(500).send({ result: error.message });
        }
    };

    post = async (req, res) => {};
    put = async (req, res) => {};
    delete = async (req, res) => {};
    patch = async (req, res) => {};
}

export default Controller;
