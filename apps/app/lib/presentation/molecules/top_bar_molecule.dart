import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';

/// Top part of the pages, will show page name and settings logo,
/// and sometimes will have back button.
class TopBarMolecule extends StatelessWidget {
  const TopBarMolecule({
    required this.pageName,
    this.rightIcon,
    this.rightIconFunction,
    this.leftIcon,
    this.leftIconFunction,
    this.rightSecondIcon,
    this.rightSecondFunction,
    this.backgroundColor,
  });

  /// Page name to show in the left side of the navigation bar
  final String? pageName;

  /// Icon to show in the right side of the bar
  final IconData? rightIcon;

  /// Icon to show in the right side of the bar left to the first icon
  /// from the right
  final IconData? rightSecondIcon;

  /// Icon to show in the left side of the bar
  final IconData? leftIcon;

  /// Function to execute when pressing the icon in the right side
  final Function(BuildContext)? rightIconFunction;

  /// What to execute if second right icon was pressed
  final Function(BuildContext)? rightSecondFunction;

  /// What to execute if back button was pressed
  final Function(BuildContext)? leftIconFunction;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;

    final TextStyle style = textTheme.bodyLarge!;

    return SafeArea(
      child: ColoredBox(
        color: backgroundColor != null
            ? backgroundColor!.withAlpha((0.72 * 255).toInt())
            : colorScheme.surface,
        child: Container(
          margin: const EdgeInsets.fromLTRB(9, 3, 9, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  if (leftIcon != null)
                    Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: FaIcon(
                          leftIcon,
                          size: style.fontSize,
                          color: colorScheme.tertiary,
                        ),
                        onPressed: () => leftIconFunction!(context),
                      ),
                    )
                  else
                    const SizedBox(),
                  TextAtom(
                    pageName!,
                    style: style.copyWith(color: colorScheme.tertiary),
                  ),
                ],
              ),
              if (rightIcon != null)
                Row(
                  children: [
                    if (rightSecondIcon != null)
                      SizedBox(
                        width: 70,
                        child: TextButton(
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all<EdgeInsets>(
                              EdgeInsets.zero,
                            ),
                          ),
                          onPressed: () => rightSecondFunction!(context),
                          child: FaIcon(
                            rightSecondIcon,
                            size: style.fontSize,
                            color: style.color,
                          ),
                        ),
                      ),
                    SizedBox(
                      width: 25,
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsets>(
                            EdgeInsets.zero,
                          ),
                        ),
                        onPressed: () => rightIconFunction!(context),
                        child: Icon(
                          rightIcon,
                          size: style.fontSize! + 5,
                          color: style.color,
                        ),
                      ),
                    ),
                  ],
                )
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
