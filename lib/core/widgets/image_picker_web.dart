import 'dart:async';
import 'dart:html' as html;
import 'dart:typed_data';

Future<Uint8List?> pickImageWeb() async {
  final html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
  uploadInput.accept = 'image/*';
  uploadInput.click();

  final completer = Completer<Uint8List?>();

  uploadInput.onChange.listen((e) {
    final file = uploadInput.files!.first;
    final reader = html.FileReader();

    reader.readAsArrayBuffer(file);
    reader.onLoadEnd.listen((e) {
      completer.complete(reader.result as Uint8List);
    });
  });

  return completer.future;
}
