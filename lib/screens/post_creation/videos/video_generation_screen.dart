import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class TextToVideoScreen extends StatefulWidget {
  @override
  _TextToVideoScreenState createState() => _TextToVideoScreenState();
}

class _TextToVideoScreenState extends State<TextToVideoScreen> {
  final String apiKey = '7G6Sa4g53N4cbCcqntk4wOlPhq5J8W0Y5XEZo8MJcwtGwrG8SXtMZUfl9cmb'; // Replace with your actual API key
  final TextEditingController _promptController = TextEditingController();
  String? gifUrl; // Stores the generated GIF URL
  bool isLoading = false;
  String? errorMessage; // Stores error messages

  /// Function to generate a video (GIF in this case) from text
  Future<void> generateVideo(String prompt) async {
    setState(() {
      isLoading = true;
      gifUrl = null;
      errorMessage = null;
    });

    final url = Uri.parse('https://modelslab.com/api/v6/video/text2video');
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      "key": apiKey,
      "model_id": "cogvideox",
      "prompt": prompt,
      "negative_prompt": "low quality",
      "height": 512,
      "width": 512,
      "num_frames": 25,
      "num_inference_steps": 20,
      "guidance_scale": 7,
      "upscale_height": 640,
      "upscale_width": 1024,
      "upscale_strength": 0.6,
      "upscale_guidance_scale": 12,
      "upscale_num_inference_steps": 20,
      "output_type": "gif",
      "webhook": null,
      "track_id": null
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (data['status'] == 'processing') {
          String fetchUrl = data['fetch_result'];
          int eta = data['eta'] ?? 10;

          print("Processing... Fetching GIF after $eta seconds.");
          await Future.delayed(Duration(seconds: eta));
          await fetchGeneratedVideo(fetchUrl); // Fetch the final GIF
        } else if (data['status'] == 'success' && data['output'].isNotEmpty) {
          updateGifUrl(data['output'][0]);
        } else {
          setState(() {
            errorMessage = "Unexpected API response: ${data.toString()}";
          });
        }
      } else {
        setState(() {
          errorMessage = "Error: ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "Exception: $e";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  /// Function to fetch the generated GIF after processing
  Future<void> fetchGeneratedVideo(String fetchUrl) async {
  try {
    while (true) {
      final fetchResponse = await http.get(Uri.parse(fetchUrl));
      final fetchData = jsonDecode(fetchResponse.body);

      print("Fetch Response: ${fetchResponse.body}"); // Debugging

      if (fetchResponse.statusCode != 200) {
        setState(() {
          errorMessage = "Server returned an error: ${fetchResponse.statusCode}";
        });
        break;
      }

      if (fetchData.containsKey('error')) {
        setState(() {
          errorMessage = "API Error: ${fetchData['error']}";
        });
        break;
      }

      if (fetchData['status'] == 'success' && fetchData['output'].isNotEmpty) {
        updateGifUrl(fetchData['output'][0]);
        break;
      } else if (fetchData['status'] == 'processing') {
        print("Still processing... Checking again in 10 seconds.");
        await Future.delayed(Duration(seconds: 10));
      } else {
        setState(() {
          errorMessage = "Unexpected fetch response: ${fetchData.toString()}";
        });
        break;
      }
    }
  } catch (e) {
    setState(() {
      errorMessage = "Exception while fetching GIF: $e";
    });
  }
}

  /// Function to update UI with the generated GIF URL
  void updateGifUrl(String newGifUrl) {
    setState(() {
      gifUrl = newGifUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text to GIF Generator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _promptController,
              decoration: InputDecoration(labelText: 'Enter your prompt'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => generateVideo(_promptController.text),
              child: Text('Generate GIF'),
            ),
            SizedBox(height: 20),
            if (isLoading) CircularProgressIndicator(),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            if (gifUrl != null)
              Column(
                children: [
                  Text('Generated GIF:'),
                  SizedBox(height: 10),
                  Image.network(gifUrl!), // Display the generated GIF
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => launch(gifUrl!), // Open GIF in browser
                    child: Text('Open GIF in Browser'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
