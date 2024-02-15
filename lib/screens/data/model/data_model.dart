class DataModel {
  String name;
  var lon;
  var lat;
  String main;
  String description;
  var temp;
  var tempMin;
  var tempMox;
  var pressure;
  var humidity;
  var speed;
  var dt;
  String country;
  var sunrise;
  var sunset;

  DataModel(
    this.name,
    this.country,
    this.dt,
    this.description,
    this.humidity,
    this.lat,
    this.lon,
    this.main,
    this.pressure,
    this.sunrise,
    this.sunset,
    this.temp,
    this.tempMin,
    this.tempMox,
    this.speed,
  );

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      json['name'],
      json['sys']['country'],
      json['dt'],
      json['weather'][0]['description'],
      json['main']['humidity'],
      json['coord']['lat'],
      json['coord']['lon'],
      json['weather'][0]['main'],
      json['main']['pressure'],
      json['sys']['sunrise'],
      json['sys']['sunset'],
      json['main']['temp'],
      json['main']['tempMin'],
      json['main']['tempMox'],
      json['wind']['speed'],
    );
  }
}
