extension GetStatusMessage on int? {
  String getStatusMessage() {
    switch (this) {
      case 500:
        return "Internal Server Error";
      case 400:
        return "Something went wrong";
      case 404:
        return "Something went wrong";
      case 403:
        return "Session timeout!";
      case 401:
        return "Unauthorised";
      default:
        return "$this Something went wrong";
    }
  }
}
