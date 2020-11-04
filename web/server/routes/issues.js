import express from 'express';
import issuesController from '../controllers/issues.js';
import commentsRouter from '../routes/comments.js';
// import commentController from '../controllers/comments.js';
import issueLabelsRouter from '../routes/issueLabels.js';
import assigneesRouter from '../routes/assignees.js';
import issueMilestonesRouter from '../routes/issueMilestones.js';

const issuesRouter = express.Router();

// commentsRouter.route('/comments').get(commentController.get).post(commentController.post);
issuesRouter.use('/:id/comments', commentsRouter);

issuesRouter.use('/labels', issueLabelsRouter);
issuesRouter.use('/assignees', assigneesRouter);
issuesRouter.use('/milestones', issueMilestonesRouter);

issuesRouter.route('/').get(issuesController.get).post(issuesController.post);
issuesRouter
    .route('/:id')
    .get(issuesController.get)
    .put(issuesController.put)
    .delete(issuesController.delete)
    .patch(issuesController.patch);
issuesRouter.route('/:id/status').patch(issuesController.patch);

// issuesRouter.route('/milestones').post(issuesController.post).delete(issuesController.delete);

export default issuesRouter;
