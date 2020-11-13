import compression from 'compression';
import helmet from 'helmet';
import cors from 'cors';

const corsOption = {
    origin: '*',
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    preflightContinue: false,
    optionsSuccessStatus: 204,
};

const thirdPartyMiddleware = [compression(), helmet(), cors(corsOption)];

export default thirdPartyMiddleware;
