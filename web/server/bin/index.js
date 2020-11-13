import app from '../app.js';
import debug from 'debug';
import http from 'http';

const normalizePort = (val) => {
    const port = parseInt(val, 10);
    return isNaN(port) ? val : port >= 0 ? port : false;
};

const onError = (error) => {
    if (error.syscall !== 'listen') {
        throw error;
    }

    const bind = typeof port === 'string' ? 'Pipe ' + port : 'Port ' + port;
    switch (error.code) {
        case 'EACCES':
            console.error(bind + ' requires elevated privileges');
            process.exit(1);
        case 'EADDRINUSE':
            console.error(bind + ' is already in use');
            process.exit(1);
        default:
            throw error;
    }
};

const onListening = () => {
    const addr = server.address();
    const bind = typeof addr === 'string' ? 'pipe ' + addr : 'port ' + addr.port;
    debug('http:server')('Listening on ' + bind);
};

const port = normalizePort(process.env.PORT || '3000');
app.set('port', port);

const server = http.createServer(app);

server.listen(port, () => {
    server.on('error', onError);
    server.on('listening', onListening);
});
