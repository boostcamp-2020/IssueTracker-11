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
        this.hashedPayload = 'UNSIGNED-PAYLOAD';
        this.hashingAlgorithm = 'AWS4-HMAC-SHA256';
        this.headers = {
            'x-amz-date': null,
            'x-amz-content-sha256': this.hashedPayload,
            host: this.hostUrl,
        };
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
    _createCanonicalQueryParams(requsetParams) {
        let canonicalQueryParams = '';
        if (!requsetParams) return '';

        const keys = Object.keys(requsetParams);
        canonicalQueryParams = keys.reduce((res, key) => {
            res += `${key}=${encodeURI(requsetParams[key])}&`;
            return res;
        }, '');

        return canonicalQueryParams.slice(0, -1);
    }
    _createCanonicalHeaders(headers) {
        const keys = Object.keys(headers);
        keys.sort();

        return keys.reduce((res, key) => {
            res += `${key.toLowerCase()}:${headers[key].trim()}\n`;
            return res;
        }, '');
    }
    _createSignedHeaders(headers) {
        const keys = Object.keys(headers);
        keys.sort();

        return keys.reduce((res, key) => {
            res += `${key.toLowerCase()};`;
            return res;
        }, '');
    }
    _createCredentialScope(dateStamp) {
        return `${dateStamp}/${this.region}/${this.serviceName}/${this.requestType}`;
    }
    _createCanonicalReq(httpMethod, requestPath, requestParams, headers) {
        const canonicalQueryParams = this._createCanonicalQueryParams(requestParams);
        const canonicalHeaders = this._createCanonicalHeaders(headers);
        const signedHeaders = this._createSignedHeaders(headers);

        return `${httpMethod}\n${requestPath}\n${canonicalQueryParams}\n${canonicalHeaders}\n${signedHeaders}\n${this.hashedPayload}`;
    }
    _createStringToSign(timeStamp, credentialScope, canonicalReq) {
        const hashedCanonicalReq = crypto.createHash('SHA256').update(canonicalReq).digest('hex');

        return `${this.hashingAlgorithm}\n${timeStamp}\n${credentialScope}\n${hashedCanonicalReq}`;
    }
    getAuthorizationHeader(httpMethod, bucketName, objectName, requestParams) {
        const timeStamp = this.getUtcTime(new Date().toISOString());
        const dateStamp = timeStamp.split('T')[0];
        const requestPath = `/${bucketName}/${objectName}`;

        const credentialScope = this._createCredentialScope(dateStamp);
        const canonicalReq = this._createCanonicalReq(httpMethod, requestPath, requestParams, this.headers);
        const stringToSign = this._createStringToSign(timeStamp, credentialScope, canonicalReq);
        const signatureKey = this._createSignautreKey(dateStamp);

        return this._createAuthorizationHeaders(this.headers, signatureKey, stringToSign, credentialScope);
    }

    setAuthorization(timeStamp, payload, host, authorization) {
        this.headers['x-amz-date'] = timeStamp;
        this.headers['x-content-sha256'] = payload;
        this.headers['host'] = host;
        this.headers['Authorization'] = authorization;
    }
}

export default ObjectStorage;
