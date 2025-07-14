import 'package:brandify/components/loading_widget.dart';
import 'package:brandify/config/post_generation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostOutputScreen extends StatefulWidget {
  final String postType;
  final String keywords;

  const PostOutputScreen({
    Key? key,
    required this.postType,
    required this.keywords,
  }) : super(key: key);

  @override
  _PostOutputScreenState createState() => _PostOutputScreenState();
}

class _PostOutputScreenState extends State<PostOutputScreen> {
  String postIdea = '';
  bool isLoading = true;
  bool isExpanded = false; // To toggle full text visibility

  @override
  void initState() {
    super.initState();
    _generateIdeas();
  }
Future<void> _generateIdeas() async {
  setState(() {
    isLoading = true;
  });

  try {
    final captions = await HuggingFaceService.generateIdeas(
      widget.postType,
      widget.keywords,
    );

    setState(() {
      String fullResponse = captions[0];

      // Split response into lines and remove the first line if it contains the prompt
      List<String> lines = fullResponse.split('\n');
      if (lines.isNotEmpty && lines[0].toLowerCase().contains("generate")) {
        lines.removeAt(0);
      }

      // Join the remaining lines as the actual response
      postIdea = lines.join('\n').trim();
      isLoading = false;
    });
  } catch (e) {
    setState(() {
      postIdea = 'Error generating ideas. Please try again.';
      isLoading = false;
    });
  }
}


  String getPreviewText(String text) {
    // Show first 100 characters as preview
    return text.length <= 100 ? text : '${text.substring(0, 100)}...';
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
            children: [
              // Top Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    IconButton(
                      icon: Image.network(
                        'https://dashboard.codeparrot.ai/api/image/Z-j2hwz4-w8v6Rlx/ion-arro.png',
                        width: 26,
                        height: 26,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Text(
                        'Ideas for posts',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Title Card
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

              // Post Idea Display
              Expanded(
                 child: isLoading
      ?  Center(child: LoadingIndicator())
                    : ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 16), // Fixed to bottom: 16
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: Colors.grey.shade400),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 14,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF9747FF),
                                            Color(0xFFC249B3),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 2,
                                      left: 2,
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SelectableText(
                                        isExpanded ? postIdea : getPreviewText(postIdea),
                                        style: TextStyle(
                                          color: Colors.grey.shade300,
                                          fontSize: 16,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                isExpanded = !isExpanded;
                                              });
                                            },
                                            child: Text(
                                              isExpanded ? 'Show less' : 'Read more',
                                              style: TextStyle(
                                                color: Colors.pink,
                                                fontSize: 16,
                                                fontFamily: 'Montserrat',
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.copy, color: Colors.grey.shade300),
                                            onPressed: () {
                                              Clipboard.setData(ClipboardData(text: postIdea));
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('Copied to clipboard!')),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),

              // Generate Button
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: _generateIdeas,
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
                  ).copyWith(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.purple.shade700;
                        }
                        return Colors.purple.shade800;
                      },
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