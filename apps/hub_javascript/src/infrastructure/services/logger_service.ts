import winston from "winston";

class LoggerService {
  private logger: winston.Logger;

  constructor() {
    this.logger = winston.createLogger({
      level: "info",
      format: winston.format.combine(
        winston.format.timestamp(),
        winston.format.printf(({ timestamp, level, message }) => {
          return `${timestamp} [${level.toUpperCase()}]: ${message}`;
        })
      ),
      transports: [
        new winston.transports.Console(), // Logs to console
        new winston.transports.File({ filename: "logs/app.log" }) // Logs to file
      ],
    });
  }

  // Method to log messages
  log(message: string) {
    this.logger.info(message);
  }

  // Additional log levels
  error(message: string, error: unknown) {
    this.logger.error(message);
  }

  warn(message: string) {
    this.logger.warn(message);
  }
}

// Export a singleton instance
export const loggerService = new LoggerService();
