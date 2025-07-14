import 'package:brandify/screens/post_creation/ideas/ideas_output_screen.dart';
import 'package:flutter/material.dart';

class IdeasInputScreen extends StatefulWidget {
  const IdeasInputScreen({Key? key}) : super(key: key);

  @override
  _IdeasInputScreenState createState() => _IdeasInputScreenState();
}

class _IdeasInputScreenState extends State<IdeasInputScreen> {
  String selectedPostType = 'Hiring idea';
  final TextEditingController keywordsController =
      TextEditingController(text: '');

  final List<String> postTypes = [
    'Hiring idea',
    'Product Launch',
    'Event Promotion',
    'Contest Announcement',
    'Blog idea',
    'Social Media idea' ,
    'Ad Copy',
    'Product Description',
    'Email Newsletter',
    'SEO Article',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.network(
                        'https://dashboard.codeparrot.ai/api/image/Z-gmsAz4-w8v6Rjk/ion-arro.png',
                        width: 26,
                        height: 26,
                      ),
                    ),
                  ),
                ),

                // Title
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Tell more about your idea to create',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Subtitle
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    '"Turn ideas into impactful content in seconds, revolutionizing your content creation process."',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: Color(0xFFFBFBFB),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Input Fields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      // Type of post dropdown
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFDDDDDD)),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedPostType,
                            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                            dropdownColor: Colors.black,
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedPostType = newValue!;
                              });
                            },
                            items: postTypes.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Keywords input
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFDDDDDD)),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: TextField(
                          maxLines: 3,
                          controller: keywordsController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: 'Keywords',
                            hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              color: Color(0xFFDDDDDD),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40), // Added padding at the bottom

                // Generate Ideas Button
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
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
                    child: MaterialButton(
                     onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IdeasOutputScreen(
          postType: selectedPostType,
          keywords: keywordsController.text,
        ),
      ),
    );
  },
                      
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: const Text(
                        'Generate Ideas',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFBFBFB),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}