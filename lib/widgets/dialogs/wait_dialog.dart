import 'package:flutter/material.dart';
import 'package:tech_task/_lib.dart';

class WaitDialog extends StatelessWidget {
  const WaitDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: SimpleDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          contentPadding: const EdgeInsets.only(
              left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
          children: [
            Column(
              children: [
                VerticalSpace(10),
                const CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
                VerticalSpace(10),
                const Text("Please wait...",
                    style: TextStyle(
                        fontFamily: "Carmen Sans",
                        fontSize: 14.0,
                        color: Color(0xFF00053A))),
                VerticalSpace(10),
              ],
            )
          ],
        ));
  }
}
