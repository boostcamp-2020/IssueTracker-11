import compression from 'compression';
import helmet from 'helmet';
import cors from 'cors';

const corsOption = {
    origin: '*',
    methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE'],
};

const thirdPartyMiddleware = [compression(), helmet(), cors(corsOption)];

export default thirdPartyMiddleware;
