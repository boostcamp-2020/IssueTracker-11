import express from 'express';
import thirdPartyMiddleware from './middlewares/thirdPartyMiddleware.js';
import middleware from './middlewares/middlewares.js';
import router from './routes/index.js';
import env from 'dotenv';
env.config();

const app = express();

app.use(middleware);
app.use(thirdPartyMiddleware);

app.use('/', router);
app.use((req, res, next) => res.status(404).send('Not Found'));
app.use((err, req, res, next) => {
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};
    res.status(err.status || 500).send(`STATUS_CODE : ${err.status} ERROR, MESSAGE : ${err.message}`);
});

export default app;
