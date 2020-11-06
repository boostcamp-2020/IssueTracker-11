import express from 'express';
import issuesController from '../controllers/issues.js';
import commentsRouter from './comments.js';
import issueLabelsRouter from './issueLabels.js';
import assigneesRouter from './assignees.js';
import issueMilestonesRouter from './issueMilestones.js';
import issueCommentsRouter from './issueComments.js';

const issuesRouter = express.Router();

issuesRouter.use('/:id/comments', commentsRouter);
issuesRouter.use('/labels', issueLabelsRouter);
issuesRouter.use('/assignees', assigneesRouter);
issuesRouter.use('/milestones', issueMilestonesRouter);
issuesRouter.use('/', issueCommentsRouter);
issuesRouter.route('/').get(issuesController.get).post(issuesController.post);
issuesRouter.route('/:id').put(issuesController.put).delete(issuesController.delete).patch(issuesController.patch);
issuesRouter.route('/:id/status').patch(issuesController.patch);

export default issuesRouter;
