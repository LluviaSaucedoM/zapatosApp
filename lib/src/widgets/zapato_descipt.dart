import 'package:flutter/material.dart';

class ZapatoDescipcion extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const ZapatoDescipcion({
    super.key,
    required this.titulo,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            titulo,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
            SizedBox(height: 20),
            Text(
            descripcion,
            style: TextStyle( color: Colors.black38, height: 1.5),
          )
        ],
      ),
    );
  }
}
