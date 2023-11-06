import 'package:flutter/material.dart';

import '../component/group_widget.dart';

class MyGroup extends StatelessWidget {
  const MyGroup({super.key});

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        '내 모임',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
    );
  }

  // Widget _groupList() {
  //   return Column(
  //     children: [
  //       SizedBox(
  //         height: 15,
  //       ),
  //       ...List.generate(4, (index) => GroupList())
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [_header(),
        //  _groupList()
         ],
      ),
    );
  }
}
