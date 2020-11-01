import compression from 'compression';
import helmet from 'helmet';
import cors from 'cors';

const thirdPartyMiddleware = [compression, helmet, cors];

export default thirdPartyMiddleware;
