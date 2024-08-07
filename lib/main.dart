import 'package:bidding_house/core/utils/imports.dart';
import 'package:bidding_house/core/utils/shared_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedData.init();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyB4BmQOTSX81udqSTedPbXafNNdb3c8n9c',
    appId: '1:1026875238675:android:eb9b516d9bff8ad1ac92e6',
    messagingSenderId: '1026875238675',
    projectId: 'bidding-house-35011',
    storageBucket: 'gs://bidding-house-35011.appspot.com',
  ));

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
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
