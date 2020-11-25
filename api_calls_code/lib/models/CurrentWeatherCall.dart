import 'package:international_system_of_units/international_system_of_units.dart';
import 'package:intl/intl.dart';

class CurrentWeather {
  final Coords coord;
  final WeatherList weather;
  final String base;
  final Main main;
  final num visibility;
  final Wind wind;
  final Clouds clouds;
  final Rain rain;
  final Snow snow;
  final num dt;
  final Sys sys;
  final num timezone;
  final num id;
  final String name;
  final num cod;

  CurrentWeather(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.rain,
      this.snow,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  String lastUpdated() {
    DateTime now = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    return DateFormat('EEE, MMM d').add_jm().format(now);
  }

  String visibilityString(bool isImperial) {
    if (isImperial)
      return this
              .visibility
              .toMeter(LengthUnit.meter)
              .toMile
              .toStringAsFixed(1) +
          " mi";
    else
      return this.visibility.toMeter(LengthUnit.meter).toStringAsFixed(0) +
          " m";
  }

  factory CurrentWeather.fromJson(Map<String, dynamic> parsedJson) {
    return CurrentWeather(
      coord: Coords.fromJson(parsedJson['coord']),
      weather: WeatherList.fromJson(parsedJson['weather']),
      base: parsedJson['base'],
      main: Main.fromJson(parsedJson['main']),
      visibility: parsedJson['visibility'],
      wind: Wind.fromJson(parsedJson['wind']),
      clouds: Clouds.fromJson(parsedJson['clouds']),
      // rain and snow are dynamic and could sometimes not be obtain
      rain:
          parsedJson['rain'] != null ? Rain.fromJson(parsedJson['rain']) : null,
      snow:
          parsedJson['sonw'] != null ? Snow.fromJson(parsedJson['snow']) : null,
      dt: parsedJson['dt'],
      sys: Sys.fromJson(parsedJson['sys']),
      timezone: parsedJson['timezone'],
      id: parsedJson['id'],
      name: parsedJson['name'],
      cod: parsedJson['cod'],
    );
  }
}

class Coords {
  final double lon;
  final double lat;

  Coords({this.lon, this.lat});

  factory Coords.fromJson(Map<String, dynamic> json) {
    return Coords(
      lon: json['lon'],
      lat: json['lat'],
    );
  }
}

class WeatherList {
  final List<Weather> weatherList;
  WeatherList({this.weatherList});

  factory WeatherList.fromJson(List<dynamic> parsedJson) {
    List<Weather> weatherList = new List<Weather>();

    weatherList = parsedJson.map((i) => Weather.fromJson(i)).toList();

    return new WeatherList(weatherList: weatherList);
  }
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({this.id, this.main, this.description, this.icon});

  String iconUrl() {
    return "http://openweathermap.org/img/w/" + this.icon + ".png";
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  String tempString(bool isImperial) {
    if (isImperial)
      return this.temp.toFahrenheit.toStringAsFixed(1) + " \u2109";
    else
      return this.temp.toCelsius.toStringAsFixed(1) + " \u2103";
  }

  String feelsLikeString(bool isImperial) {
    if (isImperial)
      return this.feelsLike.toFahrenheit.toStringAsFixed(1) + " \u2109";
    else
      return this.feelsLike.toCelsius.toStringAsFixed(1) + " \u2103";
  }

  String tempMinString(bool isImperial) {
    if (isImperial)
      return this.tempMin.toFahrenheit.toStringAsFixed(1) + " \u2109";
    else
      return this.tempMin.toCelsius.toStringAsFixed(1) + " \u2103";
  }

  String tempMaxString(bool isImperial) {
    if (isImperial)
      return this.tempMax.toFahrenheit.toStringAsFixed(1) + " \u2109";
    else
      return this.tempMax.toCelsius.toStringAsFixed(1) + " \u2103";
  }

  String pressureString(bool isImperial) {
    if (isImperial)
      return (this.pressure * 0.0295300).toStringAsFixed(2) + " inHg";
    else
      return (this.pressure / 1000).toStringAsFixed(1) + " kPa";
  }

  String humidityString() {
    return this.humidity.toString() + " %";
  }

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}

class Wind {
  final double speed;
  final int deg;
  Wind({this.speed, this.deg});

  String speedString(bool isImperial) {
    if (isImperial)
      return this.speed.toKilometerPerHour.toMilePerHour.toStringAsFixed(1) +
          "  mph";
    else
      return this.speed.toStringAsFixed(1) + " m/s";
  }

  String degDirectionString() {
    List<String> directions = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
    int count = 0;
    for (double i = -22.5; i < 337.5; i += 45) {
      if (i <= this.deg && this.deg <= i + 45) {
        return directions[count];
      }
      count++;
    }
    return 'n/a';
  }

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'],
      deg: json['deg'],
    );
  }
}

class Clouds {
  final int all; //Cloudiness, %
  Clouds({this.all});

  String cloudsString() {
    return all.toString() + " %";
  }

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'],
    );
  }
}

class Rain {
  final double oneHour;
  final double threeHour;
  Rain({this.oneHour, this.threeHour});

  String oneHourString(bool isImperial) {
    if (this.oneHour == null) {
      return "n/a";
    }
    if (isImperial)
      return (this.oneHour / 1000).toInch.toStringAsFixed(2) + " in";
    else
      return this.oneHour.toStringAsFixed(2) + " mm";
  }

  String threeHourString(bool isImperial) {
    if (this.threeHour == null) {
      return "n/a";
    }
    if (isImperial)
      return (this.threeHour / 1000).toInch.toStringAsFixed(3) + " in";
    else
      return this.threeHour.toStringAsFixed(2) + " mm";
  }

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      oneHour: json['1h'] != null ? json['1h'] : null,
      threeHour: json['3h'] != null ? json['3h'] : null,
    );
  }
}

class Snow {
  final double oneHour;
  final double threeHour;
  Snow({this.oneHour, this.threeHour});

  String oneHourString(bool isImperial) {
    if (this.oneHour == null) {
      return "n/a";
    }
    if (isImperial)
      return (this.oneHour / 1000).toInch.toStringAsFixed(2) + " in";
    else
      return this.oneHour.toStringAsFixed(2) + " mm";
  }

  String threeHourString(bool isImperial) {
    if (this.threeHour == null) {
      return "n/a";
    }
    if (isImperial)
      return (this.threeHour / 1000).toInch.toStringAsFixed(2) + " in";
    else
      return this.threeHour.toStringAsFixed(2) + " mm";
  }

  factory Snow.fromJson(Map<String, dynamic> json) {
    return Snow(
      oneHour: json['1h'] != null ? json['1h'] : null,
      threeHour: json['3h'] != null ? json['3h'] : null,
    );
  }
}

class Sys {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  String sunriseDate() {
    DateTime now = DateTime.fromMillisecondsSinceEpoch(this.sunrise * 1000);
    return DateFormat.jm().format(now);
  }

  String sunsetDate() {
    DateTime now = DateTime.fromMillisecondsSinceEpoch(this.sunset * 1000);
    return DateFormat.jm().format(now);
  }

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}
