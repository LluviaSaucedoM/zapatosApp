import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/src/helpers/helpers.dart';
import 'package:shoes/src/models/zapato_model.dart';
import 'package:shoes/src/widgets/custom_widgets.dart';

class ZapatoDecripcionPage extends StatelessWidget {
  const ZapatoDecripcionPage({super.key});

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            const Hero(
                tag: 'zapato-1', child: ZapatoSizePreview(fullStreen: true)),
            Positioned(
                top: 50,
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pop(context);
                    cambiarStatusDark();
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 60,
                  ),
                ))
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const ZapatoDescipcion(
                titulo: 'Nike Air Max 720',
                descripcion:
                    "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
              ),
              _CompraAhora(),
              _ColoresMas(),
              _BotonesLike(),
            ],
          ),
        ))
      ]),
    );
  }
}

class _BotonesLike extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _BotonSombreado(
            Icon(Icons.star, color: Colors.red, size: 25),
          ),
          _BotonSombreado(
            Icon(Icons.add_shopping_cart,
                color: Colors.grey.withOpacity(0.4), size: 25),
          ),
          _BotonSombreado(
            Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25),
          ),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  const _BotonSombreado(this.icon);
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
      child: icon,
    );
  }
}

class _ColoresMas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                left: 90,
                child: BotonColor(Color(0xFF364D56), 4, 'images/negro.png'),
              ),
              Positioned(
                  left: 60,
                  child: BotonColor(Color(0xFF2099F1), 3, 'images/azul.png')),
              Positioned(
                  left: 30,
                  child:
                      BotonColor(Color(0xFFFFAD29), 2, 'images/amarillo.png')),
              BotonColor(Color(0xFFC6D642), 1, 'images/verde.png'),
            ],
          )),
          BotonNaranaja(
            texto: 'More releate items',
            alto: 30,
            ancho: 170,
            color: Color(0xFFFFC675),
          )
        ],
      ),
    );
  }
}

class BotonColor extends StatelessWidget {
  const BotonColor(this.color, this.index, this.urlImage, {super.key});

  final Color color;
  final int index;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = urlImage;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _CompraAhora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            const Text(
              '\$180.0',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Bounce(
              delay: const Duration(microseconds: 50),
              from: 8,
              child: const BotonNaranaja(
                texto: 'Buy now',
                alto: 40,
                ancho: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
