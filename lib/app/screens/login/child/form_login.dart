import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_snackbars/enums/animate_from.dart';
import 'package:smart_snackbars/smart_snackbars.dart';
import 'package:transisi/app/bloc/auth/auth_bloc.dart';
import 'package:transisi/app/screens/login/child/snackbar.dart';
import 'package:transisi/app/utilities/theme.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Icon sufix = const Icon(Icons.lock_outline);

  bool? secure;
  @override
  void initState() {
    super.initState();
    secure = true;
  }

  @override
  Widget build(BuildContext context) {
    final _authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          return snackBar(context, state.err.toString());
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
              child: SizedBox(
            child: Lottie.asset("lottie/loading.zip", width: 250),
          ));
        }
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: Lottie.asset("lottie/hello.zip"),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: blackColor),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "To",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: blackColor),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Transisi",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Please login to start",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: blackColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 10.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1, color: greyColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1, color: primaryColor),
                      ),
                      // labelText: 'Email',
                      hintText: "Email"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: secure!,
                  controller: passwordController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 10.0),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 1, color: greyColor),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 1, color: primaryColor),
                    ),
                    // labelText: 'Password',
                    suffixIcon: IconButton(
                      color: primaryColor,
                      onPressed: () {
                        setState(() {
                          secure = !secure!;
                        });
                      },
                      icon: secure!
                          ? const Icon(Icons.lock_outline)
                          : const Icon(Icons.lock_open),
                    ),

                    hintText: "Password",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    _authBloc.add(GetAuth(
                      email: emailController.text,
                      password: passwordController.text,
                    ));
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 14,
                            color: backgoundColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
