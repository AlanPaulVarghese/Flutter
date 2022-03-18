import 'package:ecommerceapp/models/auth.dart';
import 'package:ecommerceapp/models/httperror.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var loginState = true;
  var isloading = false;
  late final TextEditingController email;
  late final TextEditingController pass;
  late final TextEditingController confirmPass;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    email = TextEditingController();
    pass = TextEditingController();
    confirmPass = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    confirmPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    "My Shop",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 40,
                        fontWeight: FontWeight.w900),
                  ))),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      //hintText: "Email",
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter a Email";
                    }
                    if (!RegExp(
                            "^[a-zA-Z0-9.! #%&'*+/=? ^_`{|}~-]+@[a-zA-Z0-9-]+(?:. [a-zA-Z0-9-]+)*")
                        .hasMatch(val)) {
                      return "Enter a vaild Email";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                child: TextFormField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.key),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter a Password";
                    }
                    if (val.length < 6) {
                      return "Enter a password with min 6 length";
                    }
                    return null;
                  },
                ),
              ),
              if (!loginState)
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                  child: TextFormField(
                    controller: confirmPass,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Confirm Password",
                        prefixIcon: const Icon(Icons.key),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    validator: (v) {
                      if (pass.text != v) {
                        return "Password does not match";
                      }
                      return null;
                    },
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              if (isloading) const CircularProgressIndicator(),
              if (!isloading)
                Column(
                  children: [
                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: ElevatedButton(
                              onPressed: () async {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }
                                try {
                                  if (!loginState) {
                                    //reg
                                    setState(() {
                                      isloading = true;
                                    });
                                    await Provider.of<Auth>(context,
                                            listen: false)
                                        .reg(
                                            userEmail: email.text,
                                            password: pass.text);
                                  }
                                  setState(() {
                                    isloading = true;
                                  });

                                  await Provider.of<Auth>(context,
                                          listen: false)
                                      .login(
                                          userEmail: email.text,
                                          password: pass.text);
                                } on HttpError catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(e.mess)));
                                } catch (e) {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) => const AlertDialog(
                                            content: Text("An error Ocurred!"),
                                          ));
                                } finally {
                                  setState(() {
                                    isloading = false;
                                  });
                                }
                              },
                              child: !loginState
                                  ? const Text("create a new account")
                                  : const Text("Login"),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )))),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    TextButton(
                        onPressed: () {
                          loginState = !loginState;
                          setState(() {});
                        },
                        child: loginState
                            ? const Text("create a new account")
                            : const Text("Login")),
                  ],
                ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }
}

/*

















*/
