import issueMilestonesModel from "../models/issueMilestones.js";
import Controller from "./controller.js";

class issueMilestonesController extends Controller {
  constructor(issueMilestonesModel) {
    super(issueMilestonesModel);
  }
  getCount = () => {};
  get = async (req, res) => {
    const milestone_id = Number(req.originalUrl.replace(/[^0-9]/g, ""));
    try {
      const results = await this.Model.get(milestone_id);
      return res.status(200).send({ status: "OK", data: results });
    } catch (error) {
      res.status(500).send({ result: error.message });
    }
  };
  post = async (req, res) => {
    const milestone_id = req.params.id;
    const ids = req.body.ids;

    try {
      await ids.forEach((issue_id) => {
        this.Model.post({ milestone_id }, issue_id);
      });
      return res.status(201).send({ status: "Created" });
    } catch (error) {
      res.status(500).send({ status: error.message });
    }
  };

  delete = async (req, res) => {
    const ids = req.body.ids;
    try {
      await ids.forEach((issue_id) => {
        this.Model.delete(issue_id);
      });
      return res.status(200).send({ status: "OK" });
    } catch (error) {
      res.status(500).send({ status: error.message });
    }
  };
}

export default new issueMilestonesController(issueMilestonesModel);
