import 'package:flutter/material.dart';
import 'package:vacua_app/components/buttonWidget.dart';
import 'package:vacua_app/components/inputWidget.dart';

class MakeReservation extends StatelessWidget {
  const MakeReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Center(
            child: Text(
              "Make Reservation",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          const ListTile(
            title: Text("Hall Name"),
            subtitle: Text("Hall Name"),
            trailing: Icon(Icons.arrow_drop_down),
          ),
          CustomInputField(
            controller: TextEditingController(),
            hintText: "Course Name",
          ),
          const SizedBox(height: 20.0),
          CustomInputField(
            controller: TextEditingController(),
            hintText: "Course Code",
          ),
          const SizedBox(height: 20.0),
          CustomInputField(
            controller: TextEditingController(),
            hintText: "Course Lecturer",
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            child: CustomButton(
              label: "Reserve",
              textColor:  const Color.fromRGBO(255, 255, 255, 1),
              buttonColor: const Color.fromRGBO(146, 29, 218, 1),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
