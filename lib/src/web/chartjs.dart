import 'dart:html' as html;
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'js.dart';

///
///A Chart library based on [High Charts (.JS)](https://www.ChartJs.com/)
///
class ChartJs extends StatefulWidget {
  const ChartJs(
      {required this.data,
      required this.size,
      this.loader = const CircularProgressIndicator(),
      this.scripts = const [],
      super.key});

  ///Custom `loader` widget, until script is loaded
  ///
  ///Has no effect on Web
  ///
  ///Defaults to `CircularProgressIndicator`
  final Widget loader;

  ///Chart data
  ///
  ///(use `jsonEncode` if the data is in `Map<String,dynamic>`)
  ///
  ///Reference: [High Charts API](https://api.ChartJs.com/ChartJs)
  ///
  ///```dart
  ///String chart_data = '''{
  ///      title: {
  ///          text: 'Combination chart'
  ///      },
  ///      xAxis: {
  ///          categories: ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
  ///      },
  ///      labels: {
  ///          items: [{
  ///              html: 'Total fruit consumption',
  ///              style: {
  ///                  left: '50px',
  ///                  top: '18px',
  ///                  color: (
  ///                      ChartJs.defaultOptions.title.style &&
  ///                      ChartJs.defaultOptions.title.style.color
  ///                  ) || 'black'
  ///              }
  ///          }]
  ///      },
  ///
  ///      ...
  ///
  ///    }''';
  ///
  ///```
  ///
  ///Reference: [High Charts API](https://api.ChartJs.com/ChartJs)
  final String data;

  ///Chart size
  ///
  ///Height and width of the chart is required
  ///
  ///```dart
  ///Size size = Size(400, 300);
  ///```
  final Size size;

  ///Scripts to be loaded
  ///
  ///Url's of the hightchart js scripts.
  ///
  ///Reference: [Full Scripts list](https://code.ChartJs.com/)
  ///
  ///or use any CDN hosted script
  ///
  ///### For `android` and `ios` platforms, the scripts must be provided
  ///
  ///```dart
  ///List<String> scripts = [
  ///  'https://code.ChartJs.com/ChartJs.js',
  ///  'https://code.ChartJs.com/modules/exporting.js',
  ///  'https://code.ChartJs.com/modules/export-data.js'
  /// ];
  /// ```
  ///
  ///### For `web` platform, the scripts must be provided in `web/index.html`
  ///
  ///```html
  ///<head>
  ///   <script src="https://code.ChartJs.com/ChartJs.js"></script>
  ///   <script src="https://code.ChartJs.com/modules/exporting.js"></script>
  ///   <script src="https://code.ChartJs.com/modules/export-data.js"></script>
  ///</head>
  ///```
  ///
  final List<String> scripts;
  @override
  ChartJsState createState() => ChartJsState();
}

class ChartJsState extends State<ChartJs> {
  final String _ChartJsId =
      "ChartJsId${Random().nextInt(900000) + 100000}";

  @override
  void didUpdateWidget(covariant ChartJs oldWidget) {
    if (oldWidget.data != widget.data ||
        oldWidget.size != widget.size ||
        oldWidget.scripts != widget.scripts ||
        oldWidget.loader != widget.loader) {
      _load();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(_ChartJsId, (int viewId) {
      final html.Element htmlElement = html.DivElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..setAttribute("id", _ChartJsId);
      return htmlElement;
    });

    return SizedBox(
      height: widget.size.height,
      width: widget.size.width,
      child: HtmlElementView(viewType: _ChartJsId),
    );
  }

  void _load() {
    Future.delayed(const Duration(milliseconds: 250), () {
      eval("ChartJs.chart('$_ChartJsId',${widget.data});");
    });
  }
}
