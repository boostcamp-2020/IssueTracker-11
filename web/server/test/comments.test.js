import req from 'supertest';
import app from '../app.js';

describe('/issues/12/comments', () => {
    it('should return 200', (done) => {
        req(app)
            .get('/issues/12/comments')
            .then((res) => {
                expect(res.statusCode).toBe(200);
                done();
            });
    });
});

describe('/comments', () => {
    it('should return 201', (done) => {
        req(app)
            .post('/issues/12/comments')
            .send({ issue_id: 12, contents: 'contents', author: 1 })
            .then((res) => {
                expect(res.statusCode).toBe(201);
                done();
            });
    });
});
