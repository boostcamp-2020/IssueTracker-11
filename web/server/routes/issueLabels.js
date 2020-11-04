import express from 'express';
import issueLabelController from '../controllers/issueLabels.js';

const issueLabelsRouter = express.Router();
issueLabelsRouter.route('/').get(issueLabelController.get);

export default issueLabelsRouter;
