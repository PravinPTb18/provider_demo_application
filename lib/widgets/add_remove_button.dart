import 'package:flutter/material.dart';

class AddRemoveButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? buttonText;
  const AddRemoveButton({super.key, this.onTap, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.white.withOpacity(0.4)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          onPressed: onTap ?? () {},
          child: Text(
            buttonText ?? "",
            style: TextStyle(color: Colors.white),
          )),
    );
    ;
  }
}
