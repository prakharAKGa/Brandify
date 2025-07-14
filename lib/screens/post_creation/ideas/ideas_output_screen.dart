import 'package:brandify/components/loading_widget.dart';
import 'package:brandify/config/idea_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IdeasOutputScreen extends StatefulWidget {
  final String postType;
  final String keywords;

  const IdeasOutputScreen({
    Key? key,
    required this.postType,
    required this.keywords,
  }) : super(key: key);

  @override
  _IdeasOutputScreenState createState() => _IdeasOutputScreenState();
}

class _IdeasOutputScreenState extends State<IdeasOutputScreen> {
  List<String> postIdeas = []; // Store multiple ideas
  bool isLoading = true;

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

        // Split the response into separate ideas using double line breaks as separator
        postIdeas = fullResponse
            .split("\n\n") // Assuming AI generates multiple ideas separated by double newlines
            .map((idea) => idea.trim())
            .where((idea) => idea.isNotEmpty) // Remove empty strings
            .toList();

if (postIdeas.isNotEmpty && postIdeas[0].toLowerCase().contains("generate")) {
        postIdeas.removeAt(0);
      }
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
                    Expanded(
                      child: Text(
                        "Ideas for ${widget.postType}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
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
                    : postIdeas.isEmpty
                        ? const Center(
                            child: Text(
                              "No ideas generated. Try again.",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: postIdeas.length,
                            itemBuilder: (context, index) {
                              String idea = postIdeas[index];
                              bool isExpanded = false; // Track expansion per card

                              return StatefulBuilder(
                                builder: (context, setStateInner) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 16),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(color: Colors.grey.shade400),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SelectableText(
                                          isExpanded ? idea : "${idea.substring(0, 100)}...",
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
                                                setStateInner(() {
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
                                                Clipboard.setData(ClipboardData(text: idea));
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(content: Text('Copied to clipboard!')),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
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
