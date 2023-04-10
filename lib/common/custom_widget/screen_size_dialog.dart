import 'package:flutter/material.dart';

class CommonDialog extends StatefulWidget {
  const   CommonDialog({Key? key}) : super(key: key);

  @override
  State<CommonDialog> createState() => _CommonDialogState();
}

class _CommonDialogState extends State<CommonDialog> {

  @override
  Widget build(BuildContext context) {

    return const AlertDialog(
      title: Text("OOPS.."),
      content: Text("You cant reduce the size of page in admin panel.."),
    );
  }
}
