import 'package:flutter/material.dart';
import 'package:mathify/constant.dart';
import 'dart:math';

class VolumeC extends StatefulWidget {
  const VolumeC({super.key});

  @override
  State<VolumeC> createState() => _VolumeCState();
}

class _VolumeCState extends State<VolumeC> {
  String _given = "Volume";
  String unitS = "m3";
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
                    "Select one of the given values",
                    style: h2,
                  )),
                ),
                RadioListTile(
                  value: "Volume",
                  groupValue: _given,
                  onChanged: (value) {
                    setState(() {
                      _given = value!;
                    });
                    updateAnswer();
                  },
                  title: Text(
                    "Volume",
                    style: option,
                  ),
                ),
                RadioListTile(
                  value: "Side",
                  groupValue: _given,
                  onChanged: (value) {
                    setState(() {
                      _given = value!;
                    });
                    updateAnswer();
                  },
                  title: Text(
                    "Side",
                    style: option,
                  ),
                ),
                Visibility(
                  visible: _given == "Volume",
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
                          items: unitsV2
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
                          selectedItemBuilder: (BuildContext context) => unitsV2
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
                                        style: unit_sup,
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
                  visible: _given == "Side",
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
                                        style: option,
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
                  visible: (_given == "Side" && visible),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      direction: Axis.vertical,
                      children: [
                        const Text(
                          "The volume is ",
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
                              unitsV2[unitsM.indexOf(unit!)]
                                  .substring(0, unit!.length),
                              style: mainAnswer,
                            ),
                            Text(
                              unitsV2[unitsM.indexOf(unit!)]
                                  .substring(unit!.length),
                              style: answer_sup,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                    visible: (_given == "Volume" && visible),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.vertical,
                          children: [
                            Text(
                              "The radius is ",
                              style: h2,
                            ),
                            Wrap(direction: Axis.horizontal, children: [
                              Text(
                                answer!.toStringAsFixed(4),
                                style: const TextStyle(fontSize: 24),
                              ),
                              Container(width: 10),
                              Text(
                                unitsM[unitsV2.indexOf(unitS)],
                                style: mainAnswer,
                              )
                            ])
                          ]),
                    ))
              ],
            ),
          ),
        ));
  }

  void updateAnswer() {
    if (_given == "Side") {
      setState(() {
        answer = pow(int.parse(input.text), 3).toDouble();
      });
    } else if (_given == "Volume") {
      setState(() {
        answer = pow(int.parse(input.text), 1 / 3).toDouble();
      });
    }
  }
}
