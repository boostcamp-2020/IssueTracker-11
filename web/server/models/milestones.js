import Model from './model.js';

const Query = {
    GET_QUERY: `SELECT * FROM milestones`,
    POST_QUERY: 'INSERT INTO milestones SET ? ',
    PUT_QUERY: ({ title, description, due_date }) =>
        `UPDATE milestones SET title = '${title}', description = '${description}', due_date = '${due_date}', updated_at = now() WHERE milestone_id = `,
    DELETE_QUERY: `DELETE FROM milestones WHERE milestone_id = `,
    SOFT_DELETE_QUERY: `UPDATE milestones SET deleted_at = now() WHERE milestone_id = `,
    OPEN_CLOSED_QUERY: `UPDATE milestones SET status = 1 - status WHERE milestone_id = `,
};

class MilestoneModel extends Model {
    constructor(Query) {
        super(Query);
    }
}

export default new MilestoneModel(Query);
