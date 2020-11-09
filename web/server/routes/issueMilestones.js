import express from 'express';
import issueMilestoneController from '../controllers/issueMilestones.js';

const issueMilestonesRouter = express.Router();
issueMilestonesRouter.route('/').delete(issueMilestoneController.delete);
issueMilestonesRouter.route('/:id').post(issueMilestoneController.post);

export default issueMilestonesRouter;
