# api_calls_code

Examples for using API and parsing JSON

## References: 

* https://flutter.dev/docs/cookbook/networking/fetch-data

To run the example from flutter,
```flutter run -t lib/flutter_docs_example.dart```

* https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51

## Files:

lib/flutter_docs_example.dart contains the example from [cookbook](https://flutter.dev/docs/cookbook/networking/fetch-data)

  * Basic Json parsing from creating the ```Album``` class

  * and fetching data asynchronously using ```Future<>``` and ```FutureBuilder<>```


lib/main.dart contains example usage from the [openweathermap current weather API](https://openweathermap.org/current) ([create an account](https://docs.google.com/document/d/1YLGpfP_ZzKxxh65PAa6Tkc4Z0Cm8wWL71WtvQNZ7XGM/edit?usp=sharing) for a key if you haven't already)

  * Using data model defined in ```lib/models/CurrentWeatherCall.dart```
  
  * fetches data asynchronously using ```Future<>``` and ```FutureBuilder<>```
  
  * uses stateful widget to change between imperial and metric measurements
    
    * NOTE: Make sure ```isImperial``` is private by putting "\_" before it in ```BodyWidget``` like ```_isImperial```
    
lib/models/CurrentWeatherCall.dart

  * Either write it all yourself (which I did stupidly), or use [this tool](https://javiercbk.github.io/json_to_dart/) to make your life a lot more easier.
  
    [json_to_dart](https://javiercbk.github.io/json_to_dart/) converts a json to a dart file. Although this is not perfect, it saves a lot of time and effort.
  
    Also read https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51 to know exactly how parsing json works.
  
    https://openweathermap.org/current#current_JSON is an example of a json we recieve from calling the data. Note that some fields may be missing and dynamically added (Rain/Snow). We probably want to include these fields as well, but if they aren't there, then we havee to make them null.
  
    The basic syntax for optionally missing fields is something like ```rain: parsedJson['rain'] != null ? Rain.fromJson(parsedJson['rain']) : null``` where if it doesn't parse anything with 'rain' key, then it will just make the rain parameter in the ```CurrentWeather``` class ```null```
    
  * Then, to make displaying things easier, I added methods to each class to convert the data to readible strings.
    

## dependencies:
http: ^0.12.2 # for http requests

international_system_of_units: ^1.0.0-dev.4 # easily convert units
