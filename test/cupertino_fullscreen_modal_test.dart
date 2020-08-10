import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cupertino_fullscreen_modal/cupertino_fullscreen_modal.dart';

void main() {
  Key openModalKey = Key('open-modal');
  Key startingScreenKey = Key('starting-screen');
  Key modalKey = Key('modal');
  Key closeModalKey = Key('close-modal');
  Key onClose = Key('on-close');
  testWidgets('Testing widget sizes when modal is opened', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CupertinoFullscreenModal(
              child: Builder(
                builder: (BuildContext context) => Container(
                  key: startingScreenKey,
                  child: GestureDetector(
                    key: openModalKey,
                    onTap: () {
                      CupertinoFullscreenModal.of(context).showModal(
                        Container(
                          child: GestureDetector(
                            key: closeModalKey,
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('close'),
                          ),
                        ),
                        onClose: (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Container(
                                    key: onClose,
                                    width: 10,
                                    height: 10,
                                  )),
                        ),
                      );
                    },
                    child: Text('open'),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      Finder openModalButton = find.byKey(openModalKey);
      await tester.tap(openModalButton);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      Finder modal = find.byKey(modalKey);
      expect(modal, findsOneWidget);
      Size modalSize = tester.getSize(find.byKey(modalKey));
      expect(modalSize.height, 540);
      Size startingScreenSize = tester.getSize(find.byKey(startingScreenKey));
      expect(startingScreenSize.width, 740);
      expect(startingScreenSize.height, 500);

      Finder closeModalButton = find.byKey(closeModalKey);
      await tester.tap(closeModalButton);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      expect(modal, findsNothing);
    });
  });
  testWidgets('Testing on close callback', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CupertinoFullscreenModal(
              child: Builder(
                builder: (BuildContext context) => Container(
                  key: startingScreenKey,
                  child: GestureDetector(
                    key: openModalKey,
                    onTap: () {
                      CupertinoFullscreenModal.of(context).showModal(
                        Container(
                          child: GestureDetector(
                            key: closeModalKey,
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('close'),
                          ),
                        ),
                        onClose: (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Container(
                                    key: onClose,
                                    width: 10,
                                    height: 10,
                                  )),
                        ),
                      );
                    },
                    child: Text('open'),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      Finder openModalButton = find.byKey(openModalKey);
      await tester.tap(openModalButton);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      Finder closeModalButton = find.byKey(closeModalKey);
      await tester.tap(closeModalButton);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      Finder onCloseScreen = find.byKey(onClose);
      await tester.pumpAndSettle();
      expect(onCloseScreen, findsOneWidget);
    });
  });
}
