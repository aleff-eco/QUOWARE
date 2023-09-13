import 'package:flutter/material.dart';
import '../Provider_/view_main_provider.dart';
import '../Provider_/profileProvider.dart';

class provider_appbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _provider_appbarState createState() => _provider_appbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _provider_appbarState extends State<provider_appbar> {
  bool _isProfileView = true;

  void _toggleView() {
    setState(() {
      _isProfileView = !_isProfileView;
    });
  }

  void _navigateToView() {
    if (_isProfileView) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Provider_Profile(userName: AutofillHints.username, userId: 0)),
      ).then((value) => _toggleView());
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ViewMain()),
      ).then((value) => _toggleView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFE5E5E5),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.home,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ViewMain()),
          ).then((value) => _toggleView());
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.more_vert,
            color: Colors.black,
            size: 32,
          ),
          onPressed: _navigateToView,
        ),
      ],
      flexibleSpace: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 120,
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Image.asset(
              'assets/logoL.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
