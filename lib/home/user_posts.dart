import 'package:flutter/material.dart';

class UserPost extends StatefulWidget {
  final String name;
  final String caption;
  const UserPost({Key? key, required this.name, required this.caption}) : super(key: key);

  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                widget.name,
                textAlign: TextAlign.left,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          height: screenHeight * 0.5,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.caption, 
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
