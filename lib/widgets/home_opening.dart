import 'package:flutter/material.dart';

class HomeOpening extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Container(
        height: _mediaQuery.size.height,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: _mediaQuery.size.height / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color.fromRGBO(3, 182, 156, 1), Color.fromRGBO(9, 253, 171, 1)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(200)
                      )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: _mediaQuery.size.height / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png')
                ],
              ),
            ),
            Container(
              height: _mediaQuery.size.height / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color.fromRGBO(3, 182, 156, 1), Color.fromRGBO(9, 253, 171, 1)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(200)
                      )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}