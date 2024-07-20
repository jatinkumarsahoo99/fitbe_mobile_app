
class FlavorConfig {
  final String name;
  final String baseUrl;
  final bool isProduction;

  static late final FlavorConfig _instance;

  factory FlavorConfig({
    required String name,
    required String baseUrl,
    required bool isProduction,
  }) {
    _instance = FlavorConfig._internal(name, baseUrl, isProduction);
    return _instance;
  }

  FlavorConfig._internal(this.name, this.baseUrl, this.isProduction);

  static FlavorConfig get instance => _instance;
}