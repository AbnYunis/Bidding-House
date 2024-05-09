import 'package:bidding_house/core/utils/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    //   DevicePreview(
    //   enabled: true,
    //   builder: (context) => const MyApp(), // Wrap your app
    // ),

    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.museoModernoTextTheme()
            .copyWith(bodyMedium: const TextStyle(color: Colors.white)),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
