import 'package:flutter/material.dart';
import 'package:mathify/constant.dart';
import 'dart:math';

class SurfaceAreaC extends StatefulWidget {
  const SurfaceAreaC({super.key});

  @override
  State<SurfaceAreaC> createState() => _SurfaceAreaCState();
}

class _SurfaceAreaCState extends State<SurfaceAreaC> {
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
                          "The Surface Area is ",
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
                              unitsV[unitsM.indexOf(unit!)]
                                  .substring(0, unit!.length),
                              style: answer_sup,
                            ),
                            Text(
                              unitsV[unitsM.indexOf(unit!)]
                                  .substring(unit!.length),
                              style: const TextStyle(fontSize: 18),
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
                              "The Side is ",
                              style: TextStyle(fontSize: 19),
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              children: [
                                Text(
                                  answer!.toStringAsFixed(4),
                                  style: option,
                                ),
                                Container(width: 10),
                                Text(
                                  unitsM[unitsV.indexOf(unitS)],
                                  style: answer_sup,
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
    if (_given == "Side") {
      setState(() {
        answer = 4 * pow(int.parse(input.text), 2).toDouble();
      });
    } else if (_given == "Surface Area") {
      setState(() {
        answer = pow(int.parse(input.text) / 4, 1 / 2).toDouble();
      });
    }
  }
}
