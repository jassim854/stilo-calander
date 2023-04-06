import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool videoCamCheck = false;
  bool micheck = false;
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              color: Colors.green,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Doctor is Available  ',
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                        SizedBox(
                            height: 50,
                            child: Image.asset('assets/images/available.png'))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                              child: Icon(
                            Icons.warning,
                            size: 180,
                          )),
                          const Text(
                            'Stilo chat wants to',
                            style: TextStyle(fontSize: 25),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.mic),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'USE YOUR MICROPHONE',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 20,
                                child: Checkbox(
                                  value: micheck,
                                  onChanged: (value) {
                                    setState(() {
                                      micheck = value!;
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.videocam_rounded),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'USE YOUR MICROPHONE',
                                style: TextStyle(fontSize: 18),
                              ),
                              Checkbox(
                                value: videoCamCheck,
                                onChanged: (value) {
                                  setState(() {
                                    videoCamCheck = value!;
                                  });
                                },
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          customElevatedButton('Join Now', Colors.green,
                              onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const DoctorTimeAvailibility(),
                                ));
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          customElevatedButton('Cancel', Colors.red,
                              onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  Container customElevatedButton(String text, Color btnColor, {onPressed}) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 25),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: btnColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}

class DoctorTimeAvailibility extends StatefulWidget {
  const DoctorTimeAvailibility({super.key});

  @override
  State<DoctorTimeAvailibility> createState() => _DoctorTimeAvailibilityState();
}

class _DoctorTimeAvailibilityState extends State<DoctorTimeAvailibility> {
  String? booked;
  List weekDayList = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
  List timeList = [
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00',
    '24:00',
    '00:00',
  ];
  String? day;
  List selected = [
    true,
    false,
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List available = [
    false,
    true,
    false,
    false,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              color: Colors.grey,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 25, right: 15, top: 20),
                    child: Text(
                      'DOCTOR IS NOT AVAILABLE  ',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 30),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.help,
                                color: Colors.grey,
                              ),
                              Text(
                                  "Doctor is Not available right now  schedule a meeting")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.warning,
                                size: 55,
                                color: Colors.grey,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      circleContainer(Colors.green),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text('Available')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      circleContainer(Colors.red),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text('Not Available')
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 10),
                            child: Wrap(
                                runSpacing:
                                    MediaQuery.of(context).size.width * 0.02,
                                children: weekDayList
                                    .map((e) => Container(
                                          margin: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          decoration: BoxDecoration(
                                              color: day == e
                                                  ? Colors.green
                                                  : Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  day = e;
                                                });
                                              },
                                              child: Text(
                                                e,
                                                style: TextStyle(
                                                    color: day == e
                                                        ? Colors.white
                                                        : Colors.black),
                                              )),
                                        ))
                                    .toList()),
                          ),
                          Expanded(
                            child: GridView.builder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              itemCount: timeList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 150,
                                      mainAxisExtent: 40,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 30),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    if (available[index] == true) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return CustomDialog(
                                            content:
                                                'Do you want to Shedule your call on this time ${timeList[index]}',
                                            title: 'Available To Shedule',
                                            onPressed: () {
                                              Navigator.pop(context);
                                              setState(() {
                                                booked = timeList[index];
                                                available[index] = false;
                                              });
                                            },
                                            text: 'Ok',
                                            cancelOnPressed: () {
                                              Navigator.pop(context);
                                            },
                                            showCancel: true,
                                          );
                                        },
                                      );
                                    } else if (selected[index] == true) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return CustomDialog(
                                            content:
                                                'this is already selected by other user',
                                            title: 'Already Shedule',
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            text: 'Close',
                                          );
                                        },
                                      );
                                    } else if (booked == timeList[index]) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return CustomDialog(
                                            content:
                                                'You have already booked this time  ${timeList[index]} are sure want to delete this call',
                                            title: 'Already Shedule',
                                            onPressed: () {
                                              Navigator.pop(context);
                                              setState(() {
                                                booked = '';
                                                available[index] = true;
                                              });
                                            },
                                            cancelOnPressed: () {
                                              Navigator.pop(context);
                                            },
                                            showCancel: true,
                                            text: 'Ok',
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: customContainer(
                                      context,
                                      timeList[index],
                                      booked == timeList[index],
                                      index),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  Container customContainer(
      BuildContext context, e, bool currentSelected, index) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.05,
      // width: MediaQuery.of(context).size.height * 0.1,
      decoration: currentSelected
          ? BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(8))
          : BoxDecoration(
              color: available[index]
                  ? Colors.green
                  : selected[index]
                      ? Colors.red
                      : Colors.green,
              borderRadius: BorderRadius.circular(8)),
      child: Center(child: Text(e)),
    );
  }

  Widget circleContainer(color) {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget boxContainer(Color color, text) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.height * 0.1,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: Text("${text}"),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.text,
    this.onPressed,
    this.cancelOnPressed,
    this.showCancel,
  }) : super(key: key);
  final String title;
  final String content;
  final Function()? onPressed;
  final Function()? cancelOnPressed;
  final bool? showCancel;

  final String text;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(20),
      elevation: 70,
      titlePadding: const EdgeInsets.only(top: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding:
          const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 25),
      actionsPadding:
          const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 20),
      // buttonPadding: const EdgeInsets.only(left: 12),
      title: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      ),

      content: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16),
      ),
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Row(
          mainAxisAlignment: showCancel == true
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            showCancel == true
                ? Expanded(
                    child: SizedBox(
                        height: 40,
                        // width: 125,
                        child: TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                backgroundColor: Colors.green),
                            onPressed: cancelOnPressed,
                            child: const Text('Cancel',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                )))),
                  )
                : const SizedBox(),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: showCancel == true ? 1 : 0,
              child: SizedBox(
                  height: 40,
                  // width: 125,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          backgroundColor: Colors.red),
                      onPressed: onPressed,
                      child: Text(text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          )))),
            ),
          ],
        ),
      ],
    );
  }
}
