import Model from './model.js';

const Query = {
    GET_QUERY: `SELECT * FROM issues`,
    POST_QUERY: 'INSERT INTO issues SET ?',
    PUT_QUERY: `UPDATE issues SET ? WHERE issue_id = `,
    DELETE_QUERY: `DELETE FROM issues WHERE issue_id = `,
    SOFT_DELETE_QUERY: `test1`,
    OPEN_CLOSED_QUERY: `test2`,
};

class IssueModel extends Model {
    constructor(Query) {
        super(Query);
    }
}

export default new IssueModel(Query);
