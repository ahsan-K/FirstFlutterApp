import 'package:flutter/material.dart';
import '../components/customBtn.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    void goToHome() {
      Navigator.pushNamed(context, '/home');
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/getStarted.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Coffee so good, your taste buds will love it.",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 50),
                  textAlign: TextAlign.center),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                    "The best grain, the finest roast, the powerful flavor.",
                    style: TextStyle(color: Colors.grey, fontSize: 23),
                    textAlign: TextAlign.center),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: CustomBtn(
                text: "Get Started",
                onPressed: goToHome,
                type: "primary",
                marginBottom: 20,
              ),
              )
              // MyBTN()
            ],
          ),
        ),
      ),
    );
  }
}
