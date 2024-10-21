import 'dart:convert';
import 'dart:typed_data';

class ImageDTO {
  String name;
  Uint8List imageBytes;

  ImageDTO({
    required this.name,
    required this.imageBytes,
  });

  // Factory constructor to create ImageDTO from JSON
  factory ImageDTO.fromJson(Map<String, dynamic> json) {
    return ImageDTO(
      name: json['name'],
      imageBytes: base64Decode(json['imageBase64']),
    );
  }

  // Convert ImageDTO to JSON (if needed)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageBase64': base64Encode(imageBytes),
    };
  }
}
