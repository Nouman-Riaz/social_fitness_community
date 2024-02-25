import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:softech/modules/profile/trainingsessions.dart';

import 'Activities.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(25)),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //avatar and notification =>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                            AssetImage('assets/man-avatar.png'),
                            radius: 20,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              const Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 2, top: 5),
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // user name ==>>>

                      const Text(
                        "welcome",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      // progress indicator =>>>>>>>>>>>>>>>>>>>>
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          width: double.infinity,
                          color: Colors.white10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 10.0,
                                  lineWidth: 5.0,
                                  percent: .30,
                                  progressColor: Colors.deepOrange,
                                  backgroundColor: Colors.white,
                                ),
                                const Text(
                                  '  you finished 30% from your goals ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                const Spacer(),
                                Image.asset(
                                  'assets/right-arrow.png',
                                  width: 15,
                                  height: 15,
                                  fit: BoxFit.contain,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Training plane ==========>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

              const Padding(
                padding: EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Training plane',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    // Training plane Activities =====================>>>>>>>>>>

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Activitie(
                              Nameimage: 'cyclist.png',
                              ActivitieName: 'Cycling',
                              ContainerColor: Color.fromARGB(255, 215, 250, 255)),
                          Activitie(
                              Nameimage: 'runner.png',
                              ActivitieName: 'Running',
                              ContainerColor: Color.fromARGB(255, 255, 200, 200)),
                          Activitie(
                              Nameimage: 'trainer.png',
                              ActivitieName: 'CrossFit',
                              ContainerColor: Color.fromARGB(255, 215, 250, 255)),
                          Activitie(
                              Nameimage: 'sit-up.png',
                              ActivitieName: 'Cycling',
                              ContainerColor: Color.fromARGB(255, 255, 200, 200)),
                          Activitie(
                              Nameimage: 'swimming.png',
                              ActivitieName: 'Swimming',
                              ContainerColor: Color.fromARGB(255, 215, 250, 255)),
                        ],
                      ),
                    ),

                    // Training Sessiones ===================>>>>>>>>>>>>>>>>>>>>

                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Training Sessiones',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),


                    Column(
                      children: [
                        TrainingSession(
                          StartTime: '2:00',
                          EndTime: '3:30',
                          SessionName: 'CrossFit',
                          imageName: 'trainer.png',
                          StackColor: Color.fromARGB(255, 215, 250, 255),
                        ),
                        TrainingSession(
                            StartTime: '3:30',
                            EndTime: '4:30',
                            SessionName: 'Cycling',
                            imageName: 'cyclist.png',
                            StackColor: Color.fromARGB(255, 255, 200, 200)
                        ),

                        TrainingSession(
                          StartTime: '8:00',
                          EndTime: '9:30',
                          SessionName: 'Strength',
                          imageName: 'sit-up.png',
                          StackColor: Color.fromARGB(255, 215, 250, 255),
                        ),
                        TrainingSession(
                          StartTime: '10:00',
                          EndTime: '11:30',
                          SessionName: 'Running',
                          imageName: 'runner.png',
                          StackColor: Color.fromARGB(255, 215, 250, 255),
                        ),

                      ],
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
