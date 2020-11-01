import Model from './model.js';

const Query = {
    GET_QUERY: `SELECT * FROM labels`,
    POST_QUERY: 'INSERT INTO labels SET ?',
    PUT_QUERY: ``,
    DELETE_QUERY: ``,
};

class LabelModel extends Model {
    constructor(Query) {
        super(Query);
    }
}

export default new LabelModel(Query);
