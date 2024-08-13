import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final _expressionController = TextEditingController();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Калькулятор'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void calc() {
    final expression = _expressionController.text.trim();

    // Регулярное выражение для нахождения чисел и операции
    final regExp = RegExp(r'^(\d+\.?\d*)([+\-*/])(\d+\.?\d*)$');
    final match = regExp.firstMatch(expression);

    // Если формат ввода неверный, ничего не делаем
    if (match == null) {
      _showResult('Неверный формат ввода');
      return;
    }

    // Извлечение чисел и операции
    final num1 = double.parse(match.group(1) !);
    final operation = match.group(2);
    final num2 = double.parse(match.group(3) !);

    double result;

    // Выполнение расчета в зависимости от операции
    switch (operation) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num1 / num2;
        break;
      default:
        _showResult('Неверная операция. Используйте +, -, * или /.');
        return;
    }

    // Отображение результата
    _showResult('$expression = $result');
  }

  void _showResult(String result) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Результат'),
        content: Text(result),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Введите выражение:',
            ),
            TextField(
              controller: _expressionController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9\+\-\*/\.]')),
              ],
            ),
            ElevatedButton(
              onPressed: calc,
              child: const Text('Вычислить'),
            ),
          ],
        ),
      ),
    );
  }
}
