enum SwaggerPathInputType {
  path,
  query,
  formData,
  body,
  header;

  static SwaggerPathInputType fromString(String input) =>
      SwaggerPathInputType.values.firstWhere(
        (e) => e.name == input,
      );
}
