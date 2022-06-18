import 'package:flutter/material.dart';

import 'constants.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(221, 226, 239, 1.0),
      child: ListView(
        children: [
          SizedBox(height: 50),
          MenuCardList(press: () {}, title: 'Daashboard'),
          MenuCardList(press: () {}, inactiveColor: true, title: 'Media'),
          MenuCardList(press: () {}, title: 'Video'),
          MenuCardList(press: () {}, title: 'Audio'),
          MenuCardList(press: () {}, title: 'Text'),
          MenuCardList(press: () {}, title: 'Content'),
          MenuCardList(press: () {}, title: 'Progress'),
          MenuCardList(press: () {}, title: 'Template'),
          MenuCardList(press: () {}, title: 'Setting'),
          MenuCardList(press: () {}, title: 'Suport'),
        ],
      ),
    );
  }
}

class MenuCardList extends StatelessWidget {
  const MenuCardList({
    Key? key,
    required this.title,
    required this.press,
    this.inactiveColor = false,
  }) : super(key: key);
  final String title;

  final VoidCallback press;
  final bool inactiveColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Container(
        color: inactiveColor ? kPrimaryColor : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            onTap: press,
            horizontalTitleGap: 0.0,
            title: Text(
              title,
              style: TextStyle(
                  color: inactiveColor
                      ? Color.fromARGB(255, 35, 34, 34)
                      : Color.fromARGB(255, 126, 124, 124)),
            ),
          ),
        ),
      ),
    );
  }
}
