import 'package:flutter/material.dart';

class AddItems extends StatefulWidget {
  final TextEditingController firstController;
  final TextEditingController secondController;
  final Function(String) onAdd;

  AddItems({
    required this.firstController,
    required this.secondController,
    required this.onAdd,
  });

  @override
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  bool _showErrors = false;

  void _validateForm() {
    setState(() {
      _showErrors = true;
    });
  }

  void _clearTextFields() {
    setState(() {
      widget.firstController.clear();
      widget.secondController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: widget.firstController,
          decoration: InputDecoration(
            hintText: 'Add Title',
            errorText: _showErrors && widget.firstController.text.isEmpty
                ? 'Please enter a value'
                : null,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: widget.secondController,
          decoration: InputDecoration(
            hintText: 'Add Description',
            errorText: _showErrors && widget.secondController.text.isEmpty
                ? 'Please enter a value'
                : null,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (widget.firstController.text.isEmpty ||
                widget.secondController.text.isEmpty) {
              _validateForm();
            } else {
              setState(() {
                _showErrors = false;
              });
              widget.onAdd(
                  '${widget.firstController.text} - ${widget.secondController.text}');
              _clearTextFields();
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
