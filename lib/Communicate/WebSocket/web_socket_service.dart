import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late WebSocketChannel channel;

  void connect(String url) {
    channel = WebSocketChannel.connect(Uri.parse(url));
  }

  Stream<dynamic> listen() {
    return channel.stream.map((event) => event);
  }

  // Close WebSocket connection
  void disconnect() {
    channel.sink.close();
  }
}
