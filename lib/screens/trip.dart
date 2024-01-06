// ignore_for_file: non_constant_identifier_names

import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nothing/color/all_colors.dart';
import 'package:nothing/google_map/googlemapLauncher.dart';

class MyTrip extends StatefulWidget {
  const MyTrip({super.key});

  @override
  State<MyTrip> createState() => _MyTripState();
}

class _MyTripState extends State<MyTrip> {
  final CollectionReference _travel =
      FirebaseFirestore.instance.collection('travel');
  //Text Controller
  final TextEditingController _FromPlace = TextEditingController();
  final TextEditingController _ToPlace = TextEditingController();
  final TextEditingController _DatePicker = TextEditingController();
  final TextEditingController _Purpose = TextEditingController();

  //void for the date picker
  DateTime _dateTime = DateTime.now();
  void _showDatePicker() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2027),
    );
    if (selectedDate != null && selectedDate != _dateTime) {
      setState(() {
        _dateTime = selectedDate;
        _DatePicker.text = _formatDate(selectedDate);
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString()}-${date.month.toString()}-${date.year.toString()}';
  }

  //Giving a name for it
// documentSnapshot['locationfrom'];

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _FromPlace.text = documentSnapshot['locationfrom'];
      _ToPlace.text = documentSnapshot['locationto'];
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            decoration: BoxDecoration(
                color: AppColor().cardBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 6,
                    width: 0,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 120,
                        child: TextField(
                          controller: _FromPlace,
                          decoration:
                              const InputDecoration(labelText: 'From Place'),
                        ),
                      ),
                      const Icon(Icons.arrow_circle_right_outlined),
                      SizedBox(
                        width: 120,
                        child: TextField(
                          controller: _ToPlace,
                          decoration:
                              const InputDecoration(labelText: 'To Place'),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    onTap: _showDatePicker,
                    readOnly: true,
                    controller: _DatePicker,
                    decoration: const InputDecoration(labelText: 'Pick Date'),
                  ),
                  TextField(
                    controller: _Purpose,
                    decoration: const InputDecoration(labelText: 'Purpose'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColor().HeadingColor)),
                      onPressed: () async {
                        if (_FromPlace.text == "" ||
                            _ToPlace.text == "" ||
                            _DatePicker.text == "" ||
                            _Purpose.text == "") {
                          Flushbar(
                            title: "Hey, User",
                            message: "Please Fill all the details",
                            backgroundColor: Colors.red,
                            titleColor: Colors.white,
                            duration: const Duration(seconds: 3),
                          ).show(context);

                          print('Add man');
                        } else {
                          final String fromPlace = _FromPlace.text;
                          final String toPlace = _ToPlace.text;
                          final String date = _DatePicker.text;
                          final String purpose = _Purpose.text;

                          if (fromPlace != null) {
                            Navigator.pop(context);
                            await _travel.doc(documentSnapshot!.id).update({
                              'locationfrom': fromPlace,
                              'locationto': toPlace,
                              'date': date,
                              'purpose': purpose,
                            }).then((value) {
                              Flushbar(
                                title: "Hey, User",
                                message: "Succesfully Updated your trip",
                                backgroundColor:
                                    const Color.fromARGB(255, 195, 166, 245),
                                titleColor: Colors.white,
                                duration: const Duration(seconds: 3),
                              ).show(context);
                            });

                            _FromPlace.text = '';
                            _ToPlace.text = '';
                            _DatePicker.text = '';
                            _Purpose.text = '';
                          }
                        }
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(color: AppColor().WhiteColor),
                      )),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _FromPlace.text = documentSnapshot['locationfrom'];
      _ToPlace.text = documentSnapshot['locationto'];
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            decoration: BoxDecoration(
                color: AppColor().cardBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05,
                          right: MediaQuery.of(context).size.width * .05),
                      decoration: BoxDecoration(
                          color: AppColor().HeadingColor,
                          borderRadius: BorderRadius.circular(80)),
                      height: 3,
                      width: 190,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: _FromPlace,
                          decoration:
                              const InputDecoration(labelText: 'From Place'),
                        ),
                      ),
                      const Icon(Icons.arrow_right_alt_outlined),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: _ToPlace,
                          decoration:
                              const InputDecoration(labelText: 'To Place'),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: _DatePicker,
                    readOnly: true,
                    onTap: _showDatePicker,
                    decoration: const InputDecoration(labelText: 'Date Picker'),
                  ),
                  TextField(
                    controller: _Purpose,
                    decoration: const InputDecoration(labelText: 'Purpose'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 260,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColor().HeadingColor)),
                            onPressed: () {
                              MapUtils.openMap(_FromPlace.text, _ToPlace.text);
                            },
                            child: Text(
                              'Route',
                              style: TextStyle(color: AppColor().WhiteColor),
                            )),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColor().HeadingColor)),
                            onPressed: () async {
                              if (_FromPlace.text == "" ||
                                  _ToPlace.text == "" ||
                                  _DatePicker.text == "" ||
                                  _Purpose.text == "") {
                                Flushbar(
                                  title: "Hey, User",
                                  message: "Please Fill all the details",
                                  backgroundColor: Colors.red,
                                  titleColor: Colors.white,
                                  duration: const Duration(seconds: 3),
                                ).show(context);
                                print('Add man');
                              } else {
                                final String fromPlace = _FromPlace.text;
                                final String toPlace = _ToPlace.text;
                                final String date = _DatePicker.text;
                                final String purpose = _Purpose.text;
                                if (fromPlace != null) {
                                  Navigator.pop(context);

                                  await _travel.add({
                                    'locationfrom': fromPlace,
                                    'locationto': toPlace,
                                    'date': date,
                                    'purpose': purpose,
                                  }).then((value) {
                                    Flushbar(
                                      title: "Hey, User",
                                      message: "Succesfully Added your trip",
                                      backgroundColor: AppColor().AllBgColor,
                                      titleColor: Colors.white,
                                      duration: const Duration(seconds: 3),
                                    ).show(context);
                                  });
                                  _FromPlace.text = '';
                                  _ToPlace.text = '';
                                  _DatePicker.text = '';
                                  _Purpose.text = '';
                                }
                              }
                            },
                            child: Text(
                              'Add',
                              style: TextStyle(color: AppColor().WhiteColor),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

//Delete method
  Future<void> _delete(String travelId) async {
    await _travel.doc(travelId).delete();

    ScaffoldMessenger.of(context);

    // .showSnackBar(const SnackBar(content: Text('Succesfully Deleted')));
    // ignore: use_build_context_synchronously
    Flushbar(
      title: "Hey, User",
      message: "Sucessfully deleted the trip",
      backgroundColor: Colors.green,
      titleColor: Colors.white,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    //Padding fot the keyboard issue
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('My Trips'),
      ),
      body: StreamBuilder(
          stream: _travel.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(2),
                      child: Slidable(
                          startActionPane: ActionPane(
                              motion: const StretchMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: ((context) {
                                    _update(documentSnapshot);
                                  }),
                                  backgroundColor: AppColor().AllBgColor,
                                  icon: Icons.edit,
                                ),
                                SlidableAction(
                                  onPressed: ((context) {
                                    _delete(documentSnapshot.id);
                                  }),
                                  backgroundColor: AppColor().HeadingColor,
                                  icon: Icons.delete_sharp,
                                  foregroundColor: Colors.white,
                                ),
                              ]),
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor().AllBgColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            height: 110,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, bottom: 0, left: 15, right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            documentSnapshot['locationfrom'],
                                          ),
                                          const Icon(
                                              Icons.arrow_right_alt_outlined),
                                          Text(documentSnapshot['locationto']),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(documentSnapshot['date'])
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(documentSnapshot['purpose']),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      AppColor().HeadingColor)),
                                          onPressed: () {
                                            MapUtils.openMap(
                                                // _FromPlace.text, _ToPlace.text
                                                documentSnapshot[
                                                    'locationfrom'],
                                                documentSnapshot['locationto']);
                                          },
                                          child: Text(
                                            'Check Route',
                                            style: TextStyle(
                                                color: AppColor().WhiteColor),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: FloatingActionButton(
            backgroundColor: AppColor().blue,
            onPressed: () {
              _create();
            },
            child: const Icon(Icons.add)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
