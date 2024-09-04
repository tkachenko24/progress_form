import 'package:foundation/export.dart';
import 'package:progress_form/common/helpers/export.dart';

Try<ValidateFailure, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return Try.success(input);
  } else {
    return Try.failed(const EmptyFailure());
  }
}
