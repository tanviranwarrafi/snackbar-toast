import 'package:flutter/material.dart';
import 'package:tutorial/components/buttons/elevate_button.dart';
import 'package:tutorial/libraries/toast_popup.dart';
import 'package:tutorial/themes/colors.dart';
import 'package:tutorial/themes/text_styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: const Text('Toast & SnackBar Tutorial'),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 120),
            const Icon(Icons.message_outlined, size: 80, color: primary),
            const SizedBox(height: 40),
            ElevateButton(label: 'Show Toast', onTap: _showToast),
            const SizedBox(height: 20),
            ElevateButton(label: 'Show SnackBar', onTap: () => _showSnackBar(context)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> _showToast() async {
    var message = 'Cheers! Your remote opportunity with TELUS International AI is confirmed!';
    ToastPopup.onWarning(message: message, isTop: true);
  }

  Future<void> _showSnackBar(BuildContext context) async {
    var text =
        'Congratulations! Your part-time remote opportunity with TELUS International AI has been successfully confirmed. Get ready to enjoy flexible work hours from the comfort of your home!';
    var snackBar = SnackBar(content: Text(text, style: TextStyles.text15_500.copyWith(color: white)), backgroundColor: primary);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
