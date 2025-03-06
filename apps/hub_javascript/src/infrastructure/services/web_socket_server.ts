import WebSocket, { Server } from 'ws';
import { MatterAPI, matterAPI } from '../integrations/matter/matter_integration';
import { loggerService } from './logger_service';
import { VendorLoginEntity } from '../../domain/from_dart/vendor_login_entity';
import { EntityActions, EntityTypes, VendorsAndServices } from '../../domain/from_dart/request_action_types';
import { RequestActionObject } from '../../domain/from_dart/request_action_object';
import { DeviceEntityNotAbstract } from '../../domain/from_dart/device_entity_base';


const startWebSocketServer = (port = 9080) => {

  const wss = new Server({ port: port });
  loggerService.log('Server started');

  wss.on('connection', (ws: WebSocket) => {
    loggerService.log('Client connected');

    ws.on('message', async (message) => {
      let responses: any[] = [];

      try {
        const data = JSON.parse(message.toString());

        loggerService.log(`Received: ${data}`);


          
        if (data.event === VendorLoginEntity.event) {
          const entities:DeviceEntityNotAbstract[] = await setupDevice(data);
          entities.forEach((entity)=>{
            responses.push(JSON.stringify(entity.toJSON()));
          });
          
        }
        else if (data.event === RequestActionObject.event ) {
          await setEntityState(data);
          responses = ['{"resonse":"ok"}'];
        }
      } catch (error) {
        console.error('Invalid message format:', error);
        responses = [error?.toString()??'Error'];
      }

      responses.forEach((respons) =>{
        ws.send(respons);
      });
    });
  });

  async function setupDevice(data: any): Promise<DeviceEntityNotAbstract[]>{
    const vendorLogin = VendorLoginEntity.fromJson(data);

    if(vendorLogin.vendor === undefined){
      return [];
    }

    if(vendorLogin.vendor === VendorsAndServices.Matter){
      if(vendorLogin.pairingCode === undefined){
        return [];
      }
      const deviceId =  await matterAPI.commissionDevice(vendorLogin.pairingCode!);
      return matterAPI.getEntitiesForId(deviceId);      
    }
    return [];
  }

  async function setEntityState(data: any) {
        // TODO: data looks like this 
// entitiesId =
// '["14393791580501444205"]'
    const requestAction = RequestActionObject.fromJson(data);
    if (requestAction.vendors?.size === 0) {
      return;
    }

    if (requestAction.vendors?.has(VendorsAndServices.Matter)){
      return matterAPI.setStateByAction(requestAction);
    }
  }

  console.log(`WebSocket server is running on port ${port}`);
  return wss;
};

export default startWebSocketServer;