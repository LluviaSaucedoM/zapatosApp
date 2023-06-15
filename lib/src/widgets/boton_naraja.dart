import 'package:flutter/material.dart';

class BotonNaranaja extends StatelessWidget {
  const BotonNaranaja({
    super.key,
    required this.texto,
    this.ancho = 150,
    this.alto = 45,
    this.color = Colors.orange,
  });
  final String texto;
  final double? ancho;
  final double? alto;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: ancho,
      height: alto,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
      child: Text(
        texto,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
