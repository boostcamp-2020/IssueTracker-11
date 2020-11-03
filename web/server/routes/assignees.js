import express from 'express';
import assigneeController from '../controllers/assignees.js';

const assigneesRouter = express.Router();
assigneesRouter.route('/').get(assigneeController.get);
assigneesRouter.route('/:id').post(assigneeController.post).delete(assigneeController.delete);

export default assigneesRouter;
