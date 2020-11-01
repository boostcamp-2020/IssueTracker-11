import Model from './model.js';

const Query = {
    GET_QUERY: `SELECT * FROM milestones`,
    POST_QUERY: 'INSERT INTO milestones SET ?',
    PUT_QUERY: ``,
    DELETE_QUERY: ``,
};

class milestoneModel extends Model {
    constructor(Query) {
        super(Query);
    }
}

export default new milestoneModel(Query);
