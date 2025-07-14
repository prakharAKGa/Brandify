import 'package:brandify/components/loading_widget.dart';
import 'package:brandify/config/caption_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IdeasForPost extends StatefulWidget {
  final String postType;
  final String keywords;

  const IdeasForPost({
    Key? key,
    required this.postType,
    required this.keywords,
  }) : super(key: key);

  @override
  _IdeasForPostState createState() => _IdeasForPostState();
}

class _IdeasForPostState extends State<IdeasForPost> {
  List<String> postIdeas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _generateIdeas();
  }

  Future<void> _generateIdeas() async {
    setState(() {
      isLoading = true; // Show loading indicator while fetching new ideas
    });

    try {
      final captions = await HuggingFaceService.generateCaptions(
        widget.postType,
        widget.keywords,
      );
      setState(() {
        // Split the response and filter out the prompt
        String fullResponse = captions[0];
        String prompt = "Generate 5 catchy captions for a ${widget.postType} using these keywords: ${widget.keywords}";
        List<String> allLines = fullResponse.split('\n').where((line) => line.trim().isNotEmpty).toList();

        // Remove the prompt line and keep only the captions
        postIdeas = allLines
            .where((line) => !line.contains(prompt))
            .map((line) => line.trim())
            .toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        postIdeas = ['Error generating ideas. Please try again.'];
        isLoading = false;
      });
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
                        'Ideas for captions',
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

              // Post Ideas List
              Expanded(
                child: isLoading
      ?  Center(child: LoadingIndicator())
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: postIdeas.length,
                        itemBuilder: (context, index) {
                          return Container(
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
                                        postIdeas[index],
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
                                            onPressed: () {},
                                            child: Text(
                                              'Read more',
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
                                              Clipboard.setData(ClipboardData(text: postIdeas[index]));
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
                          );
                        },
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