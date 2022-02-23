import 'dart:ui';

import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);
  static const String routeName = '/';
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox.expand(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              left: 0,
              top: 340,
              right: 90,
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2.7,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 98, 185, 255),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 40,
              top: 100,
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 149, 255, 154),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 45.0,
                  sigmaY: 45.0,
                ),
                child: SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          flex: 9,
                          fit: FlexFit.tight,
                          child: Center(
                            child: Text('DON\'T SIT AT HOME. GO FOR A RIDE!',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        height: 1.0,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.fade)),
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/home');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                child: SizedBox.expand(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
                                    child: Row(
                                     
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                     
                                      children:  [
                                        Text('Get Started', style: Theme.of(context).textTheme.button!.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                                        Icon(Icons.arrow_forward_ios, color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary, ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                )),
          ],
        ),
      )),
    );
  }
}
