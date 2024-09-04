import 'package:foundation/export.dart';
import 'package:progress_form/common/helpers/export.dart';

class InputString extends ValueAbstract<String> {
  @override
  final Try<ValidateFailure, String> value;

  factory InputString(String input) {
    return InputString.create(
      validateStringNotEmpty(input),
    );
  }

  const InputString.create(this.value);
}
