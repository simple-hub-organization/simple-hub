import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:simple_hub/domain/controllers/controllers.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';

class ButtonAtom extends StatefulWidget {
  const ButtonAtom({
    required this.variant,
    required this.onPressed,
    super.key,
    this.text,
    this.icon,
    this.disabled = false,
    this.disableActionType = false,
    this.translate = true,
  });

  final ButtonVariant variant;
  final VoidCallback onPressed;
  final String? text;
  final IconData? icon;
  final bool disabled;
  final bool translate;
  final bool disableActionType;

  static Duration loadSuccessDuration =
      const Duration(seconds: 1, milliseconds: 200);

  @override
  State<ButtonAtom> createState() => ButtonAtomState();
}

class ButtonAtomState extends State<ButtonAtom> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  double get width => 150;

  double get _height => 60;

  void onPressVibrate() {
    VibrationController.instance.vibrate(VibrationType.light);
    widget.onPressed();
  }

  Widget buttonConstraints({required Widget child}) => Container(
        constraints: BoxConstraints(
          minWidth: width,
        ),
        height: _height,
        child: child,
      );

  Widget label(TextTheme textTheme, {Color? color}) => TextAtom(
        widget.text ?? '',
        translate: widget.translate,
        maxLines: 1,
        style: textTheme.bodyLarge!.copyWith(color: color),
      );

  Future loadSuccess() async {
    _btnController.success();
    await Future.delayed(ButtonAtom.loadSuccessDuration);
    _btnController.stop();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    switch (widget.variant) {
      case ButtonVariant.highEmphasisFilled:
        if (widget.icon == null) {
          return buttonConstraints(
            child: FilledButton(
              onPressed: widget.disabled ? null : widget.onPressed,
              style: widget.disabled
                  ? null
                  : FilledButton.styleFrom().copyWith(
                      alignment: Alignment.center,
                      backgroundColor: WidgetStateProperty.all(
                        colorScheme.secondaryContainer,
                      ),
                    ),
              child: label(textTheme, color: colorScheme.onPrimaryContainer),
            ),
          );
        }
        return buttonConstraints(
          child: FilledButton.icon(
            onPressed: widget.disabled ? null : widget.onPressed,
            style: widget.disabled
                ? null
                : FilledButton.styleFrom().copyWith(
                    alignment: Alignment.center,
                    backgroundColor:
                        WidgetStateProperty.all(colorScheme.secondaryContainer),
                  ),
            icon: Icon(widget.icon, color: colorScheme.onPrimaryContainer),
            label: label(textTheme, color: colorScheme.onPrimaryContainer),
          ),
        );

      case ButtonVariant.mediumHighEmphasisFilledTonal:
        if (widget.icon == null) {
          return buttonConstraints(
            child: FilledButton.tonal(
              onPressed: widget.disabled ? null : widget.onPressed,
              style: widget.disabled
                  ? null
                  : FilledButton.styleFrom().copyWith(
                      alignment: Alignment.center,
                      backgroundColor: WidgetStateProperty.all(
                        colorScheme.secondaryContainer,
                      ),
                    ),
              child: label(textTheme, color: colorScheme.onSecondaryContainer),
            ),
          );
        }
        return buttonConstraints(
          child: FilledButton.tonalIcon(
            onPressed: widget.disabled ? null : widget.onPressed,
            style: widget.disabled
                ? null
                : FilledButton.styleFrom().copyWith(
                    alignment: Alignment.center,
                    backgroundColor:
                        WidgetStateProperty.all(colorScheme.secondaryContainer),
                  ),
            icon: Icon(widget.icon, color: colorScheme.onSecondaryContainer),
            label: label(textTheme, color: colorScheme.onSecondaryContainer),
          ),
        );
      case ButtonVariant.mediumEmphasisOutlined:
        if (widget.icon == null) {
          return buttonConstraints(
            child: OutlinedButton(
              onPressed: widget.disabled ? null : widget.onPressed,
              child: label(textTheme, color: colorScheme.primary),
            ),
          );
        }
        return buttonConstraints(
          child: OutlinedButton.icon(
            onPressed: widget.disabled ? null : widget.onPressed,
            icon: Icon(widget.icon, color: colorScheme.primary),
            label: label(textTheme, color: colorScheme.primary),
          ),
        );
      case ButtonVariant.lowEmphasisText:
        if (widget.icon == null) {
          return buttonConstraints(
            child: TextButton(
              onPressed: widget.disabled ? null : widget.onPressed,
              child: label(textTheme, color: colorScheme.primary),
            ),
          );
        }
        return buttonConstraints(
          child: TextButton.icon(
            onPressed: widget.disabled ? null : widget.onPressed,
            icon: Icon(widget.icon, color: colorScheme.primary),
            label: label(textTheme, color: colorScheme.primary),
          ),
        );
      case ButtonVariant.lowEmphasisIcon:
        return IconButton(
          onPressed: widget.onPressed,
          color: colorScheme.primary,
          icon: Icon(widget.icon),
        );
      case ButtonVariant.loadingHighEmphasisFilled:
        return buttonConstraints(
          child: RoundedLoadingButton(
            color: colorScheme.secondaryContainer,
            successColor: colorScheme.secondaryContainer,
            valueColor: colorScheme.onSecondaryContainer,
            controller: _btnController,
            onPressed: widget.onPressed,
            resetAfterDuration: true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  color: colorScheme.onPrimaryContainer,
                ),
                const SeparatorAtom(variant: SeparatorVariant.relatedElements),
                label(textTheme, color: colorScheme.onPrimaryContainer),
              ],
            ),
          ),
        );
      case ButtonVariant.loadingMediumEmphasisOutlined:
        return buttonConstraints(
          child: RoundedLoadingButton(
            color: colorScheme.surface,
            valueColor: colorScheme.primary,
            borderSide: BorderSide(color: colorScheme.onSurface),
            controller: _btnController,
            onPressed: widget.onPressed,
            resetAfterDuration: true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  color: colorScheme.primary,
                ),
                const SeparatorAtom(variant: SeparatorVariant.relatedElements),
                label(textTheme, color: colorScheme.primary),
              ],
            ),
          ),
        );
    }
  }
}

/// See "Choosing buttons" section https://m3.material.io/components/all-buttons
enum ButtonVariant {
  highEmphasisFilled,
  mediumHighEmphasisFilledTonal,
  mediumEmphasisOutlined,
  lowEmphasisText,
  lowEmphasisIcon,
  loadingHighEmphasisFilled,
  loadingMediumEmphasisOutlined,
}
