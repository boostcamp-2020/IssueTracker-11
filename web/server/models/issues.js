import milestones from './milestones.js';
import Model from './model.js';

const Query = {
    GET_QUERY: `SELECT I.*, A.user_id, L.label_id FROM issues AS I LEFT OUTER JOIN assignees AS A ON I.issue_id = A.issue_id LEFT OUTER JOIN issues_labels AS L ON I.issue_id = L.issue_id`,
    POST_QUERY: 'INSERT INTO issues SET ? ',
    PUT_QUERY: ({ title, contents, milestone_id }) =>
        `UPDATE issues SET title = '${title}', contents = '${contents}', milestone_id = ${milestone_id}, updated_at = now() WHERE issue_id = `,
    DELETE_QUERY: `DELETE FROM issues WHERE issue_id = `,
    SOFT_DELETE_QUERY: `UPDATE issues SET deleted_at = now() WHERE issue_id = `,
    OPEN_CLOSED_QUERY: `UPDATE issues SET status = 1 - status WHERE issue_id = `,
};

class IssueModel extends Model {
    constructor(Query) {
        super(Query);
    }
}

export default new IssueModel(Query);
