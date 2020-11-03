import express from 'express';
import issuesController from '../controllers/issues.js';
import commentsRouter from '../routes/comments.js';
import commentController from '../controllers/comments.js';

commentsRouter.route('/comments').get(commentController.get).post(commentController.post);

const issuesRouter = express.Router();

issuesRouter
    .route('/')
    .get(issuesController.get)
    .post(issuesController.post)
    .patch(issuesController.patch)
    .delete(issuesController.delete);
issuesRouter.route('/:id').get(issuesController.get).put(issuesController.put);
issuesRouter.route('/status').patch(issuesController.patch);

issuesRouter.use('/:id', commentsRouter);

export default issuesRouter;
