import 'package:flutter/material.dart';
import 'package:accountapp/view/authenticate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage(
              'assets/images/dataanalysis.png',
            ),
            fit: BoxFit.fill,
          ),
          Positioned(right: 10, left: 10, bottom: 30, child: HomeScreenButton())
        ],
      )),
    );
  }
}

class HomeScreenButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          HomeScreenText(),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Authenticate(),
                  ),
                );
              },
              child: Text('Authenticate'),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreenText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "TallyAssist",
          style: TextStyle(
              color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 40),
        ),
        const SizedBox(height: 10),
        Text(
          "Send invoices under 30 seconds.",
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
