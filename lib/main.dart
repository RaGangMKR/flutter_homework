
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AcledaGlassForm());
}

class AcledaGlassForm extends StatefulWidget {
  const AcledaGlassForm({super.key});

  @override
  State<AcledaGlassForm> createState() => _AcledaGlassFormState();
}

class _AcledaGlassFormState extends State<AcledaGlassForm> {
  TextEditingController nameController = TextEditingController();

  bool cs = false;
  bool fintech = false;
  bool bit = false;

  String gender = "Male";
  String result = "";

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.black,
        child: Stack(
          children: [
            // Background image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/cef941a03055cc72f3cb5b4e4edc743e.webp"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // GLASS EFFECT
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                color: CupertinoColors.black.withOpacity(0.3),
              ),
            ),

            SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const SizedBox(height: 15),

                  Center(
                    child: Image.asset(
                      "assets/logo.webp",
                      width: 120,
                      height: 120,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // GLASS CARD
                  _glassContainer(
                    child: CupertinoTextField(
                      controller: nameController,
                      placeholder: "Input your name",
                      padding: const EdgeInsets.all(16),
                      style: const TextStyle(color: Colors.black),
                      placeholderStyle:
                      TextStyle(color: Colors.black.withOpacity(0.7)),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text("Sex",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),

                  const SizedBox(height: 10),

                  _glassContainer(
                    child: Column(
                      children: [
                        CupertinoListTile(
                          leading: CupertinoRadio(
                              value: "Male",
                              groupValue: gender,
                              onChanged: (value) =>
                                  setState(() => gender = value!)),
                          title: const Text("Male",
                              style: TextStyle(color: Colors.black)),
                        ),
                        CupertinoListTile(
                          leading: CupertinoRadio(
                              value: "Female",
                              groupValue: gender,
                              onChanged: (value) =>
                                  setState(() => gender = value!)),
                          title: const Text("Female",
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text("Select Your Major",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),

                  const SizedBox(height: 10),

                  _glassContainer(
                    child: Column(
                      children: [
                        CupertinoListTile(
                          leading: CupertinoCheckbox(
                              value: cs,
                              onChanged: (v) => setState(() => cs = v!)),
                          title: const Text("Computer Science",
                              style: TextStyle(color: Colors.black)),
                        ),
                        CupertinoListTile(
                          leading: CupertinoCheckbox(
                              value: fintech,
                              onChanged: (v) => setState(() => fintech = v!)),
                          title: const Text("Fintech",
                              style: TextStyle(color: Colors.black)),
                        ),
                        CupertinoListTile(
                          leading: CupertinoCheckbox(
                              value: bit,
                              onChanged: (v) => setState(() => bit = v!)),
                          title: const Text("Business IT",
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  CupertinoButton.filled(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(14),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: const Text("Submit"),
                    onPressed: () {
                      setState(() {
                        result =
                        "Name: ${nameController.text}\n"
                            "Gender: $gender\n"
                            "Major: "
                            "${cs ? "Computer Science " : ""}"
                            "${fintech ? "Fintech " : ""}"
                            "${bit ? "Business IT " : ""}";
                      });
                    },
                  ),

                  const SizedBox(height: 30),

                  _glassContainer(
                    child: Text(
                      result.isEmpty
                          ? "Your result will appear here"
                          : result,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Glass container widget
  Widget _glassContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.012),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
          width: 1.2,
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}
