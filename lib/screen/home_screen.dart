import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator/widget/buttons.dart';
import 'package:expressions/expressions.dart';

class CalculatorController extends GetxController {
  var useranswer = "".obs;
  var userquestion = "".obs;

  void appendUserQuestion(String value) {
    userquestion.value += value;
  }

  void appenddecimaluserquestion() {
    if (userquestion.contains(".")) {
      false;
    } else {
      userquestion.value += ".";
    }
  }

  void clearQuestion() {
    userquestion.value = "";
  }

  void deleteLastCharacter() {
    if (userquestion.value.isNotEmpty) {
      userquestion.value =
          userquestion.value.substring(0, userquestion.value.length - 1);
    }
  }

  void calculateAnswer() {
    try {
      final expression = Expression.parse(userquestion.value.toString());
      final evvaluvator = ExpressionEvaluator();
      useranswer.value = evvaluvator.eval(expression, {}).toString();
    } catch (e) {
      useranswer.value = 'Error';
    }
  }

  dynamic evaluate() {
    userquestion.value = useranswer.value;
    return 0; // Placeholder
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CalculatorController controller = Get.put(CalculatorController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Obx(() => Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          controller.userquestion.value,
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                  Obx(() => Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          controller.useranswer.value,
                          style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                        text: "C",
                        color: Colors.green,
                        ontap: () => controller.clearQuestion(),
                      ),
                      Button(
                        text: "DEL",
                        color: Colors.red,
                        ontap: () => controller.deleteLastCharacter(),
                      ),
                      Button(
                        text: "%",
                        color: Colors.orange,
                        ontap: () => controller.appendUserQuestion("%"),
                      ),
                      Button(
                        text: "/",
                        color: Colors.orange,
                        ontap: () => controller.appendUserQuestion("/"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                        text: "7",
                        color: Colors.grey[800]!,
                        ontap: () => controller.appendUserQuestion("7"),
                      ),
                      Button(
                        text: "8",
                        color: Colors.grey[800]!,
                        ontap: () => controller.appendUserQuestion("8"),
                      ),
                      Button(
                        text: "9",
                        color: Colors.grey[800]!,
                        ontap: () => controller.appendUserQuestion("9"),
                      ),
                      Button(
                        text: "*",
                        color: Colors.orange,
                        ontap: () => controller.appendUserQuestion("*"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                        text: "4",
                        color: Colors.grey[800]!,
                        ontap: () => controller.appendUserQuestion("4"),
                      ),
                      Button(
                        text: "5",
                        color: Colors.grey[800]!,
                        ontap: () => controller.appendUserQuestion("5"),
                      ),
                      Button(
                        text: "6",
                        color: Colors.grey[800]!,
                        ontap: () => controller.appendUserQuestion("6"),
                      ),
                      Button(
                        text: "-",
                        color: Colors.orange,
                        ontap: () => controller.appendUserQuestion("-"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                        text: "1",
                        color: Colors.grey[800]!,
                        ontap: () => controller.appendUserQuestion("1"),
                      ),
                      Button(
                        text: "2",
                        color: Colors.grey[800]!,
                        ontap: () => controller.appendUserQuestion("2"),
                      ),
                      Button(
                        text: "3",
                        color: Colors.grey[800]!,
                        ontap: () => controller.appendUserQuestion("3"),
                      ),
                      Button(
                        text: "+",
                        color: Colors.orange,
                        ontap: () => controller.appendUserQuestion("+"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                        text: "0",
                        color: Colors.grey[800]!,
                        ontap: () => controller.appendUserQuestion("0"),
                      ),
                      Button(
                        text: ".",
                        color: Colors.grey[800]!,
                        ontap: () => controller.appenddecimaluserquestion(),
                      ),
                      Button(
                        text: "ANS",
                        color: Colors.grey[800]!,
                        ontap: () {
                          controller.evaluate();
                        },
                      ),
                      Button(
                        text: "=",
                        color: Colors.orange,
                        ontap: () => controller.calculateAnswer(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
