import express from 'express';
import milestoneController from '../controllers/milestones.js';

const milestonesRouter = express.Router();

milestonesRouter
    .route('/')
    .get(milestoneController.get)
    .post(milestoneController.post)
    .put(milestoneController.put)
    .delete(milestoneController.delete);

export default milestonesRouter;
