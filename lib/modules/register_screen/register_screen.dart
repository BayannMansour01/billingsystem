import 'package:billingsystem/modules/login_Screen/login_screen.dart';
import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:flutter/material.dart';

class registerScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var businessname = TextEditingController();
  var phone = TextEditingController();
  var PassController = TextEditingController();
  var conPassController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool ispass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image(image: "login.jpg" ,height:240 ,width:600 ),
                  Center(
                    child: Image(
                        image: AssetImage('assets/images/login.png'),
                        height: 240,
                        width: 600),
                  ),
                  Text(
                    'SIGN UP',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultextformfield(
                      controlle: businessname,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Email mustn\'t be empty';
                        } else if (!value.contains('@')) {
                          return 'You forget \'@\'';
                        }
                        return null;
                      },
                      type: TextInputType.text,
                      onChange: (value) {
                        print(value);
                      },
                      onSubmit: (value) {
                        print(value);
                      },
                      label: 'Business Name',
                      prefixIcon: Icons.business_outlined,
                      ispassword: false),
                  SizedBox(
                    height: 15,
                  ),
                  defaultextformfield(
                    controlle: emailController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Email mustn\'t be empty';
                      } else if (!value.contains('@')) {
                        return 'You forget \'@\'';
                      }
                      return null;
                    },
                    type: TextInputType.text,
                    onChange: (value) {
                      print(value);
                    },
                    onSubmit: (value) {
                      print(value);
                    },
                    label: 'Email',
                    prefixIcon: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultextformfield(
                      controlle: phone,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Phone mustn\'t be empty';
                        }
                        return null;
                      },
                      type: TextInputType.text,
                      onChange: (value) {
                        print(value);
                      },
                      onSubmit: (value) {
                        print(value);
                      },
                      label: 'Phone Number',
                      prefixIcon: Icons.phone_outlined,
                      ispassword: false),
                  SizedBox(
                    height: 15,
                  ),

                  defaultextformfield(
                    controlle: PassController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Password is too short';
                      }
                      return null;
                    },
                    onChange: (value) {
                      print(value);
                    },
                    onSubmit: (value) {
                      print(value);
                    },
                    ispassword: ispass,
                    type: TextInputType.visiblePassword,
                    obscureText: ispass,
                    label: 'Password',
                    prefixIcon: Icons.lock_outlined,
                    suffixIcon: ispass
                        ? Icons.visibility
                        : Icons.visibility_off_outlined,
                    suffixPressed: () {
                      //   setState(() {
                      //     ispass = !ispass;
                      //   });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultextformfield(
                    controlle: conPassController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Password is too short';
                      } else if (value != PassController) {
                        return 'No Matching with password';
                      }
                      return null;
                    },
                    onChange: (value) {
                      print(value);
                    },
                    onSubmit: (value) {
                      print(value);
                    },
                    ispassword: ispass,
                    type: TextInputType.visiblePassword,
                    obscureText: ispass,
                    label: 'Confirm Password',
                    prefixIcon: Icons.lock_outlined,
                    suffixIcon: ispass
                        ? Icons.visibility
                        : Icons.visibility_off_outlined,
                    suffixPressed: () {
                      //   setState(() {
                      //     ispass = !ispass;
                      //   });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  defaultButton(
                    width: double.infinity,
                    height: 50,
                    function: () {
                      if (formkey.currentState!.validate()) {
                        print(emailController.text);
                        print(PassController.text);
                      }
                    },
                    text: 'SIGN UP',
                  ),
                  Row(
                    children: [
                      Text(
                        'Already have an account?',
                        style: Theme.of(context).textTheme.overline!.copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => loginScreen()));
                          },
                          child: Text(
                            'LOGIN',
                            style: Theme.of(context)
                                .textTheme
                                .overline!
                                .copyWith(
                                    color: Colors.green,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
