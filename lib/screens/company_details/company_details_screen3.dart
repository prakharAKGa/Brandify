import 'dart:io';

import 'package:brandify/screens/company_details/widgets/color_pallete_upload.dart';
import 'package:brandify/screens/company_details/widgets/color_picker.dart';
import 'package:brandify/screens/company_details/widgets/logo_uploader.dart';
import 'package:brandify/screens/company_details/widgets/screen_navigation.dart';
import 'package:brandify/screens/company_details/widgets/title_section.dart';
import 'package:brandify/screens/company_details/widgets/top_bar.dart';
import 'package:brandify/screens/home_page/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key, required int currentStep}) : super(key: key);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  File? transparentLogo;
  File? backgroundLogo;
  File? colorPalette;
  List<Color> selectedColors = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(int type) async {
    if (Platform.isAndroid) {
      if (await _requestPermission()) {
        _selectImage(type);
      } else {
        print("Storage permission denied");
      }
    } else if (Platform.isIOS) {
      var status = await Permission.photos.request();
      if (status.isGranted) {
        _selectImage(type);
      } else {
        print("Photos permission denied");
      }
    }
  }

  Future<bool> _requestPermission() async {
    if (Platform.isAndroid) {
      if (await Permission.storage.isGranted ||
          await Permission.mediaLibrary.isGranted) {
        return true;
      }
      if (await Permission.photos.isGranted ||
          await Permission.videos.isGranted ||
          await Permission.audio.isGranted) {
        return true;
      }
      var status = await (Platform.version.startsWith("13") ||
              Platform.version.startsWith("14"))
          ? Permission.photos.request()
          : Permission.storage.request();

      return status.isGranted;
    }
    return false;
  }

  Future<void> _selectImage(int type) async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          if (type == 1) {
            transparentLogo = File(image.path);
          } else if (type == 2) {
            backgroundLogo = File(image.path);
          } else {
            colorPalette = File(image.path);
          }
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  void _uploadColorsToBackend() {
    List<String> colorHexList = selectedColors
        .map((color) => "#${color.value.toRadixString(16).substring(2).toUpperCase()}")
        .toList();

    print("Uploading selected colors: $colorHexList");

    // TODO: Implement API call to send `colorHexList` to backend
  }

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const TopBar(currentStep: 2),
                  const SizedBox(height: 20),
                  const SizedBox(height: 40),
                  const TitleSection(),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LogoUploader(
                        label: 'Brand logo\n(transparent)',
                        image: transparentLogo,
                        onTap: () => _pickImage(1),
                      ),
                      LogoUploader(
                        label: 'Brand logo\n(with background)',
                        image: backgroundLogo,
                        onTap: () => _pickImage(2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  ColorPaletteUploader(
                    colorPalette: colorPalette,
                    onTap: () => _pickImage(3),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Colors.white)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select colors',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ColorPicker(
  onColorsSelected: (colors) {  // ✅ Correct parameter name
    setState(() {
      selectedColors = colors;
    });
    _uploadColorsToBackend();
  },
),

                  const SizedBox(height: 40),
                  NextButton(nextPage: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>   BottomNavBar(),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
