import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({ Key? key }) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: AnimatedContainer(
         decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        duration: const Duration(seconds: 2),
        child: Text('LocationPage'),
      ),
    );
  }
}