class TextFormFieldValidation {
  static String nameValidation({required String value}) {
    if (value.isEmpty) {
      return 'Please fill in the name field';
    } else if (value.contains(RegExp(r'[^\w\s]'))) {
      return 'invalid name format';
    } else if (RegExp(r'[0-9]').hasMatch(value)) {
      return 'invalid name format';
    }
    return "";
  }

  static String amountValidation({required String value}) {
    if (value == null || value.isEmpty) {
      return 'Amount is required';
    }
    final number = double.tryParse(value);
    if (number == null) {
      return 'Enter a valid number';
    }
    if (number <= 0) {
      return 'Amount must be greater than zero';
    }
    // if (number > 1000000) {
    //   return 'Amount cannot exceed 1,000,000';
    // }
    if (value.contains('.') && value.split('.')[1].length > 2) {
      return 'Only two decimal places allowed';
    }
    return ""; // Valid input
  }

  static String ageValidationWithoutReturnMessages({required String value}) {
    if (value.isEmpty) {
      return '';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return '';
    } else if (int.parse(value) >= 110 || int.parse(value) <= 0) {
      return '';
    } else {
      return "";
    }
  }

  static String emailValidation({required String value}) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (value.isEmpty) {
      return 'Please fill in the Email field';
    } else if (emailRegex.hasMatch(value)) {
      return 'invalid email format';
    }
    return "";
  }

  static String phoneNumberValidation({required String value}) {
    if (value.isEmpty) {
      return 'Please fill in the phone number field';
    } else if (value.length != 10) {
      return 'invalid phone number format';
    } else if (value.contains(RegExp(r'[^\w\s]_-()&^%$#@!'))) {
      return 'invalid phone number format';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'invalid phone number format';
    }
    return "";
  }

  static String passwordValidation({required String value}) {
    if (value.isEmpty) {
      return 'Please fill in the password field';
    } else if (RegExp(r'^[!@#\$%^&*(),.?":{}|<>]+$').hasMatch(value)) {
      return 'invalid password';
    } else if (value.length <= 5) {
      return 'Must be at least 6 characters long'; //Password must be at least 6 characters long
    }
    if (RegExp(r'^[A-Z]+$').hasMatch(value)) {
      return 'invalid password';
    }
    if (RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'invalid password';
    }
    if (value.contains(' ')) {
      return "Spaces are not allowed";
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Must have one lowercase letter'; //Must have one lowercase letter
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Must have one uppercase letter'; //Must have one uppercase letter
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number'; //Password must contain at least one number
    }
    return "";
  }
}

bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  return emailRegex.hasMatch(email);
}
