export class LoggerService {
    static _instance: any;

    constructor() {
      if (LoggerService._instance) {
        return LoggerService._instance
      }
      LoggerService._instance = this;
    }

    log(text: string){
      console.log(text);
    }
}
  
 export const loggerService = new LoggerService();