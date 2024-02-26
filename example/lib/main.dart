import 'package:chartjs/chartjs.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ExampleChart());
  }
}

class ExampleChart extends StatefulWidget {
  const ExampleChart({Key? key}) : super(key: key);

  @override
  ExampleChartState createState() => ExampleChartState();
}

class ExampleChartState extends State<ExampleChart> {
  final String _chartData = '''
  {
  type: "pie",
  data: {
    labels: ["Italy", "France", "Spain", "USA", "Argentina"],
    datasets: [{
      backgroundColor: [
  "#b91d47",
  "#00aba9",
  "#2b5797",
  "#e8c3b9",
  "#1e7145"
],
      data: [55, 49, 44, 24, 15]
    }]
  },
  options: {
    title: {
      display: true,
      text: "World Wide Wine Production 2018"
    }
  }
}
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Chart Js Example App'),
      ),
      body: ChartJs(
        loader: const SizedBox(
          width: 200,
          child: LinearProgressIndicator(),
        ),
        size: const Size(400, 400),
        data: _chartData,
        scripts: const [
          "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.js",
          'https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-annotation/2.2.1/chartjs-plugin-annotation.min.js',
          'https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-zoom/2.0.1/chartjs-plugin-zoom.min.js',
        ],
      ),
    );
  }
}
