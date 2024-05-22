import 'package:flutter/material.dart';
import 'package:mathify/TotalSurfaceC.dart';
import 'package:mathify/surfaceS.dart';
import 'package:mathify/SurfaceAreaC.dart';
import 'package:mathify/volumeC.dart';
import 'package:mathify/volumeHS.dart';
import 'package:mathify/volumeS.dart';
import 'constant.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: appbar,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Select one of the given solids",
                    style: h1,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      Text("Sphere: ", style: TextStyle(fontSize: 19)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            OptionTile(title: "Volume", widget: VolumeS()),
                            OptionTile(title: "Surface", widget: SurfaceAreaS())
                          ],
                        ),
                      ),
                      Text("Hemisphere: ", style: TextStyle(fontSize: 19)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            OptionTile(title: "Volume", widget: VolumeHS()),
                            OptionTile(
                                title: "Lateral Surface Area",
                                widget: SurfaceAreaC()),
                            OptionTile(
                                title: "Total Surface Area",
                                widget: TotalSurfaceAreaC())
                          ],
                        ),
                      ),
                      Text(
                        "Cube: ",
                        style: TextStyle(fontSize: 19),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            OptionTile(title: "Volume", widget: VolumeC()),
                            OptionTile(
                                title: "Lateral Surface Area",
                                widget: SurfaceAreaC()),
                            OptionTile(
                                title: "Total Surface Area",
                                widget: TotalSurfaceAreaC())
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class OptionTile extends StatefulWidget {
  final String title;
  final Widget widget;
  const OptionTile({super.key, required this.title, required this.widget});

  @override
  State<OptionTile> createState() => OptionTileState();
}

class OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: h2,
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => widget.widget)));
          },
        )
      ],
    );
  }
}
