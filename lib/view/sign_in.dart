import 'package:accountapp/theme/colors.dart';
import 'package:accountapp/view/root_page.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String error = '';

  String email = '';
  String password = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TassistWhite,
      appBar: AppBar(
        backgroundColor: TassistPrimary,
        elevation: 0.0,
        title: Text(
          'sign In',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: TassistWhite),
        ),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () => widget.toggleView(),
            icon: Icon(
              Icons.person,
              color: Colors.white, // Use Colors.white or your defined color
            ),
            label: Text(
              'Register',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: TassistWhite),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                style: Theme.of(context).textTheme.bodyText2,
                decoration: InputDecoration(
                    icon: Icon(Icons.email, color: TassistPrimaryBackground),
                    hintText: 'Enter your email ID please',
                    hintStyle: Theme.of(context).textTheme.bodyText2,
                    labelText: 'Email'),
                validator: (val) =>
                    val?.isEmpty ?? true ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                style: Theme.of(context).textTheme.bodyText2,
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key, color: TassistPrimaryBackground),
                    hintText: 'Enter your password please',
                    hintStyle: Theme.of(context).textTheme.bodyText2,
                    labelText: 'Password'),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Enter a password';
                  } else if (val.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null; // Return null if validation passes
                },
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: TassistPrimaryBackground, // Background color
                  elevation: 20.0, // Elevation
                ),
                onPressed: () async {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => RootPage(),
                    ),
                  );

                  // if (_formKey.currentState!.validate()) {
                  //   setState(() => loading = true);
                  //   // dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                  //   if (result == null) {
                  //     setState(() {
                  //       loading = false;
                  //       error = 'Could not sign in with those credentials';
                  //     });
                  //   } else {
                  //     Navigator.of(context).pushReplacement(
                  //       MaterialPageRoute(
                  //         builder: (context) => RootPage(),
                  //       ),
                  //     );
                  //   }
                  // }
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
