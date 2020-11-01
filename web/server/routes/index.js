import express from 'express';

import users from './users.js';
import labels from './labels.js';
import issues from './issues.js';
import comments from './comments.js';
import milestones from './milestones.js';

import checkLogin from '../middlewares/login.js';

const router = express.Router();

router.use(checkLogin);

router.use('/users', users);
router.use('/labels', labels);
router.use('/issues', issues);
router.use('/comments', comments);
router.use('/milestones', milestones);

export default router;
