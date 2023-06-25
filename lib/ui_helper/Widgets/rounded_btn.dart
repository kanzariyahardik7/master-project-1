import 'package:flutter/material.dart';

class RundedBtn extends StatefulWidget {


  final String btnName;
  final Icon? btnIcon;
  final Color? btnColor;
  final TextStyle? btnStyle;
  final VoidCallback? callback;

  const RundedBtn({
    super.key,
    required this.btnName,
    this.btnIcon,
    this.btnColor,
    this.btnStyle,
    this.callback
  });

  @override
  State<RundedBtn> createState() => _RundedBtnState();
}

class _RundedBtnState extends State<RundedBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: widget.btnColor
      ),
        onPressed: (){
        widget.callback!();
        },
        child: widget.btnIcon != null? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.btnName),
            widget.btnIcon!
          ],
        ):Text(widget.btnName)
    );
  }
}

