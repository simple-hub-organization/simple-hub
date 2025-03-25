import Bravia from 'bravia';  // Directly import the default export (class)
import { loggerService } from "../../services/logger_service.js";
import { EntityActions, EntityStateGRPC, EntityTypes, VendorsAndServices } from "../../../domain/from_dart/request_action_types.js";
import { DeviceEntityNotAbstract } from "../../../domain/from_dart/device_entity_base.js";

export class SonyBraviaAPI {
    static async start() {
        loggerService.log("Sony Bravia API started");
    }

    static async connectDevice(ipAddress, port = 80, psk = '0000') {
        try {
            const braviaClient = new Bravia(ipAddress, port, psk);
            loggerService.log(`Connected to Sony Bravia TV at ${ipAddress}`);
            return braviaClient;
        } catch (error) {
            loggerService.log(`Failed to connect to Sony Bravia TV: ${error}`);
            return false;
        }
    }

    static async setStateByAction(requestAction) {
        const braviaClient = await SonyBraviaAPI.connectDevice(requestAction.value.get('ip'), requestAction.value.get('port'), requestAction.value.get('passsword'))
        if (requestAction.actionType === EntityActions.Off) {
            await braviaClient.send('PowerOff');
        }
        if (requestAction.actionType === EntityActions.Mute) {
            await braviaClient.send('Mute');
        }
        if (requestAction.actionType === EntityActions.VolumeUp) {
            await braviaClient.send('VolumeUp');
        }
        if (requestAction.actionType === EntityActions.VolumeDown) {
            await braviaClient.send('VolumeDown');
        }
        if (requestAction.actionType === EntityActions.MoveUp) {
            await braviaClient.send('Up');
        }
        if (requestAction.actionType === EntityActions.MoveDown) {
            await braviaClient.send('Down');
        }
        if (requestAction.actionType === EntityActions.Pressed) {
            await braviaClient.send('Confirm');
        }
        if (requestAction.actionType === EntityActions.Play) {
            await braviaClient.send('Play');
        }
        if (requestAction.actionType === EntityActions.Pause) {
            await braviaClient.send('Pause');
        }
    }

    static async getEntitiesForId(vendorLogin) {
        const device = await SonyBraviaAPI.discoverDevices(vendorLogin.ip);
        if(device == false){
            return;
        }

        const entity = new DeviceEntityNotAbstract();
        entity.entityStateGRPC = EntityStateGRPC.AddNewEntityFromJavascriptHub;
        entity.entityTypes = EntityTypes.SmartTV;
        entity.deviceVendor = device['manufacturer'];
        entity.deviceOriginalName = device['friendlyName'];
        entity.uniqueId = device['UDN'];
        entity.cbjDeviceVendor = VendorsAndServices.Sony;
        entity.deviceLastKnownIp = device['host'];
        entity.devicePort = device['port'].toString();
        entity.senderDeviceModel = device['modelName'];
        entity.entityKey = vendorLogin.password;


        return [entity];
    }

    static async discoverDevices(ip){
        // The time in milliseconds for the bravia discovery to scan for.
        let timeout = 5000;
        

        try {
            const devices = await Bravia.discover(timeout);
            for (let tv of devices) {
                if (tv.host === ip) {
                    return tv;  // Correctly returns the found TV
                }
            }
        }
        catch (error) {
            console.error(error);
        }
        return false;

    }
}