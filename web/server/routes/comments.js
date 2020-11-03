import express from 'express';
import commentController from '../controllers/comments.js';

const commentsRouter = express.Router();
commentsRouter.route('/').get(commentController.get);
commentsRouter.route('/:id').put(commentController.put).delete(commentController.delete);

export default commentsRouter;
