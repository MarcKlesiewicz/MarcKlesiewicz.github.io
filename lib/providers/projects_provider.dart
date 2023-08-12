import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:marc_klesiewicz/models/projectmodel.dart';

final projectsProvider = StateProvider<List<ProjectModel>>((ref) {
  return [
    ProjectModel(
      'Monto',
      translate('monto_description'),
      'monto-rent.com/',
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
    ),
    ProjectModel(
      'Selvhent',
      translate('selvhent_description'),
      'selvhent.com/',
      [
        translate('selvhent_feature.one'),
        translate('selvhent_feature.two'),
        translate('selvhent_feature.three'),
      ],
      [
        'Flutter/Dart',
        'Swagger/Code-gen',
        'Riverpod',
        'Autorouter',
        'Firebase',
        'Github',
        'ClickUp',
        'VSCode',
        'Figma',
      ],
      [
        'assets/images/selvhent_employee.jpg',
        'assets/images/selvhent_customer.jpg',
      ],
    ),
    ProjectModel(
      'MyEpi',
      translate('myepi_description'),
      'selvhent.com/',
      [
        translate('myepi_feature.one'),
        translate('myepi_feature.two'),
        translate('myepi_feature.three'),
        translate('myepi_feature.four'),
      ],
      [
        'Flutter/Dart',
        'Riverpod',
        'Autorouter',
        'Firebase/Firestore',
        'Github',
        'ClickUp',
        'VSCode',
        'Figma',
      ],
      [
        'assets/images/epi_screens.jpg',
        'assets/images/epi_home.jpg',
      ],
    ),
    ProjectModel(
      'Up N’ Down',
      translate('upndown_description'),
      'upndown.dk/',
      [
        translate('und_feature.one'),
        translate('und_feature.two'),
        translate('und_feature.three'),
      ],
      [
        'Flutter/Dart',
        'GraphQL',
        'Riverpod',
        'Autorouter',
        'Github',
        'ClickUp',
        'VSCode',
        'Figma',
      ],
      [
        'assets/images/und_screens.jpg',
      ],
    ),
    ProjectModel(
      'Parenthood',
      translate('parenthood_description'),
      null,
      [
        translate('parent_feature.apple_login'),
        translate('parent_feature.two'),
        translate('parent_feature.three'),
      ],
      [
        'Flutter/Dart',
        'Dio',
        'Riverpod',
        'Autorouter',
        'Github',
        'ClickUp',
        'VSCode',
        'Figma',
      ],
      [
        'assets/images/parent_screen.jpg',
      ],
    ),
    ProjectModel(
      'MealBuilder',
      translate('mealbuilder_description'),
      null,
      [
        translate('mealbuilder_feature.one'),
        translate('mealbuilder_feature.two'),
        translate('mealbuilder_feature.three'),
        translate('mealbuilder_feature.four'),
      ],
      [
        'Flutter/Dart',
        'Swagger/Code-gen',
        'Riverpod',
        'Autorouter',
        'Github',
        'ClickUp',
        'VSCode',
        'Figma',
      ],
      [
        'assets/images/mealbuilder_screens.jpg',
      ],
    ),
  ];
});