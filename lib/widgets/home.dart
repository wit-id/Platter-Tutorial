import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: _mediaQuery.size.width,
              height: _mediaQuery.size.height * 0.6,
              child: Center(
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            Container(
              width: _mediaQuery.size.width,
              height: _mediaQuery.size.height * 0.4,
              padding: EdgeInsets.only(
                top: 50,
                left: 30,
                right: 30,
                bottom: 15
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(3, 182, 156, 1), Color.fromRGBO(9, 253, 171, 1)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 8
                  )
                ]
              ),
              child: LayoutBuilder(
                  builder: (ctx, constraint) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: constraint.maxHeight / 3,
                        child: Text(
                          'Welcome',
                          style: Theme.of(context).textTheme.title,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        height: constraint.maxHeight / 3,
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          style: Theme.of(context).textTheme.body1
                        ),
                      ),
                      Container(
                        height: constraint.maxHeight / 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ButtonTheme(
                              minWidth: 150,
                              height: 50,
                              child: FlatButton(
                                child: Text('Sign in'),
                                onPressed: (){},
                                color: Colors.black,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            ButtonTheme(
                              minWidth: 150,
                              height: 50,
                              child: FlatButton(
                                child: Text('Sign up'),
                                onPressed: (){},
                                color: Colors.white,
                                textColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}