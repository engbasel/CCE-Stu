// import 'package:cce_app/Core/utlis/utilis.dart';
import 'package:cce_app/Core/manager/ColorsManager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GreetingSection extends StatelessWidget {
  final String studentName;
  bool billIsActive = false;
  GreetingSection({Key? key, this.studentName = 'Basel Embaby'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenUtils = ScreenUtils();
    // final greetingMessage = '${screenUtils.getGreeting()}, $studentName!';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.05,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   greetingMessage,
                //   style: Theme.of(context).textTheme.headlineSmall,
                //   overflow: TextOverflow.ellipsis,
                // ),

                Text(
                  'Hello Basel',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'ID:8087896',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () {
              // Toggle the state when the button is pressed
              billIsActive = !billIsActive;
            },
            icon: Icon(
              color: ColorsManager.billIconColor,
              billIsActive
                  ? Icons.notifications_active
                  : Icons.notifications_off,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.list,
              color: ColorsManager.billIconColor,
            ),
            iconSize: MediaQuery.of(context).size.width * 0.07,
          ),
        ],
      ),
    );
  }
}
