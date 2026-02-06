import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    String cleanedText = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Check if the cleaned text starts with '84' and remove it
    if (cleanedText.startsWith('84')) {
      cleanedText = '0${cleanedText.substring(2)}';
    }

    // Display the formatted text
    return newValue.copyWith(
      text: _formatPhoneNumber(cleanedText),
      selection: TextSelection.collapsed(
        offset: _formatPhoneNumber(cleanedText).length,
      ),
    );
  }

  String _formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length <= 3) {
      return phoneNumber;
    } else if (phoneNumber.length <= 7) {
      return '${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3)}';
    } else {
      return '${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    }
  }
}
