export default class Milestone {
  constructor(milestone_id, title, status, issuesStatus) {
    this.milestone_id = milestone_id;
    this.title = title;
    this.status = status;
    this.open_number = issuesStatus.opened;
    this.closed_number = issuesStatus.closed;
  }
}
