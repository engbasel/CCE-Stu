import 'package:cce_app/Core/manager/ColorsManager.dart';
import 'package:flutter/material.dart';

class CoustomDrawer extends StatelessWidget {
  const CoustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: ColorsManager.AppBarColor,
          ),
          child: Text(
            'Drawer Header',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ]),
    );
  }
}
