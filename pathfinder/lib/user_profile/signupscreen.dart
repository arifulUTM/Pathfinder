import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/constants/color_helper.dart';
import 'package:pathfinder/register/bloc/register_bloc.dart';
import 'package:pathfinder/user_profile/home_screen.dart';
import 'package:pathfinder/user_profile/sign_in_screen.dart';
import 'package:pathfinder/user_profile/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RegisterBloc registerBloc;
  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
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
                BlocListener<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSucced) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                    }
                  },
                  child: BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      if (state is RegisterLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is RegisterFailed) {
                        return buildError(state.message);
                      } else if (state is RegisterSucced) {
                        emailController.text = '';
                        passwordController.text = '';
                        return Container();
                      }
                      return Container();
                    },
                  ),
                ),
                Text(
                  "Fill in the application form",
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
                      registerBloc.add(SignUpButton(
                        email: emailController.text,
                        password: passwordController.text,
                      ));
                    },
                    child: Text('Sign Up'),
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
                            MaterialPageRoute(builder: (_) => SignInScreen()));
                      },
                      child: Text('Sign In'),
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
