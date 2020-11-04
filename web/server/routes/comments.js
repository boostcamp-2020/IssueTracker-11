import express from 'express';
import commentController from '../controllers/comments.js';

const commentsRouter = express.Router();
commentsRouter.route('/').get(commentController.get).post(commentController.post);
commentsRouter.route('/:id').put(commentController.put).delete(commentController.delete).patch(commentController.patch);

export default commentsRouter;
