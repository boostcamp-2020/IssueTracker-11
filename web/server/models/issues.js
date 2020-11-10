import milestones from './milestones.js';
import Model from './model.js';

const Query = {
    GET_QUERY: `
    SELECT J1.*, U2.nickname as author_nickname, U1.nickname as assignee_nickname, L.name as label_name, 
    L.color as label_color, M.title as milestone_title, M.status as milestone_status
    FROM
    (SELECT I.*, A.user_id as assignee_id, IL.label_id
    FROM issues AS I 
    LEFT OUTER JOIN assignees AS A 
    ON I.issue_id = A.issue_id 
    LEFT OUTER JOIN issues_labels AS IL 
    ON I.issue_id = IL.issue_id
    WHERE I.deleted_at IS NULL
    ) as J1
    LEFT OUTER JOIN users as U1
    ON J1.assignee_id = U1.user_id
    LEFT OUTER JOIN users as U2
    ON J1.author = U2.user_id
    LEFT OUTER JOIN labels as L
    ON J1.label_id = L.label_id AND L.deleted_at IS NULL
    LEFT OUTER JOIN milestones as M
    ON J1.milestone_id = M.milestone_id AND M.deleted_at IS NULL
    ORDER BY J1.issue_id, J1.author, J1.assignee_id, J1.label_id`,
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
