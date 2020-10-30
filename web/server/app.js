import express from 'express';
import cookieParser from 'cookie-parser';
import logger from 'morgan';
import env from 'dotenv';
env.config();

import compression from 'compression';
import helmet from 'helmet';
import cors from 'cors';

import router from './routes/index.js';

const app = express();

app.use([logger('dev'), express.json(), express.urlencoded({ extended: false }), cookieParser()]);
app.use([compression(), helmet(), cors()]);

app.use('/', router);

app.use((req, res, next) => res.status(404).send('Sorry cant find that!'));

app.use((err, req, res, next) => {
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};
    res.status(err.status || 500).send(`STATUS_CODE : ${err.status} ERROR, MESSAGE : ${err.message}`);
});

export default app;
