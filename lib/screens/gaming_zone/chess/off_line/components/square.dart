import 'package:flutter/material.dart';
import 'package:super_home_member/screens/gaming_zone/chess/off_line/components/pieces.dart';
import 'package:super_home_member/screens/gaming_zone/chess/off_line/values/colors.dart';

class Square extends StatelessWidget {
  final void Function()? onTap;
  final bool isValidMove;
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  const Square(
      {super.key,
      required this.onTap,
      required this.isValidMove,
      required this.isWhite,
      required this.piece,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    Color? squareColor;

    if (isSelected) {
      squareColor = Colors.lightBlue[100];
    } else if (isValidMove) {
      squareColor = Colors.lightBlue[50];
    }
    // otherwise, it's white or black
    else {
      squareColor = isWhite ? backgroundColor : forgroundColor;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareColor,
        child: piece != null
            ? Image.asset(
                piece!.imagePath,
                color: piece!.isWhite ? null : Colors.black,
              )
            : null,
      ),
    );
  }
}
