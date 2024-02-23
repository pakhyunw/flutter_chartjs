library ChartJs;

export 'src/unsupported.dart'
    if (dart.library.html) 'src/web/chartjs.dart'
    if (dart.library.io) 'src/mobile/chartjs.dart';
