import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoqueueapp/bloc/auth/auth_bloc.dart';
import 'package:todoqueueapp/bloc/task/task_bloc.dart';
import 'package:todoqueueapp/data/repos/task_repo.dart';
import 'package:todoqueueapp/data/services/auth_service.dart';
import 'package:todoqueueapp/firebase_options.dart';
import 'package:todoqueueapp/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(AuthService()),
        ),
        BlocProvider(
          create: (context) => TaskBloc(TaskRepository()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
