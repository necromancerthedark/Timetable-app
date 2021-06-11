import 'package:timetable/floatingButton.dart';
import 'package:timetable/import_libs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => themeProvider(),
        builder: (context, _) {
          final themeprovider = Provider.of<themeProvider>(context);
          return MaterialApp(
            theme: MyTheme.lightMode,
            darkTheme: MyTheme.darkMode,
            themeMode: themeprovider.themeMode,
            debugShowCheckedModeBanner: false,
            title: "Class Links",
            home: homePage(),
          );
        },
      );
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Upperbar(),
      body: dataToList(URL["CS3"]),
      bottomNavigationBar: Text(
        "Made with ♥ by Kumar Gaurav in Flutter",
        textAlign: TextAlign.center,
      ),
      floatingActionButton: floatingButton(),
    );
  }
}
