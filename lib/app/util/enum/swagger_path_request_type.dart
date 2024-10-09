enum SwaggerPathRequestType {
  get,
  post,
  put,
  delete,
  patch,
  update;

  static SwaggerPathRequestType fromString(String input) =>
      SwaggerPathRequestType.values.firstWhere(
        (e) => e.name == input,
      );
}
