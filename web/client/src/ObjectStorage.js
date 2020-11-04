import crypto from 'crypto';
import cryptoJs from 'crypto-js';

class ObjectStorage {
    constructor() {
        this.accessKey = process.env.STORAGE_ACCESS_KEY;
        this.secretKey = process.env.STORAGE_SECRET_KEY;
        this.hostUrl = process.env.STORAGE_HOSTURL;
        this.region = process.env.STORAGE_REGION;
        this.serviceName = 's3';
        this.requestType = 'aws4_requset';
        this.hasedPayload = 'UNSIGNED-PAYLOAD';
        this.hashingAlgorithm = 'AWS4-HMAC-SHA256';
    }

    getUtcTime(dateString) {
        const chars = [':', '-'];
        chars.forEach((char) => {
            while (dateString.indexOf(char) !== -1) {
                dateString = dateString.replace(char, '');
            }
        });

        dateString = dateString.split('.')[0] + 'Z';
        return dateString;
    }
}

export default ObjectStorage;
