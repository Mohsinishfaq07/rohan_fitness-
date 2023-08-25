import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rohan_fitness/extantions.dart';


class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {required this.hintText,
        required this.labelText,
        this.obscureText = false,
        this.readOnly = false,
        this.controller,
        this.keyboardType,
        this.inputFormatters,
        this.focusNode,
        this.onFieldSubmitted,
        this.onChanged,
        this.validator,
        this.maxLines,
        this.enabled,
        this.contentPadding,
        this.prefixIconPath,
        this.suffixIconPath,
        this.suffixIconOnTap,
        this.onTap,
        this.suffix,
        this.prefix,
        this.networkPrefix = false,
        this.interactiveSelection = true,
        this.maxLength,
        this.minLength,
        this.maxLengthEnforced,
        this.minLines,
        this.textInputAction,
        Key? key,
        this.isPassword = false,
        this.autovalidateMode})
      : super(key: key);

  final String hintText;
  final String labelText;
  final bool obscureText;
  final bool readOnly;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final int? minLength;
  final bool? maxLengthEnforced;
  final bool? enabled;
  final EdgeInsets? contentPadding;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final Function()? suffixIconOnTap;
  final Function()? onTap;
  final Widget? prefix;
  final Widget? suffix;
  final bool networkPrefix;
  final bool interactiveSelection;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  bool isPassword;
  ValueNotifier<bool> obscurePasswod = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                labelText,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ValueListenableBuilder<bool>(
            valueListenable: obscurePasswod,
            builder: (_, obscure, __) {
              return TextFormField(
                autovalidateMode: autovalidateMode,
                enableInteractiveSelection: interactiveSelection,
                readOnly: readOnly,
                enabled: enabled,
                obscureText: isPassword ? obscure : false,
                obscuringCharacter: '●',
                controller: controller,
                keyboardType: keyboardType,
                inputFormatters: inputFormatters,
                focusNode: focusNode,
                onFieldSubmitted: onFieldSubmitted,
                onChanged: onChanged,
                cursorHeight: 30,
                maxLines: maxLines,
                minLines: minLines,
                textInputAction: textInputAction,
                maxLength: maxLength,
                maxLengthEnforcement: maxLengthEnforced == true
                    ? MaxLengthEnforcement.enforced
                    : MaxLengthEnforcement.none,
                onTap: onTap,
                style: const TextStyle(
                  color: Color(0xFF000812),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.25,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                  counterText: "",
                  filled: false,
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  hintText: hintText,
                  hintStyle: TextStyle(color: Theme.of(context).scaffoldBackgroundColor,),

                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          width: 1, color: Colors.white.withOpacity(.8))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          width: 1, color: Colors.white.withOpacity(.8))),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          width: 1, color: Colors.white.withOpacity(.8))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          width: 1, color: Colors.white.withOpacity(.8))),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          width: 1, color: Colors.white.withOpacity(.8))),
                  suffixIcon: suffixIconPath == null
                      ? null
                      : GestureDetector(
                    onTap: suffixIconOnTap,
                    child: Transform.translate(
                      offset: Offset(0, -1),
                      child: Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: SvgPicture.asset(suffixIconPath!),
                      ),
                    ),
                  ),
                  prefixIcon: prefixIconPath == null
                      ? null
                      : prefixIconPath!.ext == 'svg'
                      ? SvgPicture.asset(
                    prefixIconPath!,
                    height: 30,
                    width: 30,
                  )
                      : Image.asset(
                    prefixIconPath!,
                    height: 40,
                    width: 40,
                  ),
                  prefixIconConstraints:
                  const BoxConstraints(minWidth: 24, minHeight: 24),
                  suffixIconConstraints:
                  const BoxConstraints(minWidth: 24, minHeight: 24),
                  suffix: isPassword
                      ? GestureDetector(
                    onTap: () {
                      obscurePasswod.value = !obscurePasswod.value;
                    },
                    child: Icon(
                      obscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                      : null,
                  prefix: prefix,
                ),
                validator: validator,
              );
            }),
      ],
    );
  }
}