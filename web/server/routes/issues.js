import express from 'express';
import issuesController from '../controllers/issues.js';

const issuesRouter = express.Router();

issuesRouter.route('/').get(issuesController.get).post(issuesController.post);
issuesRouter.route('/:id').put(issuesController.put).delete(issuesController.delete).patch(issuesController.patch);

export default issuesRouter;
