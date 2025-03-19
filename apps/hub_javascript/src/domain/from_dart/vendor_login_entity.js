import { VendorsAndServices } from "./request_action_types.js";

export class VendorLoginEntity {
    static event = 'setUpDevice';
    
    constructor(
        vendor,
        options
    ) {
        this.vendor = vendor;
        this.apiKey = options?.apiKey;
        this.authToken = options?.authToken;
        this.pairingCode = options?.pairingCode;
        this.email = options?.email;
        this.password = options?.password;
        this.ip = options?.ip;
        this.port = options?.port;
    }

    static fromJson(json) {
        return new VendorLoginEntity(json.vendor, {
            apiKey: json.credentials.apiKey,
            authToken: json.credentials.authToken,
            pairingCode: json.credentials.pairingCode,
            email: json.credentials.email,
            password: json.credentials.password,
            ip: json.credentials.ip,
            port: json.credentials.port,
        });
    }
} 