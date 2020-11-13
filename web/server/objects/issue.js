import Label from "./label.js";
import Milestone from "./milestone.js";
import User from "./user.js";

export default class Issue {
  constructor(item) {
    (this.issue_id = item.issue_id),
      (this.title = item.title),
      (this.contents = item.contents),
      (this.status = item.status),
      (this.author = new User(item.author, item.author_nickname)),
      (this.assignees = []),
      (this.labels = []),
      (this.milestone = new Milestone(
        item.milestone_id,
        item.milestone_title,
        item.milestone_status,
        item.milestone_issuesStatus
      )),
      (this.created_at = item.created_at),
      (this.updated_at = item.updated_at),
      (this.deleted_at = item.deleted_at);

    if (item.label_id !== null) this.setLabel(item);
    if (item.assignee_id !== null) this.setAssignee(item);
  }

  setLabel = (item) => {
    let hasLabel = false;
    this.labels.forEach((label) => {
      if (label.label_id === item.label_id) {
        hasLabel = true;
        return;
      }
    });
    if (hasLabel === false)
      this.labels.push(
        new Label(item.label_id, item.label_name, item.label_color)
      );
  };

  setAssignee = (item) => {
    let hasAssignee = false;
    this.assignees.forEach((assignee) => {
      if (assignee.user_id === item.assignee_id) {
        hasAssignee = true;
        return;
      }
    });
    if (hasAssignee === false)
      this.assignees.push(new User(item.assignee_id, item.assignee_nickname));
  };
}
