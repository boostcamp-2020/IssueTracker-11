import issueModel from "../models/issues.js";
import Controller from "./controller.js";
import Issue from "../objects/issue.js";
import GETResponse from "../objects/getResponse.js";
import issueMileStonesModel from "../models/issueMilestones.js";

const TITLE_LIMIT = 45;
const CONTENT_LIMIT = 500;

const clean = (obj) => {
    for (let propName in obj) {
        if (obj[propName] === null || obj[propName] === undefined) {
            delete obj[propName];
        }
    }
    return obj;
};

class IssueController extends Controller {
  constructor(issueModel) {
    super(issueModel);
  }

get = async (req, res) => {
    try {
      const [result] = await this.Model.get();
      const getResponse = new GETResponse();
      let previousItem = undefined;

      if (req.params.id) {
        const filteredResult = result.filter(
          (item) => item.issue_id == req.params.id
        );
        let responseItem = {};
        const issuesStatus = await issueMileStonesModel.get(
          filteredResult[0].milestone_id
        );
        filteredResult[0]["milestone_issuesStatus"] = { ...issuesStatus };
        filteredResult.forEach((item, index) => {
          if (index === 0) responseItem = new Issue(item);
          else {
            responseItem.setLabel(item);
            responseItem.setAssignee(item);
          }
        });
        res.status(200).send(responseItem);
      } else {
        result.forEach((item, index) => {
          if (index === 0) {
            const currentItem = new Issue(item);
            previousItem = currentItem;
          } else {
            if (previousItem.issue_id === item.issue_id) {
              previousItem.setLabel(item);
              previousItem.setAssignee(item);
            } else {
              getResponse.data.push(previousItem);
              previousItem = new Issue(item);
            }
          }
        });
        getResponse.data.push(previousItem);
        getResponse.data.forEach((item) =>
          item.status ? getResponse.open_number++ : getResponse.closed_number++
        );
        res.status(200).send(getResponse);
      }
    } catch (error) {
      res.status(500).send({ result: error.message });
    }
  };

  post = async (req, res) => {
    const { title, contents, author, milestone_id } = req.body;
    if (
      !title ||
      !author ||
      title.length > TITLE_LIMIT ||
      (!!contents && contents.length > CONTENT_LIMIT)
    ) {
      return res.status(422).send({ status: "Unprocessable Entity" });
    }

    try {
      await this.Model.post({ title, contents, author, milestone_id });
      res.status(201).send({ status: "Created" });
    } catch (error) {
      res.status(500).send({ status: error.message });
    }
  };


  put = async (req, res) => {
    const { title, contents, milestone_id } = req.body;
    const id = req.params.id;

    if (
      !title ||
      !id ||
      title.length > TITLE_LIMIT ||
      (!!contents && contents.length > CONTENT_LIMIT)
    ) {
      return res.status(422).send({ status: "Unprocessable Entity" });
    }

    try {
      await this.Model.put({ title, contents, milestone_id }, id);
      return res.status(200).send({ status: "OK" });
    } catch (error) {
      res.status(500).send({ status: error.message });
    }
  };
}

export default new IssueController(issueModel);
