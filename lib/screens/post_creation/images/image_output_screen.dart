import 'package:brandify/components/loading_widget.dart';
import 'package:brandify/config/image_generation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_gallery_saver/flutter_image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageOutputScreen extends StatefulWidget {
  final String postType;
  final String keywords;

  const ImageOutputScreen({
    Key? key,
    required this.postType,
    required this.keywords,
  }) : super(key: key);

  @override
  _ImageOutputScreenState createState() => _ImageOutputScreenState();
}

class _ImageOutputScreenState extends State<ImageOutputScreen> {
  Uint8List? generatedImage;
  bool isLoading = false;
  int generationCounter = 0; // Unique identifier to force new image generation
  bool isDisposed = false; // Track widget lifecycle

  @override
  void initState() {
    super.initState();
    fetchGeneratedImage();
  }

  @override
  void dispose() {
    isDisposed = true; // Mark as disposed
    super.dispose();
  }

  Future<void> fetchGeneratedImage() async {
    if (isDisposed) return; // Ensure widget is not disposed

    setState(() {
      isLoading = true;
      generatedImage = null; // Clear previous image
    });

    try {
      String uniquePrompt = "${widget.postType}, ${widget.keywords}, unique_id: ${DateTime.now().millisecondsSinceEpoch}_$generationCounter";
      Uint8List? imageBytes = await HuggingFaceService.generateImage(uniquePrompt);

      if (imageBytes != null && mounted) {
        setState(() {
          generatedImage = imageBytes;
          generationCounter++; // Ensure uniqueness for next generation
        });
      }
    } catch (e) {
      print("Error fetching image: $e");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> downloadImage() async {
    if (generatedImage == null) return;

    if (await Permission.storage.request().isGranted || await Permission.photos.request().isGranted) {
      try {
        await FlutterImageGallerySaver.saveImage(generatedImage!);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("✅ Image saved successfully!")),
          );
        }
      } catch (e) {
        print("Download error: $e");
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("⚠️ Error saving image.")),
          );
        }
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("⚠️ Storage permission required to save images.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.50, -0.13),
            radius: 1.18,
            colors: [
              Color(0xFF9747FF),
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black,
              Color(0xFF522759),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top Bar
              Container(
                height: 78,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: CachedNetworkImage(
                        imageUrl: 'https://dashboard.codeparrot.ai/api/image/Z-pROgz4-w8v6Rro/ion-arro.png',
                        width: 26,
                        height: 26,
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Generate Image',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Input Field
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  '${widget.postType} - ${widget.keywords}',
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // Image Container
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 400,
                height: 400,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        width: 400,
                        height: 400,
                        child: generatedImage != null
                            ? Image.memory(
                                generatedImage!,
                                fit: BoxFit.cover,
                                key: ValueKey(generationCounter),
                              )
                            : isLoading
                              
      ?  Center(child: LoadingIndicator())
                                :Image.network(
                                    'https://dashboard.codeparrot.ai/api/image/Z-pROgz4-w8v6Rro/celebrat.png',
                                    fit: BoxFit.cover,
                                    key: const ValueKey('placeholder'),
                                  ),
                      ),
                    ),
                    if (generatedImage != null)
                      Positioned(
                        right: 20,
                        bottom: 20,
                        child: GestureDetector(
                          onTap: downloadImage,
                          child: CachedNetworkImage(
                            imageUrl: 'https://dashboard.codeparrot.ai/api/image/Z-pROgz4-w8v6Rro/frame-46.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 160),

              // Generate Button
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFDF4A80),
                      Color(0xFFD0499B),
                      Color(0xFFC249B3),
                      Color(0xFFB748C7),
                      Color(0xFFBA51DC),
                      Color(0xFFA748E2),
                      Color(0xFF9747FF),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: fetchGeneratedImage,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    shadowColor: Colors.transparent,
                    elevation: 0,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: const Text('Generate New Ideas'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
