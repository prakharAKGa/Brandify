import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

class HuggingFaceService {
  static const String _apiKey = "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"; // Replace with your key
  static const String _apiUrl = "https://api-inference.huggingface.co/models/stabilityai/stable-diffusion-2-1";


  /// Generates an image based on the given [prompt] and returns the image as a Uint8List.
  static Future<Uint8List?> generateImage(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          "Authorization": "Bearer $_apiKey",
          "Content-Type": "application/json",
           "Accept": "application/json"
        },
        body: jsonEncode({"inputs": prompt}),
      );

      if (response.statusCode == 200) {
        return response.bodyBytes; // Return image data
      } else {
        throw Exception("Failed to generate image: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
