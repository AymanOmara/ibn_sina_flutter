class ValidationRule {
  final String message;
  final bool Function(String input) validate;

  ValidationRule(this.message, this.validate);
}
