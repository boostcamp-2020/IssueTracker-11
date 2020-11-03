import express from 'express';
import issuesController from '../controllers/issues.js';

const issuesRouter = express.Router();

issuesRouter
    .route('/')
    .get(issuesController.get)
    .post(issuesController.post)
    .patch(issuesController.patch)
    .delete(issuesController.delete);
issuesRouter.route('/:id').put(issuesController.put);
issuesRouter.route('/status').patch(issuesController.patch);

export default issuesRouter;
