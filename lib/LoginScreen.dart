import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // DrawerHeader(
            //   decoration: BoxDecoration(
            //     color: Colors.teal
            //   ),
            //
            //   child: Text(
            //     "Dream App",
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(

                children: [
                  Align(

                    child: Text(
                      "Mail",
                      style: TextStyle(
                        fontSize: 30,

                      ),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(

                    child: Text(
                      "Waleedzidan2020@gmail.com",
                      style: Theme.of(context).textTheme.caption
                    ),
                    alignment: Alignment.topLeft,
                  ),

                ],
              ),
            )
          ],
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LogIn",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("emailAdress"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            "LogIn",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.teal),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
