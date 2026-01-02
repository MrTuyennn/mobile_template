import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

import 'styles/action_button_style.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.text = '',
    required this.onPressed,
    this.style,
    this.isLoading = false,
    this.wrapContent = false,
    this.leading,
    this.trailing,
  });

  factory ActionButton.blue({
    required BuildContext context,
    String text = '',
    bool isLoading = false,
    bool wrapContent = false,
    VoidCallback? onPressed,
    Widget? leading,
    Widget? trailing,
    ActionButtonStyle? style,
  }) {
    final theme = context.theme;
    final appTextTheme = theme.appTextTheme;
    final appColors = theme.appColors;

    return ActionButton(
      text: text,
      isLoading: isLoading,
      wrapContent: wrapContent,
      onPressed: onPressed,
      leading: leading,
      trailing: trailing,
      style: ActionButtonStyle(
        textStyle: appTextTheme.subheadlineEmphasized.copyWith(
          color: appColors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: appColors.primaryBlue,
        border: Border(
          bottom: BorderSide(color: appColors.blue[800]!, width: AppDimens.sm),
        ),
      ).merge(style),
    );
  }

  factory ActionButton.inverseBlue({
    required BuildContext context,
    String text = '',
    bool isLoading = false,
    bool wrapContent = false,
    VoidCallback? onPressed,
    Widget? leading,
    Widget? trailing,
    ActionButtonStyle? style,
  }) {
    final theme = context.theme;
    final appTextTheme = theme.appTextTheme;
    final appColors = theme.appColors;

    final borderSide = BorderSide(color: appColors.primaryBlue);
    return ActionButton(
      text: text,
      isLoading: isLoading,
      wrapContent: wrapContent,
      onPressed: onPressed,
      leading: leading,
      trailing: trailing,
      style: ActionButtonStyle(
        textStyle: appTextTheme.footnote.copyWith(
          fontWeight: FontWeight.bold,
          color: appColors.blue[600]!,
        ),
        backgroundColor: appColors.white,
        border: Border(
          top: borderSide,
          left: borderSide,
          right: borderSide,
          bottom: borderSide.copyWith(width: AppDimens.smd / 2),
        ),
      ).merge(style),
    );
  }

  final String text;
  final bool isLoading;
  final bool wrapContent;
  final VoidCallback? onPressed;
  final ActionButtonStyle? style;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? const ActionButtonStyle();

    return GestureDetector(
      onTap: isLoading || onPressed == null ? null : onPressed,
      child: Container(
        padding: EdgeInsets.all(AppDimens.md),
        decoration: BoxDecoration(
          color: effectiveStyle.backgroundColor,
          border: effectiveStyle.border,
          borderRadius: BorderRadius.circular(effectiveStyle.borderRadius),
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: AppDimens.sm,
                mainAxisSize: wrapContent ? MainAxisSize.min : MainAxisSize.max,
                children: [
                  ?leading,
                  Flexible(child: Text(text, style: effectiveStyle.textStyle)),
                  ?trailing,
                ],
              ),
      ),
    );
  }
}
