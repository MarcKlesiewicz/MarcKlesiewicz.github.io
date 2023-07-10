import 'package:flutter/widgets.dart';
import 'package:marc_klesiewicz/theme/theme_definition.dart';
import 'package:marc_klesiewicz/utils/utils.dart';

class DefaultScrollbar extends StatelessWidget {
  final Widget child;
  final ScrollController scrollController;
  const DefaultScrollbar({
    Key? key,
    required this.child,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: scrollController,
      thickness: MediaQuery.of(context).size.width <= 500 ? 0 : 8,
      thumbColor: context.colors.tertiary,
      fadeDuration: Durations.ms200,
      radius: Radiuses.r05,
      interactive: true,
      child: child,
    );
  }
}
