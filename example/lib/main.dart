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
  final String _chartData = '''{
  type: "scatter",
  data: {
    datasets: [{
      pointRadius: 4,
      pointBackgroundColor: "rgb(0,0,255)",
      data: xyValues
    }]
  },
  options:{
    scales: {
        xAxes: [{ticks: {min: 40, max:160}}],
        yAxes: [{ticks: {min: 6, max:16}}],
      },
  	plugins: {
        legend: {
          display: true,
          labels: {
            fontColor: 'rgb(0, 0, 0)',
            fontStyle: 'Bold',
          },
          position: 'bottom',
        },
        zoom: {
        zoom: {
          wheel: {
            enabled: true,
          },
          pinch: {
            enabled: true
          },
          mode: 'xy',
        }
      },
        annotation: {
          annotations: {
            line1: {
              type: 'line',
              yMin: 2,
              yMax: 2,
              borderColor: 'rgb(255, 99, 132)',
              borderWidth: 2,
            },
            line2: {
              type: 'line',
              yMin: 8,
              yMax: 8 ,
              borderColor: 'rgb(255, 99, 132)',
              borderWidth: 2,
            },
          },
        },
        },
      }}''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
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
