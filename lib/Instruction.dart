import 'package:flutter/material.dart';

class Instruction extends StatefulWidget {
  const Instruction({Key? key}) : super(key: key);

  @override
  State<Instruction> createState() => _InstructionState();
}

class _InstructionState extends State<Instruction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructions'),
        centerTitle: true,
        backgroundColor: Colors.redAccent.withOpacity(0.8),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Here are the steps to connect a wearable device to Google Fit on your phone:',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 15),
            ),
            Text(
                '1. Ensure that your wearable device is compatible with Google Fit. Check the list of supported devices on the Google Fit website.'),
            Text(
                '2. Install the Google Fit app on your phone from the Google Play Store.'),
            Text(
                '3. Turn on Bluetooth on both your phone and the wearable device.'),
            Text(
                '4. Open the Google Fit app on your phone and tap the profile icon in the top right corner.'),
            Text('5. Tap "Settings" and then tap "Connected devices.'),
            Text(
                '6. Tap "Add a device" and select your wearable device from the list of available devices.'),
            Text(
                '7. Select data source for the heart rate in mobile by choosing the connected device name'),
            Text(
              'Once your device is paired, it should automatically sync with Google Fit whenever it is in range and Bluetooth is enabled.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Note: The specific steps may vary slightly depending on the type of wearable device you are using.',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
