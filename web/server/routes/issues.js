import express from 'express';
import issuesController from '../controllers/issues.js';

const issuesRouter = express.Router();

issuesRouter
    .route('/')
    .get(issuesController.get)
    .post(issuesController.post)
    .put(issuesController.put)
    .delete(issuesController.delete);

export default issuesRouter;
