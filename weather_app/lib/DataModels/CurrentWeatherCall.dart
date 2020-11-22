import 'dart:ffi';

import 'package:flutter/material.dart';

class CurrentWeather {
  final Coords coord;
  final WeatherList weather;
  final String base;
  Main main;
  final num visibility;
  final Wind wind;
  final Clouds clouds;
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
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  factory CurrentWeather.fromJson(Map<String, dynamic> parsedJson) {
    return CurrentWeather(
      coord: Coords.fromJson(parsedJson['coord']),
      weather: WeatherList.fromJson(parsedJson['weather']),
      base: parsedJson['base'],
      main: Main.fromJson(parsedJson['main']),
      visibility: parsedJson['visibility'],
      wind: Wind.fromJson(parsedJson['wind']),
      clouds: Clouds.fromJson(parsedJson['clouds']),
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
  double temp;
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
  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'],
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
