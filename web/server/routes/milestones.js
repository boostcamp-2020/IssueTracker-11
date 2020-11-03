import express from 'express';
import milestoneController from '../controllers/milestones.js';
import issuesRouter from './issues.js';

const milestonesRouter = express.Router();

milestonesRouter
    .route('/')
    .get(milestoneController.get)
    .post(milestoneController.post)
    .patch(milestoneController.patch);

milestonesRouter.route('/:id').put(milestoneController.put).delete(milestoneController.delete);
milestonesRouter.use('/:id', issuesRouter);

export default milestonesRouter;
