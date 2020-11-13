import express from "express";
import milestoneController from "../controllers/milestones.js";
import issueMilestonesRouter from "../routes/issueMilestones.js";
import issueMileStonesRouter from "../routes/issueMilestones.js";
const milestonesRouter = express.Router();

milestonesRouter.use("/:id/issuesStatus", issueMilestonesRouter);
milestonesRouter
  .route("/")
  .get(milestoneController.get)
  .post(milestoneController.post)
  .patch(milestoneController.patch);

milestonesRouter
  .route("/:id")
  .put(milestoneController.put)
  .delete(milestoneController.delete);
milestonesRouter.route("/:id/status").patch(milestoneController.patch);

export default milestonesRouter;
