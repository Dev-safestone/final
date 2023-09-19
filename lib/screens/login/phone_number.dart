import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberTextField extends StatefulWidget {
  final String countryCode;
  final void Function(String) onPhoneNumberChanged;
  //final void Function(String) onPhoneNumberChanged;

  PhoneNumberTextField({
    this.countryCode = '',
    required this.onPhoneNumberChanged,
    //required this.onPhoneNumberChanged,
  });

  @override
  PhoneNumberSignupTextFieldState createState() =>
      PhoneNumberSignupTextFieldState();
}

bool isValidIndianPhoneNumber(String phoneNumber) {
  // Define a regular expression for a 10-digit Indian phone number without "+91"
  final RegExp phoneRegex = RegExp(r'^[789]\d{9}$');

  // Use the regular expression to check if the phone number matches
  return phoneRegex.hasMatch(phoneNumber);
}

class PhoneNumberSignupTextFieldState
    extends State<PhoneNumberTextField> {
      
  TextEditingController phoneNumberController = TextEditingController();
 static String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFF3B3B3B),
            borderRadius: BorderRadius.circular(11.62),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 40,
                child: Text(
                  widget.countryCode,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                  ),
                ),
              ),
              const Text(
                "|",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF5B5B5B),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        controller: phoneNumberController,
                  onChanged: (value) {
                    PhoneNumberSignupTextFieldState.phoneNumber = value;
                    setState(() {
                      phoneNumber = value; // Update the phoneNumber variable
                    });
                    widget.onPhoneNumberChanged(
                      value,
                    ); // Use the updated value directly

                    // Check if 10 digits are entered before showing the error
                    if (value.length == 10) {
                      // Validate as an Indian phone number
                      if (!isValidIndianPhoneNumber(value)) {
                        // Show a Snackbar with the error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Invalid phone number.'),
                          ),
                        );
                      }
                    }
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Mobile number',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.42,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
