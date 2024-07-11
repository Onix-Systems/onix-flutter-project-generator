enum SwaggerPathRequestType {
  get,
  post,
  put,
  delete,
  update;

  static SwaggerPathRequestType fromString(String input) =>
      SwaggerPathRequestType.values.firstWhere(
            (e) => e.name == input,
      );
}