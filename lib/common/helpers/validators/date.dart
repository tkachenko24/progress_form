import 'package:progress_form/common/helpers/export.dart';
import 'package:foundation/export.dart';

Try<ValidateFailure, String> validateDate(String input) {
  // Regular expression for DD/MM/YYYY format
  const regex = r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/(19|20)\d{2}$';

  if (RegExp(regex).hasMatch(input)) {
    // Splitting the date into day, month, and year
    List<String> parts = input.split('/');
    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);

    // Validating day, month, and year ranges
    if (day >= 1 && day <= 31 && month >= 1 && month <= 12) {
      int currentYear = DateTime.now().year;
      if (year >= currentYear - 150 && year <= currentYear) {
        return Try.success(input);
      }
    }
  }
  return Try.failed(const DateFailure());
}
