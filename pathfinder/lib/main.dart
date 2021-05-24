import 'package:flutter/material.dart';
import 'package:pathfinder/nearby/screens/home_screen.dart';
import 'package:pathfinder/register/bloc/register_bloc.dart';
import 'package:pathfinder/user_profile/Users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/user_profile/home_screen.dart';
import 'package:pathfinder/user_profile/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pathfinder/login/bloc/login_bloc.dart';
import 'package:provider/provider.dart';
import 'auth/bloc/auth_bloc.dart';
import 'package:pathfinder/nearby/blocs/application_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Users users;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Applicationbloc(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(users: users),
          ),
          BlocProvider(
            create: (context) => RegisterBloc(users: users),
          ),
          BlocProvider(
            create: (context) => LoginBloc(users: users),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeeScreen(),
          // BlocProvider(
          //   create: (context) =>
          //       AuthBloc(userRepository: userRepository)..add(AppLoaded()),
          //   child: MainScreen(),
          // ),
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          return SplashScreen();
        }
        if (state is UnAuthenticateState) {
          return SplashScreen();
        } else if (state is AuthenticateState) {
          return HomeScreen();
        }

        return Container();
      },
    );
  }
}
