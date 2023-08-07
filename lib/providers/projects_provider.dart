import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:marc_klesiewicz/models/projectmodel.dart';

final projectsProvider = StateProvider<List<ProjectModel>>((ref) {
  return [
    ProjectModel(
      'Monto',
      translate('monto_description'),
      'https://monto-rent.com/',
      [
        translate('monto_feature.one'),
        translate('monto_feature.two'),
        translate('monto_feature.three'),
        translate('monto_feature.four'),
      ],
      [
        'Flutter/Dart',
        'GraphQL',
        'Riverpod',
        'Autorouter',
        'Firebase',
        'Github',
        'ClickUp',
        'PlantUML',
        'VSCode',
        'Figma',
      ],
      ['assets/images/monto_phones.png'],
    )
  ];
});
