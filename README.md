A logger api with some convenience stuff for better logging.

- Include current log line in every log (i.e the line of the log call).
- Clean up stack traces, such as skip `logger.dart` entries.
- Optionally include some specified metadata with every log.
- Easily direct logs to local/remote logger.
- Some convenience stuff when logging from a google cloud run server.
- logger.eApi() which logs with error-level or info-level depending on if the device currently has internet access.