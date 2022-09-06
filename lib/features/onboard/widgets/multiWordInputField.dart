import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/features/onboard/widgets/mnemonicInputField.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/backup.dart';

class MultiWordInputField extends StatefulWidget {
  const MultiWordInputField(
      {Key? key,
      this.wordDelimiter = " ",
      required this.badInputFlushbar,
      required this.submitInput,
      required this.validateInput})
      : super(key: key);

  final Flushbar<bool> badInputFlushbar;
  final void Function(String? value) submitInput;
  final bool Function(String? value) validateInput;
  final String wordDelimiter;

  @override
  State<MultiWordInputField> createState() => _MultiWordInputFieldState();
}

class _MultiWordInputFieldState extends State<MultiWordInputField> {
  final mnemonicController = TextEditingController(text: "");
  String currentText = "";

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LockScreenViewModel>(
      converter: LockScreenViewModel.fromStore,
      builder: (_, viewModel) => Form(
        key: formKey,
        child: Container(
          width: 250,
          child: MnemonicInputField(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0),
            wordsLength: 12,
            inputFormatters: [],
            wordDelimiter: widget.wordDelimiter,
            showCursor: false,
            autoFocus: true,
            appContext: context,
            enableActiveFill: true,
            obscureText: true,
            // enablePinAutofill: false,
            keyboardType: TextInputType.text,
            animationType: AnimationType.fade,
            controller: mnemonicController,
            // errorAnimationController: errorController,
            validator: (String? value) =>
                value != null && widget.validateInput(value)
                    ? I10n.of(context).invalid_mnemonic
                    : null,
            // value == viewModel.mnemonic
            //     ? I10n.of(context).invalid_mnemonic
            //     : null,
            textStyle: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            pinTheme: PinTheme(
              borderRadius: BorderRadius.circular(5),
              borderWidth: 4,
              fieldWidth: 105,
              shape: PinCodeFieldShape.underline,
              inactiveColor: Colors.black,
              selectedColor: Colors.black,
              activeColor: Colors.black,
              inactiveFillColor: Colors.transparent,
              selectedFillColor: Colors.transparent,
              disabledColor: Colors.transparent,
              activeFillColor: Colors.transparent,
            ),
            onCompleted: (value) {
              //pass
            },
            onChanged: (value) {
              setState(() {
                currentText = value;
              });
            },
            onSubmitted: (value) {
              if (widget.validateInput(value)) {
                widget.submitInput(value);
                mnemonicController.clear();
              } else {
                widget.badInputFlushbar
                  ..show(context).then(
                    (result) async {
                      if (result == true) {
                        mnemonicController.clear();
                        WidgetsBinding.instance.focusManager.primaryFocus
                            ?.previousFocus();
                      }
                    },
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
