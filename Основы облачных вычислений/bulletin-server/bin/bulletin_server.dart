import 'dart:io';

void main(List<String> arguments) async {
  // Создаем файл для записи сообщений
  var file = File('messages.txt');
  var sink = file.openWrite(mode: FileMode.append);

  final server = await ServerSocket.bind('127.0.0.1', 8080);
  print('Server listening on ${server.address}:${server.port}');

  void handleError(void Function() proccessing, Socket socket) {
    try {
      proccessing();
    } catch (e) {
      socket.writeln('$e');
    }
  }

  void commandHandler(String command, String args, Socket socket) {
    if (command == 'add') {
      handleError(
        () {
          sink.writeln(args);
          socket.writeln('Bulletin was successfully added\n');
        },
        socket,
      );
    } else if (command == 'show') {
      handleError(
        () {
          final _lines = file.readAsLinesSync();
          String lines = '';
          for (var l in _lines) {
            lines += '$l\n';
          }
          socket.writeln('All bulletins:\n$lines');
        },
        socket,
      );
    } else {
      socket.writeln('');
    }
  }

  await for (var socket in server) {
    socket.listen(
      (List<int> data) {
        final message = String.fromCharCodes(data);

        final splitted = message.split(' ');

        final command = splitted[0].trim();

        final args = splitted.length > 1 ? splitted.getRange(1, splitted.length).join(' ') : '';

        commandHandler(command, args, socket);
      },
      onError: (e) {
        print('Error: $e');
        socket.write('Error: $e');
      },
      cancelOnError: true,
    );
  }
}
