import 'package:dropdown_button3/dropdown_button3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:marc_klesiewicz/theme/theme_definition.dart';
import 'package:marc_klesiewicz/utils/utils.dart';
import 'package:marc_klesiewicz/widgets/text/styled_text.dart';

enum AboutTypes { long, speed, generated, mom }

class AboutDropdownButton extends StatefulWidget {
  final void Function(AboutTypes type) onChanged;
  const AboutDropdownButton({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<AboutDropdownButton> createState() => _AboutDropdownButtonState();
}

class _AboutDropdownButtonState extends State<AboutDropdownButton> {
  AboutTypes _selectedValue = AboutTypes.long;
  @override
  Widget build(BuildContext context) {
    final items = AboutTypes.values
        .map((e) => DropdownMenuItem(
              value: e,
              child: TitleSmall.primary(
                translate('about_types.${e.name}'),
              ),
            ))
        .toList();
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        value: _selectedValue,
        items: items,
        onChanged: (value) {
          if (value != null) {
            widget.onChanged(value);
            setState(() {
              _selectedValue = value;
            });
          }
        },
        buttonDecoration: const BoxDecoration(
          borderRadius: BorderRadiuses.r02,
        ),
        dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadiuses.r02, color: context.colors.onPrimary),
      ),
    );
  }
}
