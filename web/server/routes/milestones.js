import express from 'express';
import milestoneController from '../controllers/milestones.js';

const milestonesRouter = express.Router();

milestonesRouter
    .route('/')
    .get(milestoneController.get)
    .post(milestoneController.post)
    .patch(milestoneController.patch);

milestonesRouter.route('/:id').put(milestoneController.put).delete(milestoneController.delete);
milestonesRouter.route('/:id/status').patch(milestoneController.patch);

export default milestonesRouter;
