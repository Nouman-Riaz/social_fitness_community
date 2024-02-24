import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../models/EventModel.dart';


class EventsView extends StatelessWidget {
  EventsView({Key? key}) : super(key: key);

  final List<EventModel> events = [EventModel(title: 'Event 1', img: 'assets/barbell.png', date: '2022-12-12'), EventModel(title: 'Event 2', img: 'assets/barbell.png', date: '2022-12-12'), EventModel(title: 'Event 3', img: 'assets/barbell.png', date: '2022-12-12'), EventModel(title: 'Event 4', img: 'assets/barbell.png', date: '2022-12-12'), EventModel(title: 'Event 5', img: 'assets/barbell.png', date: '2022-12-12')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          const Center(
            child: Text('Events', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),),
          SizedBox(
            height: height * 0.03,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
                itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.015, horizontal: width * 0.05),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300]!,
                        blurRadius: 12,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: ClipOval(
                      child: Image.asset(events[index].img, width: width * 0.09,),
                    ),
                    title: Text(events[index].title, style: const TextStyle(fontWeight: FontWeight.w700),),
                    subtitle: Text(events[index].date),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
