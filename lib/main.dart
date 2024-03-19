import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:farmer/provider/auth_page.dart';
import 'package:farmer/provider/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'config/routes/routes.dart';
import 'controller/home_controller.dart';
import 'firebase_options.dart';
import 'ui/screens/onboarding_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(HomeController());
  AwesomeNotifications().initialize(null,
      [
        NotificationChannel(channelKey: 'basic_channel',
            channelName: 'basic notifications',
            channelDescription: 'Notification channel for basic tests',
        ),
      ],
    debug: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_)=> AuthProvider1())
      ],
      child: GetMaterialApp(
        title: 'Onboarding Screen',
        home: AuthPage(),
        // home: MyHomePage(title:'Notification'),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}

