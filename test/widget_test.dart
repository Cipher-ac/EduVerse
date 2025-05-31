import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:full/main.dart'; // Ajuste conforme o seu caminho do projeto

void main() {
  testWidgets('BottomNavigationBar switches screens', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verifica se a tela inicial (Início/PostScreen) está visível
    expect(find.byKey(const Key('screen-inicio-post')), findsOneWidget);

    // Navega para Video Aulas
    await tester.tap(find.text('Video Aulas'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('screen-video')), findsOneWidget);

    // Navega para Postar (mesmo que seja placeholder agora)
    await tester.tap(find.text('Postar'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('screen-postar-placeholder')), findsOneWidget);

    // Navega para Grupos
    await tester.tap(find.text('Grupos'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('screen-grupos')), findsOneWidget);

    // Navega para Chat
    await tester.tap(find.text('Chat'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('screen-chat')), findsOneWidget);
  });
}
