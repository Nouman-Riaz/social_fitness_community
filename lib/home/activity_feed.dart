import 'package:flutter/material.dart';
import 'package:softech/home/user_posts.dart';


class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.arrow_back),
        // ),
        title: const Text(
          'Fitness Community',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: 15,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 30,
          ),
          itemBuilder: (BuildContext context, int index) {
            return const UserPost(name: 'hassan', caption: 'none');
          },
        ),
      ),
    );
  }
}
