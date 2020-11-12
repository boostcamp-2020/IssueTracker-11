import express from "express";
import issueMilestoneController from "../controllers/issueMilestones.js";

const issueMilestonesRouter = express.Router();
issueMilestonesRouter.route("/").delete(issueMilestoneController.delete);
issueMilestonesRouter.route("/").get(issueMilestoneController.get);
issueMilestonesRouter.route("/:id").post(issueMilestoneController.post);
issueMilestonesRouter.route("/:id/issues").get(issueMilestoneController.get);
export default issueMilestonesRouter;
