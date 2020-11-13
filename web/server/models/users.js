import Model from './model.js';

const Query = {
    GET_QUERY: `SELECT * FROM users`,
    POST_QUERY: 'INSERT INTO users SET ? ',
    PUT_QUERY: ``,
    DELETE_QUERY: ``,
};

class UserModel extends Model {
    constructor() {
        super(Query);
    }
}

export default new UserModel(Query);
