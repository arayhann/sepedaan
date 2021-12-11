class Main {
  Main({
    required this.temp,
  });

  double temp;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
      );
}
