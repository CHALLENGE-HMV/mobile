import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minha_saude/screens/remedios.dart';

void main(){
  testWidgets('RemediosPage_LogoHMV_When_WidgetOpened_Should_Display', (WidgetTester tester) async{
    //arrange
    await tester.pumpWidget(MaterialApp(home: RemediosPage()));

    //act

    //assert
  });
}