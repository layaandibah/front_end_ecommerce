import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../core/constant/color.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final void Function()? onPressedNotification;
  final void Function()? onPressedFavorite;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController? mycontroller;
  const CustomAppBar(
      {Key? key,
      required this.title,
      required this.onPressedNotification,
      required this.onPressedSearch,
      required this.onPressedFavorite,
      required this.onChanged,
      required this.mycontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
              height: 60,
              child: TextFormField(
                onChanged: onChanged,
                controller: mycontroller,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: onPressedSearch,
                        icon: const Icon(Icons.search)),
                    hintText: title,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: AppColor.textFormfieldcolor),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: AppColor.textFormfieldcolor,
                  borderRadius: BorderRadius.circular(5)),
              child: IconButton(
                icon: const Icon(
                  Ionicons.heart_outline,
                  color: AppColor.gray,
                  size: 25,
                ),
                onPressed: onPressedFavorite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
