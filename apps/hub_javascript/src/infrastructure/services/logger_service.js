export class LoggerService {
    static _instance;

    constructor() {
      if (LoggerService._instance) {
        return LoggerService._instance;
      }
      LoggerService._instance = this;
    }

    log(text) {
      console.log(text);
    }
}
  
export const loggerService = new LoggerService(); 