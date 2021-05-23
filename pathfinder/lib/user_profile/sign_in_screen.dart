import 'package:flutter/material.dart';
import 'package:pathfinder/login/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/constants/color_helper.dart';
import 'package:pathfinder/user_profile/home_screen.dart';
import 'package:pathfinder/user_profile/custom_text_field.dart';
import 'package:pathfinder/user_profile/signupscreen.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginBloc loginBloc;
  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
            backgroundColor: whiteColor,
            elevation: 0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: blackColor),
                onPressed: () {
                  Navigator.pop(context);
                })),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // define all states to get current states
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSucced) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is LoginFailed) {
                        return buildError(state.message);
                      } else if (state is LoginSucced) {
                        emailController.text = '';
                        passwordController.text = '';
                        return Container();
                      }
                      return Container();
                    },
                  ),
                ),
                Text(
                  "Fill in the Sign In form",
                  style: TextStyle(fontSize: 20, color: Color(0xFFbc6c25)),
                ),
                CustomTextField(
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                  obscureText: false,
                  controller: emailController,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: "Password",
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                  controller: passwordController,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        signInBtnColor,
                      ),
                    ),
                    onPressed: () {
                      loginBloc.add(SignInButton(
                        email: emailController.text,
                        password: passwordController.text,
                      ));
                    },
                    child: Text('Sign In'),
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        signInBtnColor,
                      )),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUpScreen()));
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget buildError(String message) {
    return Text(message, style: TextStyle(fontSize: 20, color: Colors.red));
  }
}
