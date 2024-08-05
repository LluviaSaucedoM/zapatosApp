import 'package:flutter/material.dart';
import 'package:shoes/src/widgets/custom_widgets.dart';

class AgregarCarritoBoton extends StatelessWidget {
  const AgregarCarritoBoton({super.key, required this.monto});
  final double monto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.10),
            borderRadius: BorderRadius.circular(100)),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Text(
              '\$$monto',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ), 
           const Spacer(),
           const BotonNaranaja(texto: 'Buy',),
           const SizedBox(width: 20,)
          ],
        ),
      ),
    );
  }
}



