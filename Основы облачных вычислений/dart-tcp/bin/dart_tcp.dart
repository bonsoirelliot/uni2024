import 'dart:io';

import 'package:dart_tcp/text_processor.dart';

void main(List<String> arguments) async {
  TextProcessor textProcessor = TextProcessor();

  final server = await ServerSocket.bind('127.0.0.1', 8080);
  print('Server listening on ${server.address}:${server.port}');

  await for (var socket in server) {
    socket.listen(
      (List<int> data) {
        final message = String.fromCharCodes(data);

        textProcessor
          ..receiveText(message)
          ..sortWords();

        socket.write('Sorted words: ${textProcessor.getSortedWords().join(',')}');
      },
      onError: (e) {
        print('Error: $e');
        socket.write('Error: $e');
      },
      cancelOnError: true,
    );
  }
}
