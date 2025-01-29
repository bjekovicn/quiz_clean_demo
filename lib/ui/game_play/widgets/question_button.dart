import 'package:flutter/material.dart';

class QuestionButton extends StatefulWidget {
  const QuestionButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isDisabled,
    required this.isSelected,
  });
  final String text;
  final Function() onPressed;
  final bool isDisabled;
  final bool isSelected;

  @override
  State<QuestionButton> createState() => _QuestionButtonState();
}

class _QuestionButtonState extends State<QuestionButton> {
  late bool isDisabled;
  late bool isSelected;

  @override
  void initState() {
    isDisabled = widget.isDisabled;
    isSelected = widget.isSelected;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant QuestionButton oldWidget) {
    isDisabled = widget.isDisabled;
    isSelected = widget.isSelected;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (isSelected) return Colors.amber;
              if (isDisabled) return Colors.grey;
              return Colors.blue.shade300;
            },
          ),
        ),
        onPressed: isDisabled
            ? null
            : () {
                widget.onPressed();
                isDisabled = true;
              },
        child: Text(widget.text),
      ),
    );
  }
}
