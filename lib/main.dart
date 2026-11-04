
import 'package:find_my_apartment/Data/pictures.dart';
import 'package:find_my_apartment/Domain/auth/auth_layout.dart';
import 'package:find_my_apartment/Presentation/states/auth_provider.dart';
import 'package:find_my_apartment/Presentation/states/like_provider.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialise Hive
  await Hive.initFlutter();
  // Open the local database
  final propertyBox = await Hive.openBox('properties');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => LikeProvider()
            ..initializePictures(demo_pic_list),
        ),

        ChangeNotifierProvider(
      create: (_) => PropertyProvider(propertyBox),
    ),

        // Makes the Hive box accessible to widgets/services
        Provider<Box<dynamic>>.value(
          value: propertyBox,
        ),
      ],
      child: const Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Auth_layout(),
    );
  }
}
