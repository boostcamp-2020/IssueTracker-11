import express from 'express';
const commentsRouter = express.Router();

commentsRouter
    .route('/')
    .get((req, res) => {
        res.status(200).send('GET OK');
    })
    .post((req, res) => {
        res.status(200).send('POST OK');
    })
    .put((req, res) => {
        res.status(200).send('PUT OK');
    })
    .delete((req, res) => {
        res.status(200).send('DELETE OK');
    });

export default commentsRouter;
