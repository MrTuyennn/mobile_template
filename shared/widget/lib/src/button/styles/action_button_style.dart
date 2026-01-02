import 'package:flutter/widgets.dart';

class ActionButtonStyle {
  const ActionButtonStyle({
    this.textStyle,
    this.borderRadius = 8.0,
    this.backgroundColor,
    this.border,
  });

  final TextStyle? textStyle;
  final double borderRadius;
  final Color? backgroundColor;
  final BoxBorder? border;

  ActionButtonStyle copyWith({
    TextStyle? textStyle,
    double? borderRadius,
    Color? backgroundColor,
    BoxBorder? border,
  }) {
    return ActionButtonStyle(
      textStyle: textStyle ?? this.textStyle,
      borderRadius: borderRadius ?? this.borderRadius,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      border: border ?? this.border,
    );
  }

  ActionButtonStyle merge(ActionButtonStyle? other) {
    if (other == null) return this;

    return copyWith(
      textStyle: other.textStyle,
      borderRadius: other.borderRadius,
      backgroundColor: other.backgroundColor,
      border: other.border,
    );
  }
}
