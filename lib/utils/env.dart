enum BuildFlavor { production, development, qa, sg }

BuildEnvironment get env => _env!;
BuildEnvironment? _env;

class BuildEnvironment {
  /// The backend server.
  final String baseUrl;
  final BuildFlavor flavor;
  final String imageUrl;
  final String cloudFrontUrl;
  final String googleMapsApiKey;

  BuildEnvironment._init({
    required this.flavor,
    required this.baseUrl,
    required this.imageUrl,
    required this.cloudFrontUrl,
    required this.googleMapsApiKey,
  });

  /// Sets up the top-level [env] getter on the first call only.
  static void init(
          {required flavor,
          required baseUrl,
          required imageUrl,
          required cloudFrontUrl,
          String googleMapsApiKey = ''}) =>
      _env ??= BuildEnvironment._init(
        flavor: flavor,
        baseUrl: baseUrl,
        imageUrl: imageUrl,
        cloudFrontUrl: cloudFrontUrl,
        googleMapsApiKey: googleMapsApiKey,
      );
}
