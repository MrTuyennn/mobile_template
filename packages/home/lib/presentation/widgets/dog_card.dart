import 'package:flutter/cupertino.dart';
import 'package:home/domain/entities/entities.dart';
import 'package:theme/theme.dart';

class DogCard extends StatelessWidget {
  const DogCard({super.key, this.dog = const DogEntities()});

  final IDogEntities dog;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final appColors = theme.appColors;
    final box = 100.0;
    final spacing = AppDimens.lg;
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: spacing),
      child: Row(
        spacing: spacing,
        children: [
          Container(
            height: box,
            width: box,
            decoration: BoxDecoration(
              color: appColors.active,
              borderRadius: BorderRadius.circular(box),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dog.dogAttributes.name,
                  style: TextStyle(color: appColors.active),
                ),
                Text(dog.dogAttributes.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
