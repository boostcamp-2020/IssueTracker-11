import Model from './model.js';

const Query = {
    GET_QUERY: `SELECT * FROM labels WHERE deleted_at IS NULL`,
    POST_QUERY: 'INSERT INTO labels SET ? ',
    PUT_QUERY: ({ name, description, color }) =>
        `UPDATE labels SET name = '${name}', description = '${description}', color = '${color}', updated_at = now() WHERE label_id = `,
    DELETE_QUERY: `DELETE FROM labels WHERE label_id = `,
    SOFT_DELETE_QUERY: `UPDATE labels SET deleted_at = now() WHERE label_id = `,
};

class LabelModel extends Model {
    constructor(Query) {
        super(Query);
    }
}

export default new LabelModel(Query);
