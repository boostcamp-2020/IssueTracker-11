// Not logged User => res.status(401).send('Unauthorized');
// there is no such as user => res.status(400).send('Bad Request');
// No Auth => res.status(203).send('Non-Authoritative Information');

const checkLogin = (req, res, next) => {
    next();
};

export default checkLogin;
