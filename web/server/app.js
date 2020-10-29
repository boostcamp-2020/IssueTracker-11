// import modules
import express from 'express';
import cookieParser from 'cookie-parser';
import logger from 'morgan';

// import third-party middleware modules
import compression from 'compression';
import helmet from 'helmet';
import cors from 'cors';

// import routers
import users from './routes/users.js';
import labels from './routes/labels.js';
import comments from './routes/comments.js';
import milestones from './routes/milestones.js';

const app = express();

app.use([logger('dev'), express.json(), express.urlencoded({ extended: false }), cookieParser()]);

app.use([compression(), helmet(), cors()]);

// TODO : index Router 만들기
app.use('/users', users);
app.use('/labels', labels);
app.use('/comments', comments);
app.use('/milestones', milestones);

// Not Fount Error
app.use((req, res, next) => res.status(404).send('Sorry cant find that!'));

// Client Timeout Error
app.use((err, req, res, next) => {
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};
    res.status(err.status || 500).send(`STATUS_CODE : ${err.status} ERROR, MESSAGE : ${err.message}`);
});

export default app;
