import 'package:flutter/material.dart';

class BackPainReliefScreen extends StatefulWidget {
  @override
  BackPainReliefState createState() => BackPainReliefState();
}

class BackPainReliefState extends State<BackPainReliefScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pain Relief Exercises"),
        backgroundColor: Color(0xff000000),
        // systemOverlayStyle: SystemUiOverlayStyle.dark,
        brightness: Brightness.dark,
      ),
      body: ListView(
        primary: false,
        padding: const EdgeInsets.all(10),
        physics: ScrollPhysics(),
        children: [
          Card(
            elevation: 5.0,
            shadowColor: Colors.grey,
            child: InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'home', (route) => false);
              },
              child: Container(
                height: 200.0,
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    width: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.black45,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: const Text(
                        'Cobra Lift',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: AssetImage("images/ex/cobra.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 5.0,
            shadowColor: Colors.grey,
            child: InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'home', (route) => false);
              },
              child: Container(
                height: 200.0,
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black54,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: const Text(
                        'Gluteal Stretch',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: AssetImage("images/ex/cobra.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 5.0,
            shadowColor: Colors.grey,
            child: InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'home', (route) => false);
              },
              child: Container(
                height: 200.0,
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black54,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: const Text(
                        'Cat-Camel Stretch',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: AssetImage("images/ex/cobra.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 5.0,
            shadowColor: Colors.grey,
            child: InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'home', (route) => false);
              },
              child: Container(
                height: 200.0,
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black54,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: const Text(
                        'Piriformis Stretch',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: AssetImage("images/ex/cobra.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 5.0,
            shadowColor: Colors.grey,
            child: InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'home', (route) => false);
              },
              child: Container(
                height: 200.0,
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black54,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: const Text(
                        'Prone Leg Raises',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: AssetImage("images/ex/cobra.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 5.0,
            shadowColor: Colors.grey,
            child: InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'home', (route) => false);
              },
              child: Container(
                height: 200.0,
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black54,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: const Text(
                        'Quadrupled Arm Leg',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: AssetImage("images/ex/cobra.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 5.0,
            shadowColor: Colors.grey,
            child: InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'home', (route) => false);
              },
              child: Container(
                height: 200.0,
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black54,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: const Text(
                        'Back Extension Strength',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: AssetImage("images/ex/cobra.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
