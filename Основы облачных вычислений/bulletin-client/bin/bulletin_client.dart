import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
  try {
    final socket = await Socket.connect('127.0.0.1', 8080);
    print('Connected to server ${socket.remoteAddress}:${socket.remotePort}');

    // Создаем потоки для ввода с консоли и ответа от сервера
    final inputChannel = stdin.transform(utf8.decoder);

    stdout.write('Enter bulletin text:\n');

    // Подписываемся на ввод с консоли
    inputChannel.listen((input) {
      // Отправляем введенную строку на сервер
      socket.write(input);
    });

    // Подписываемся на ответ от сервера
    socket.listen(
      (data) {
        final message = String.fromCharCodes(data);

        stdout.write('Server sent:\n');

        stdout.write(message);

      },
      onDone: () {
        stdout.write('Server disconnected.');
        socket.destroy();
      },
      onError: (error) {
        stdout.write('Error: $error');
        socket.destroy();
      },
      cancelOnError: true,
    );
  } catch (e) {
    print('Error: $e');
  }
}
