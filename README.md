# cupertino_fullscreen_modal

A new flutter plugin project.

A Flutter widget for displaying fullscreen modal iOS style.
## Installing:

Add the following to your `pubspec.yaml` file:

    dependencies:
      cupertino_fullscreen_modal: ^0.0.1

## 

## Usage

Wrap your widget `CupertinoFullscreenModal`. After doing that you can use:

      CupertinoFullscreenModal.of(context).showModal(Widget child, onClose (popValue) {});

popValue is the ThEValue passed in 

    Navigator.of(context).pop(ThEValue)
##

## Demo
![Example](https://i.imgur.com/zr8YjVm.gif)
