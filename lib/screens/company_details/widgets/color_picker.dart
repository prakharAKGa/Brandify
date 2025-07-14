import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  final Function(List<Color>) onColorsSelected;

  const ColorPicker({Key? key, required this.onColorsSelected}) : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Color selectedColor = Colors.red;
  List<Color> selectedColors = [];

  void _addColor() {
    if (!selectedColors.contains(selectedColor) && selectedColors.length < 6) {
      setState(() {
        selectedColors.add(selectedColor);
      });
      widget.onColorsSelected(selectedColors);
    }
  }

  void _removeColor(Color color) {
    setState(() {
      selectedColors.remove(color);
    });
    widget.onColorsSelected(selectedColors);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Color Slider with Gradient
        Container(
          height: 20,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.red,
                Colors.orange,
                Colors.yellow,
                Colors.green,
                Colors.cyan,
                Colors.blue,
                Colors.purple,
                Colors.red,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 20,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
              trackShape: const RectangularSliderTrackShape(),
              thumbColor: Colors.white,
              activeTrackColor: Colors.transparent,
              inactiveTrackColor: Colors.transparent,
            ),
            child: Slider(
              min: 0.0,
              max: 360.0,
              value: HSVColor.fromColor(selectedColor).hue,
              onChanged: (value) {
                setState(() {
                  selectedColor = HSVColor.fromAHSV(1.0, value, 1.0, 1.0).toColor();
                });
              },
              onChangeEnd: (value) => _addColor(),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Selected Colors Display
        Wrap(
          spacing: 20,
          children: selectedColors.map((color) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(0), // Square shape
                  ),
                ),
                Positioned(
                  top: -10,
                  left: -10,
                  child: GestureDetector(
                    onTap: () => _removeColor(color),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.rectangle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}