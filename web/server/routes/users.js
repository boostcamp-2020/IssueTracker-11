import express from 'express';
import userController from '../controllers/users.js';

const usersRouter = express.Router();

usersRouter.route('/').get(userController.get).post(userController.post).patch(userController.patch);
usersRouter.route('/:id').put(userController.put).delete(userController.delete);

export default usersRouter;
