import 'package:flutter/material.dart';
import 'package:mathify/constant.dart';
import 'dart:math';

class SurfaceAreaHS extends StatefulWidget {
  const SurfaceAreaHS({super.key});

  @override
  State<SurfaceAreaHS> createState() => _SurfaceAreaHSState();
}

class _SurfaceAreaHSState extends State<SurfaceAreaHS> {
  String _pi = "22/7";
  String _given = "Surface Area";
  String unitS = "m2";
  String? unit = "m";
  double? answer = 0;
  bool visible = false;

  TextEditingController input = TextEditingController();
  @override
  void initState() {
    super.initState();
    input.addListener(updateButtonVisibility);
  }

  @override
  void dispose() {
    input.dispose();
    super.dispose();
  }

  void updateButtonVisibility() {
    final isValid = input.text.replaceAll(" ", "").isNotEmpty;
    setState(() {
      visible = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Center(
                      child: Text(
                    "Select one of the given options for Pi",
                    style: h2,
                  )),
                ),
                RadioListTile(
                  value: "22/7",
                  groupValue: _pi,
                  onChanged: (value) {
                    setState(() {
                      _pi = value!;
                    });
                    updateAnswer();
                  },
                  title: Text(
                    "22/7",
                    style: option,
                  ),
                ),
                RadioListTile(
                  value: "π",
                  groupValue: _pi,
                  onChanged: (value) {
                    setState(() {
                      _pi = value!;
                    });
                    updateAnswer();
                  },
                  title: Text(
                    "π",
                    style: option,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Center(
                      child: Text(
                    "Select one of the given values",
                    style: h2,
                  )),
                ),
                RadioListTile(
                  value: "Surface Area",
                  groupValue: _given,
                  onChanged: (value) {
                    setState(() {
                      _given = value!;
                    });
                    updateAnswer();
                  },
                  title: Text(
                    "Surface Area",
                    style: option,
                  ),
                ),
                RadioListTile(
                  value: "Radius",
                  groupValue: _given,
                  onChanged: (value) {
                    setState(() {
                      _given = value!;
                    });
                    updateAnswer();
                  },
                  title: Text(
                    "Radius",
                    style: option,
                  ),
                ),
                Visibility(
                  visible: _given == "Surface Area",
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Center(
                            child: Text(
                          "Select one of the units",
                          style: h2,
                        )),
                      ),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: DropdownButton<String>(
                          value: unitS,
                          onChanged: (value) {
                            setState(() {
                              unitS = value!;
                            });
                            updateAnswer();
                          },
                          hint: const Center(
                            child: Text(
                              "Select the unit",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          underline: Container(),
                          dropdownColor: Colors.blue.shade100,
                          icon: const Icon(Icons.arrow_downward),
                          isExpanded: true,
                          items: unitsV
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        alignment: Alignment.center,
                                        child: Wrap(
                                          direction: Axis.horizontal,
                                          children: [
                                            Text(
                                              e.substring(0, e.length - 1),
                                              style: option,
                                            ),
                                            Text(
                                              e.substring(e.length - 1),
                                              style: unit_sup,
                                            )
                                          ],
                                        )),
                                  ))
                              .toList(),
                          selectedItemBuilder: (BuildContext context) => unitsV
                              .map((e) => Center(
                                      child: Wrap(
                                    direction: Axis.horizontal,
                                    children: [
                                      Text(
                                        e.substring(0, e.length - 1),
                                        style: option,
                                      ),
                                      Text(
                                        e.substring(e.length - 1),
                                        style: answer_sup,
                                      )
                                    ],
                                  )))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: _given == "Radius",
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Center(
                            child: Text(
                          "Select one of the units",
                          style: h2,
                        )),
                      ),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: DropdownButton<String>(
                          value: unit,
                          onChanged: (value) {
                            setState(() {
                              unit = value;
                            });
                            updateAnswer();
                          },
                          hint: const Center(
                            child: Text(
                              "Select the unit",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          underline: Container(),
                          dropdownColor: Colors.blue.shade100,
                          icon: const Icon(Icons.arrow_downward),
                          isExpanded: true,
                          items: unitsM
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        e,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ))
                              .toList(),
                          selectedItemBuilder: (BuildContext context) => unitsM
                              .map((e) => Center(
                                    child: Text(
                                      e,
                                      style: option,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SizedBox(
                    width: 250,
                    child: TextField(
                      style: h2,
                      controller: input,
                      keyboardType: TextInputType.number,
                      keyboardAppearance: Brightness.dark,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "Enter $_given",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 235, 236, 234),
                      ),
                      onChanged: (value) {
                        updateAnswer();
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: (_given == "Radius" && visible),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      direction: Axis.vertical,
                      children: [
                        const Text(
                          "The Surface Area is ",
                          style: TextStyle(fontSize: 19),
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Text(
                              answer!.toStringAsFixed(4),
                              style: const TextStyle(fontSize: 24),
                            ),
                            Container(width: 10),
                            Text(
                              unitsV[unitsM.indexOf(unit!)]
                                  .substring(0, unit!.length),
                              style: mainAnswer,
                            ),
                            Text(
                              unitsV[unitsM.indexOf(unit!)]
                                  .substring(unit!.length),
                              style: option,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                    visible: (_given == "Surface Area" && visible),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.vertical,
                          children: [
                            const Text(
                              "The radius is ",
                              style: TextStyle(fontSize: 19),
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              children: [
                                Text(
                                  answer!.toStringAsFixed(4),
                                  style: mainAnswer,
                                ),
                                Container(width: 10),
                                Text(
                                  unitsM[unitsV.indexOf(unitS)],
                                  style: mainAnswer,
                                )
                              ],
                            ),
                          ]),
                    ))
              ],
            ),
          ),
        ));
  }

  void updateAnswer() {
    if (_given == "Radius" && _pi == "22/7") {
      setState(() {
        answer = 2 * (22 / 7) * pow(int.parse(input.text), 2).toDouble();
      });
    } else if (_given == "Radius" && _pi == "π") {
      setState(() {
        answer = 2 * (3.14159) * pow(int.parse(input.text), 2).toDouble();
      });
    } else if (_given == "Surface Area" && _pi == "22/7") {
      setState(() {
        answer = pow(int.parse(input.text) / (2 * (22 / 7)), 1 / 2).toDouble();
      });
    } else if (_given == "Surface Area" && _pi == "π") {
      setState(() {
        answer = pow(int.parse(input.text) / (2 * (3.14159)), 1 / 2).toDouble();
      });
    }
  }
}
