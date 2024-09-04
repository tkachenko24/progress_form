import 'package:progress_form/common/helpers/export.dart';
import 'package:foundation/export.dart';

class InputDate extends ValueAbstract<String> {
  @override
  final Try<ValidateFailure, String> value;

  factory InputDate(String input) {
    return InputDate.create(
      validateDate(input),
    );
  }

  const InputDate.create(this.value);
}
