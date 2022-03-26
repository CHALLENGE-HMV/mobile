import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minha_saude/screens/consultas.dart';

void main(){
  testWidgets('ConsultasPage_LogoHMV_When_WidgetOpened_Should_Display', (WidgetTester tester) async{
    //arrange
    await tester.pumpWidget(MaterialApp(home: ConsultasPage()));

    //act

    //assert
  });
}