import 'package:flutter/material.dart';
import 'package:habitapp/constants/constants.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({
    super.key,
    required this.colorthemeContext,
  });

  final ColorScheme colorthemeContext;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(children: [
      Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.account_circle_rounded,
              size: MediaQuery.of(context).size.width / 3,
            ),
          ),
        ],
      ),
      for (List drawerItem in Constants.drawerList)
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => drawerItem[2],
                ),
              );
            },
            title: Text(drawerItem[0]),
            leading: drawerItem[1],
            selected: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            selectedTileColor: colorthemeContext.secondaryContainer,
          ),
        ),
    ]);
  }
}
