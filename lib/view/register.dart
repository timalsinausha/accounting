import 'package:accountapp/theme/colors.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String referralCode = '';

  @override
  Widget build(BuildContext context) {
    // return loading ? Loading() : Scaffold(
    return Scaffold(
      backgroundColor: TassistWhite,
      appBar: AppBar(
        backgroundColor: TassistPrimaryBackground,
        elevation: 0.0,
        title: Text('Sign up'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () => widget.toggleView(),
            icon: Icon(
              Icons.person,
              color: TassistWhite, // Use Colors.white or your defined color
            ),
            label: Text(
              'Sign IN',
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
          child: Column(
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
                decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key, color: TassistPrimaryBackground),
                    hintText: 'Enter your password please',
                    hintStyle: Theme.of(context).textTheme.bodyText2,
                    labelText: 'Password'),
                obscureText: true,
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
              // TextFormField(
              //   style: Theme.of(context).textTheme.bodyText2,
              //   decoration: InputDecoration(
              //      icon: Icon(Icons.perm_contact_calendar, color: TassistPrimaryBackground),
              //     hintText: 'Enter your referral code',
              //     hintStyle: Theme.of(context).textTheme.bodyText2,
              //     labelText: 'Referral Code'
              //   ),
              //   obscureText: true,
              //   validator: (val) =>
              //       val.length < 6  ? 'Enter a referral code 6+ chars long' : null,
              //   onChanged: (val) {
              //     setState(() => referralCode = val);
              //   },
              // ),

              // SizedBox(height: 20.0),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: TassistPrimaryBackground, // Background color
                  elevation: 20.0, // Elevation
                ),
                onPressed: () async {
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
                    'Register',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
