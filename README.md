A wrapper around https://pub.dev/packages/logger with a number of enhancements and convenience stuff, including:

- Include current log line in every log (i.e the line of the log call).
- Include some specified metadata with every log.
- Fallback to dart:developer's log() for very long log entries.
- Easily direct logs to local/remote logger.
- Some convenience stuff when logging from a google cloud run server.
- logger.eApi() which logs with level error or info based on if the device currently has internet access.