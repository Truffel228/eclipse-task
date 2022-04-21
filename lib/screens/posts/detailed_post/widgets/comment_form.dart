import 'package:flutter/material.dart';

class CommentForm extends StatefulWidget {
  const CommentForm({Key? key, required this.onApply}) : super(key: key);
  final void Function(
      {required String comment,
      required String email,
      required String name}) onApply;
  @override
  State<CommentForm> createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Name',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: theme.primaryColor, width: 2),
                ),
              ),
              validator: (text) =>
                  text!.isEmpty ? 'Name cannot be empty' : null,
              controller: _nameController,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: theme.primaryColor, width: 2),
                ),
              ),
              validator: (text) =>
                  text!.isEmpty ? 'Email cannot be empty' : null,
              controller: _emailController,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Comment',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: theme.primaryColor, width: 2),
                ),
              ),
              validator: (text) =>
                  text!.isEmpty ? 'Comment cannot be empty' : null,
              controller: _commentController,
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(context);
                  widget.onApply(
                    name: _nameController.text,
                    email: _emailController.text,
                    comment: _commentController.text,
                  );
                }
              },
              child: Text(
                'Apply',
                style: TextStyle(color: theme.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
