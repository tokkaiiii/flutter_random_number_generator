import 'package:flutter/material.dart';
import 'package:random_number_generator/component/number_to_image.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Number(
                maxNumber: maxNumber,
              ),
              _Slider(value: maxNumber, onChanged: onSliderChanged),
              _Button(),
            ],
          ),
        ),
      ),
    );
  }

  void onSliderChanged(double value) {
    setState(() {
      maxNumber = value;
    });
  }
}

class _Button extends StatelessWidget {
  const _Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text('저장!'),
    );
  }
}

class _Number extends StatelessWidget {
  final double maxNumber;

  const _Number({
    required this.maxNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: NumberToImage(number: maxNumber.toInt()),
      ),
    );
  }
}

class _Slider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const _Slider({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      min: 1000,
      max: 10000,
      onChanged: onChanged,
    );
  }
}
