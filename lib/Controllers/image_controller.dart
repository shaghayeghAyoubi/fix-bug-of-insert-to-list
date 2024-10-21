import 'dart:convert';

import 'package:flutterwebsocket/Common/custom_rx_list.dart';
import 'package:get/get.dart';

import '../Communicate/WebSocket/web_socket_service.dart';
import '../Model/image_dto.dart';

class ImageController extends GetxController {
  final WebSocketService _webSocketService = WebSocketService();

  var images = CustomRxList<ImageDTO>(); // Sol 2

  // var images = <ImageDTO>[].obs; // Sol 1

  // List<ImageDTO> imageIsolationContent = []; // Sol 1

  @override
  void onInit() {
    super.onInit();
    _connectToWebSocket();
  }

  void _connectToWebSocket() {
    _webSocketService.connect('ws://172.15.0.63:8080/ws');

    _webSocketService.listen().listen((data) {
      try {
        final Map<String, dynamic> json = jsonDecode(data);

        // imageIsolationContent.insert( 0 , ImageDTO.fromJson(json)); // Sol 1
        //
        // images.clear(); // Sol 1
        // images.refresh(); // Sol 1
        //
        // for (var image in imageIsolationContent) { // Sol 1
        //   images.add(image); // Sol 1
        // } // Sol 1
        //
        images.insert(0, ImageDTO.fromJson(json)); // Sol 2
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    });
  }

  @override
  void onClose() {
    _webSocketService.disconnect();
    super.onClose();
  }
}
