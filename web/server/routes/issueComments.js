import express from 'express';
import issueCommentController from '../controllers/issueComments.js';

const issueCommentsRouter = express.Router();
issueCommentsRouter.route('/:id').get(issueCommentController.get);

export default issueCommentsRouter;
