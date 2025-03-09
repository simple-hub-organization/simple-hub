import { matterAPI, MatterAPI } from './integrations/matter/matter_integration';
import startWebSocketServer from './services/web_socket_server';
import { loggerService } from './services/logger_service'; // Import the logger

export async function main() {
    await startIntegrations();
    
    startWebSocketServer();
    loggerService.log("WebSocket server started successfully.");

    // Example logging (Uncomment when needed)
    
    // matterAPI.commissionDevice("127.0.0.1", 5540, "MT:Y.K9042C00KA0648G00")
    // .then(() => loggerService.log("Commission device successful"))
    // .catch(error => loggerService.error("Error Commission:", error));

    // const nodeIdN = 123;

    // matterAPI.getDeviceInfo(nodeIdN)
    // .then((info: string) => loggerService.log("Device Info: " + info))
    // .catch(error => loggerService.error("Error fetching device info:", error));

    // matterAPI.setDeviceOnOff(nodeIdN, true)
    // .then(() => loggerService.log("Changed device state"))
    // .catch(error => loggerService.error("Error changing device state:", error));

    // matterAPI.listenForChanges(nodeIdN)
    // .then(() => loggerService.log("Listening for device changes"))
    // .catch(error => loggerService.error("Error listening for changes:", error));
}

async function startIntegrations() {
    try {
        await matterAPI.start();
        loggerService.log("Matter API initialized and running.");
    } catch (error) {
        loggerService.error("Error initializing Matter API:", error);
    }
}
