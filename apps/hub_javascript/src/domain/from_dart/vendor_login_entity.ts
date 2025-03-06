import { VendorsAndServices } from "./request_action_types";

export class VendorLoginEntity {
    vendor: VendorsAndServices;
    apiKey?: string;
    authToken?: string;
    pairingCode?: string;
    email?: string;
    password?: string;
    ip?: string;
    port?: string;
    static event: string = 'setUpDevice';

    
    constructor(
        vendor: VendorsAndServices,
        options?: {
            apiKey?: string;
            authToken?: string;
            pairingCode?: string;
            email?: string;
            password?: string;
            ip?: string;
            port?: string;
        }
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

    static fromJson(json: any): VendorLoginEntity {
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
