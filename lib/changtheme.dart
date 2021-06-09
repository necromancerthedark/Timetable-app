import 'theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class changeTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<themeProvider>(context);

    return Switch.adaptive(
        value: themeprovider.isDarkMode,
        onChanged: (value) {
          final provider = Provider.of<themeProvider>(context, listen: false);
          provider.toggletheme(value);
        });
  }
}
