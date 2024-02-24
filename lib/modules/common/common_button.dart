import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({Key? key, required this.height, required this.title, required this.onTap}) : super(key: key);

  final double height;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap.call();
      },
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Color(0xFF03045e),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18
            )
          ),
        ),
      ),
    );
  }
}
