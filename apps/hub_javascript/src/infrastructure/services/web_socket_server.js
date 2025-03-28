import { WebSocketServer } from 'ws';
import { matterAPI } from '../integrations/matter/matter_integration.js';
import { SonyBraviaAPI } from '../integrations/sony/sony_integration.js';
import { loggerService } from './logger_service.js';
import { VendorLoginEntity } from '../../domain/from_dart/vendor_login_entity.js';
import { EntityActions, EntityTypes, VendorsAndServices } from '../../domain/from_dart/request_action_types.js';
import { RequestActionObject } from '../../domain/from_dart/request_action_object.js';
import { DeviceEntityNotAbstract } from '../../domain/from_dart/device_entity_base.js';

const startWebSocketServer = (port = 9080) => {
  const wss = new WebSocketServer({ port: port });
  loggerService.log('Server started');

  wss.on('connection', (ws) => {
    loggerService.log('Client connected');

    ws.on('message', async (message) => {
      let responses = [];

      try {
        const data = JSON.parse(message.toString());

        loggerService.log(`Received: ${data}`);

        if (data.event === VendorLoginEntity.event) {
         const vendorLogin = VendorLoginEntity.fromJson(data);

          const entities = await setupDevice(vendorLogin);
          entities.forEach((entity) => {
            entity.deviceUniqueId = vendorLogin.deviceUniqueId
            responses.push(JSON.stringify(entity.toJSON()));
          });
        }
        else if (data.event === RequestActionObject.event) {
          const requestAction = RequestActionObject.fromJson(data);
          await setEntityState(requestAction);
          responses = ['{"response":"ok"}'];
        }
      } catch (error) {
        console.error('Invalid message format:', error);
        responses = [error?.toString() ?? 'Error'];
      }

      responses.forEach((respons) => {
        ws.send(respons);
      });
    });
  });

  async function setupDevice(vendorLogin) {

    if(vendorLogin.vendor === undefined) {
      return [];
    }

    if(vendorLogin.vendor === VendorsAndServices.Matter) {
      if(vendorLogin.pairingCode === undefined) {
        return [];
      }
      const deviceId = await matterAPI.commissionDevice(vendorLogin.pairingCode);
      return matterAPI.getEntitiesForId(deviceId);      
    }
    else if(vendorLogin.vendor === VendorsAndServices.Sony) {
      if(vendorLogin.ip === undefined) {
        return [];
      }
      const connected = await SonyBraviaAPI.connectDevice(
        vendorLogin.ip,
        vendorLogin.port,
        vendorLogin.password
      );
      if(vendorLogin.password == undefined){
        vendorLogin.password = '0000'
      }
      if (connected) {
        return SonyBraviaAPI.getEntitiesForId(vendorLogin);
      }
      return [];
    }
    return [];
  }

  async function setEntityState(requestAction) {
    if (requestAction.vendors?.size === 0) {
      return;
    }

    if (requestAction.vendors?.has(VendorsAndServices.Matter)) {
      return matterAPI.setStateByAction(requestAction);
    }
    else if (requestAction.vendors?.has(VendorsAndServices.Sony)) {
      return SonyBraviaAPI.setStateByAction(requestAction);
    }
  }

  console.log(`WebSocket server is running on port ${port}`);
  return wss;
};

export default startWebSocketServer; 