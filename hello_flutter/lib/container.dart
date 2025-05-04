import 'package:flutter/material.dart';
import 'package:hello_flutter/child_one.dart';
import 'package:hello_flutter/child_three.dart';
import 'package:hello_flutter/child_two.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.blue[100]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ChildOne(), ChildTwo(), ChildThree()],
      ),
    );
  }
}
