import express from 'express';
import labelController from '../controllers/labels.js';

const labelsRouter = express.Router();

labelsRouter.route('/').get(labelController.get).post(labelController.post);
labelsRouter.route('/:id').put(labelController.put).delete(labelController.delete);

export default labelsRouter;
