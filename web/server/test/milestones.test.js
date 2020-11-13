import req from 'supertest';
import app from '../app.js';
/*
describe('/milestones', () => {
    it('should return 200', (done) => {
        req(app)
            .get('/milestones')
            .then((res) => {
                expect(res.statusCode).toBe(200);
                done();
            });
    });
});

describe('/milestones', () => {
    it('should return 201', (done) => {
        req(app)
            .post('/milestones')
            .send({ title: 'title', description: 'description', due_date: '2020-11-04' })
            .then((res) => {
                expect(res.statusCode).toBe(201);
                done();
            });
    });
});

describe('/milestones/:id', () => {
    it('should return 200', (done) => {
        req(app)
            .delete('/milestones/15')
            .then((res) => {
                expect(res.statusCode).toBe(200);
                done();
            });
    });
});
*/

describe('/milestones/:id', () => {
    it('should return 200', (done) => {
        req(app)
            .delete('/milestones/15')
            .then((res) => {
                expect(res.body).toBe(200);
                done();
            });
    });
});

/* DELETE Method는 id가 필요하여 정적인 값으로 test할 수 없어서 보류

describe('/milestones/:id', () => {
    it('should return 200', (done) => {
        req(app)
            .delete('/milestones')
            .then((res) => {
                expect(res).toBe(1);
                done();
            });
    });
});

describe('/milestones/:id', () => {
    it('should return 200', (done) => {
        req(app)
            .post('/milestones')
            .send({ title: 'title', description: 'description', due_date: '2020-11-04' })
            .then((res) => {
                expect(res.statusCode).toBe(201);
                done();
            });
    });
});

*/
