import express from 'express';
const milestonesRouter = express.Router();

milestonesRouter
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

export default milestonesRouter;
