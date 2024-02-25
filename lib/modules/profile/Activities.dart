import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Activitie extends StatelessWidget {
  final  Nameimage;
  final String ActivitieName;
  final Color ContainerColor;

  const Activitie(
      {super.key,
      required this.Nameimage,
      required this.ActivitieName,
      required this.ContainerColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: 75,
            height: 70,
            decoration:  BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.circular(10)),
                color:ContainerColor),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/"+Nameimage,
                  width: 60,
                  height: 60,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 5,
                ),
                 Text(
                  ActivitieName,
                  style:const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
