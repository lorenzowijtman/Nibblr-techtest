import 'package:flutter/material.dart';
import 'package:todoapp/src/styles/styles.dart';

class CustomButtonBar extends StatelessWidget {
  const CustomButtonBar(
      {Key key, this.deleteCall, this.saveCall, this.editCall})
      : super(key: key);

  final Function saveCall;
  final Function deleteCall;
  final Function editCall;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        (deleteCall != null)
            ? Expanded(
                child: TextButton(
                  style: Styles.deleteButton,
                  onPressed: deleteCall,
                  child: Text(
                    'Delete',
                    style: Styles.buttonText,
                  ),
                ),
              )
            : Column(),
        (editCall != null)
            ? Expanded(
                child: TextButton(
                  style: Styles.editButton,
                  onPressed: editCall,
                  child: Text('Edit', style: Styles.buttonText),
                ),
              )
            : Column(),
        (saveCall != null)
            ? Expanded(
                child: TextButton(
                  style: Styles.completeButton,
                  onPressed: saveCall,
                  child: Text('Save', style: Styles.buttonText),
                ),
              )
            : Column(),
      ],
    );
  }
}
