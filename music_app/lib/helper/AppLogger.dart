import 'package:logger/logger.dart';

final logger = Logger(printer: PrettyPrinter(
    methodCount: 0, //2 // Number of method calls to be displayed
    errorMethodCount: 8, // Number of method calls if stacktrace is provided
    lineLength: 170, // Width of the output

    colors: true, // Colorful log messages
    printEmojis: true, // Print an emoji for each log message
    //printTime: false // Should each log print contain a timestamp
));