import Model from './model.js';

const Query = {
    GET_QUERY: `SELECT * FROM issues`,
    POST_QUERY: 'INSERT INTO issues SET ?',
    PUT_QUERY: ``,
    DELETE_QUERY: ``,
};

class issueModel extends Model {
    constructor(Query) {
        super(Query);
    }
}

export default new issueModel(Query);
