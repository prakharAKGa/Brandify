import 'dart:convert';

import 'package:http/http.dart' as http;

class HuggingFaceService {
  static const String _apiKey = "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"; // Replace with your key
  static const String _apiUrl = "https://api-inference.huggingface.co/models/tiiuae/falcon-7b-instruct";

  static Future<List<String>> generateIdeas(String category, String keywords) async {
    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          "Authorization": "Bearer $_apiKey",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "inputs": "Generate ideas for a $category using these keywords: $keywords  in 200 words.",
           "parameters": {
            "max_length": 1000,
            "temperature": 0.9, // Higher temperature for more randomness
            "top_k": 50,        // Sample from top 50 tokens for diversity
            "top_p": 0.95,      // Nucleus sampling for varied output
            "do_sample": true,  // Enable sampling instead of greedy decoding
            "num_return_sequences": 1, // Generate one sequence at a time
          },
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return [data[0]["generated_text"]];
      } else {
        throw Exception("Failed to generate captions: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
