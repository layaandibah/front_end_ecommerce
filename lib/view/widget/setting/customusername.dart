import 'package:flutter/cupertino.dart';

class CustomUserNameEmail extends StatelessWidget {
  final String name;
  final String email;
  const CustomUserNameEmail({Key? key, required this.name, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:const EdgeInsets.only(top: 20),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        Container(margin:const EdgeInsets.only(top: 5),
          child: Text(
           email,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
