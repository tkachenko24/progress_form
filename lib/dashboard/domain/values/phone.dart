import 'package:foundation/export.dart';
import 'package:progress_form/common/helpers/export.dart';

class PhoneNumber extends ValueAbstract<String> {
  @override
  final Try<ValidateFailure, String> value;

  factory PhoneNumber(String input) {
    return PhoneNumber.create(
      validatePhoneNumber(input),
    );
  }

  const PhoneNumber.create(this.value);
}
