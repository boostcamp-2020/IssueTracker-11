import express from 'express';
import cookieParser from 'cookie-parser';
import logger from 'morgan';

const middlewares = [logger('dev'), express.json(), express.urlencoded({ extended: false }), cookieParser()];

export default middlewares;
