import issueModel from "../models/issues.js";
import commentModel from "../models/comments.js";
import Controller from "./controller.js";

class issueCommentsController extends Controller {
  constructor(issueModel) {
    super(issueModel);
  }

  get = async (req, res) => {
    const issue_id = req.params.id;
    try {
      const [issue] = await this.Model.get(
        `WHERE issue_id = ${issue_id} AND deleted_at IS NULL`
      );
      const [comments] = await commentModel.get(
        `WHERE issue_id = ${issue_id} AND deleted_at IS NULL`
      );
      const result = { issue: issue, comments: [...comments] };
      res.status(200).send({ status: "OK", data: result });
    } catch (error) {
      res.status(500).send({ status: error.message });
    }
  };
}

export default new issueCommentsController(issueModel);
