import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:get/get.dart';
import 'package:weather/weather.dart';
import 'package:farmer_app/app/core/utils/extensions.dart';

class WeatherReportController extends GetxController {
  late final instance = _getData();
  late WeatherFactory wf;
  late Weather currentDayWeather;
  late List<Weather> fiveDaysWeather;

  get nextDayWeather => fiveDaysWeather[1];
  get currentWeather => currentDayWeather;

  get currentTemp => currentDayWeather.temperature?.celsius?.toInt() ?? 0;
  get currentFeelTemp => currentDayWeather.tempFeelsLike?.celsius?.toInt() ?? 0;
  get currentMinTemp => currentDayWeather.tempMin?.celsius?.toInt() ?? 0;
  get currentMaxTemp => currentDayWeather.tempMax?.celsius?.toInt() ?? 0;
  get currentHumidity => currentDayWeather.humidity;
  get currentWindSpeed => (currentDayWeather.windSpeed ?? 60000) ~/ 1;
  get currentWindDirection => currentDayWeather.windDegree;
  get currentSunrise => currentDayWeather.sunrise!.weatherTime(Get.context);
  get currentSunset => currentDayWeather.sunset!.weatherTime(Get.context);

  get nextDayTemp => nextDayWeather.temperature?.celsius?.toInt() ?? 0;
  get nextDayFeelTemp => nextDayWeather.tempFeelsLike?.celsius?.toInt() ?? 0;
  get nextDayMinTemp => nextDayWeather.tempMin?.celsius?.toInt() ?? 0;
  get nextDayMaxTemp => nextDayWeather.tempMax?.celsius?.toInt() ?? 0;
  get nextDayHumidity => nextDayWeather.humidity;
  get nextDayWindSpeed => (nextDayWeather.windSpeed ?? 60000) ~/ 1;
  get nextDayWindDirection => nextDayWeather.windDegree;
  get nextDaySunrise => nextDayWeather.sunrise?.weatherTime(Get.context);
  get nextDaySunset => nextDayWeather.sunset?.weatherTime(Get.context);

  Future<bool> _getData() async {
    final key = await getDbService().getWeatherKey();
    wf = WeatherFactory(key);
    final service = await getNativeService();
    final hasPermission = await service.getLocationPermission();
    if (!hasPermission) throw Exception("Permission Denied");
    final locData = await service.getLocation();
    if (locData.longitude == null || locData.latitude == null) {
      throw Exception("Failed To Get Location");
    }
    final lo = locData.longitude!;
    final la = locData.latitude!;
    currentDayWeather = await wf.currentWeatherByLocation(lo, la);
    fiveDaysWeather = await wf.fiveDayForecastByLocation(lo, la);
    return true;
  }
}
