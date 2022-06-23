import 'package:billingsystem/modules/register_screen/register_screen.dart';
import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatelessWidget {
  var emailController = TextEditingController();

  var PassController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool ispass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                        image: AssetImage('assets/images/login.png'),
                        height: 240,
                        width: 600),
                  ),
                  Text(
                    'LOGIN',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
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
                      type: TextInputType.emailAddress,
                      onChange: (value) {
                        print(value);
                      },
                      onSubmit: (value) {
                        print(value);
                      },
                      label: 'Email',
                      prefixIcon: Icons.email_outlined,
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
                  defaultButton(
                    width: double.infinity,
                    height: 50,
                    function: () {
                      if (formkey.currentState!.validate()) {
                        print(emailController.text);
                        print(PassController.text);
                      }
                    },
                    text: 'SIGN IN',
                  ),
                  Row(
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: Theme.of(context).textTheme.overline!.copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => registerScreen()));
                          },
                          child: Text(
                            'Register Now',
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
