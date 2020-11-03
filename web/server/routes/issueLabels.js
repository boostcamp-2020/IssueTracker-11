import express from 'express';
import issueLabelController from '../controllers/issueLabels.js';

const issueLabelsRouter = express.Router();
issueLabelsRouter.route('/').get(issueLabelController.get);
issueLabelsRouter.route('/:id').post(issueLabelController.post).delete(issueLabelController.delete);

export default issueLabelsRouter;
