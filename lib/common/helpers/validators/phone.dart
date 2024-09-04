import 'package:foundation/export.dart';
import 'package:progress_form/common/helpers/export.dart';

Try<ValidateFailure, String> validatePhoneNumber(String input) {
  const pattern = r'^[+]?[0-9]{10,14}$';

  if (RegExp(pattern).hasMatch(input)) {
    return Try.success(input);
  }

  return Try.failed(const PhoneFailure());
}
