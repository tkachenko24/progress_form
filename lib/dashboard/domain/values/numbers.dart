import 'package:foundation/export.dart';
import 'package:progress_form/common/helpers/export.dart';

class InputNumbers extends ValueAbstract<String> {
  @override
  final Try<ValidateFailure, String> value;

  factory InputNumbers(String input) {
    return InputNumbers.create(
      validateNumbersOnly(input),
    );
  }

  const InputNumbers.create(this.value);
}
