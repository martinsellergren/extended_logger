A logger api with some convenience stuff for better logging.

- Include current log line in every log (i.e the line of the log call).
- Skip `logger.dart` entries in stack-traces.
- Optionally include some specified metadata with every log.
- Easily direct logs to local/remote logger.
- Some convenience stuff when logging from a google cloud run server.
- logger.eApi() which logs with error-level or info-level depending on if the device currently has internet access.