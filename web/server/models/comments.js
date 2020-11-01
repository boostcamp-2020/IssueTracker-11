import Model from './model.js';

const Query = {
    GET_QUERY: `SELECT * FROM comments`,
    POST_QUERY: 'INSERT INTO comments SET ?',
    PUT_QUERY: ``,
    DELETE_QUERY: ``,
};

class commentModel extends Model {
    constructor(Query) {
        super(Query);
    }
}

export default new commentModel(Query);
