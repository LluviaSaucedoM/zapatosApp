import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/src/helpers/helpers.dart';
import 'package:shoes/src/models/zapato_model.dart';
import 'package:shoes/src/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  const ZapatoSizePreview({super.key, this.fullStreen = false});

  final bool? fullStreen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (fullStreen == false) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const ZapatoDecripcionPage(),
            ),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullStreen! ? 5 : 30,
          vertical: fullStreen! ? 5 : 0,
        ),
        child: Container(
          width: double.infinity,
          height: fullStreen! ? 420 : 430,
          decoration: BoxDecoration(
            color: const Color(0xFFFFCF53),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(children: [
            _ZapatoConSompra(),
            if (fullStreen == false) _ZapatoTallas()
          ]),
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TallaZapatoCaja(6),
          _TallaZapatoCaja(7.5),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(8.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  const _TallaZapatoCaja(this.numero);
  final double numero;

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    cambiarStatusDark();

    return GestureDetector(
      onTap: () {
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talla = numero;
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: numero == zapatoModel.talla
                ? const Color(0xFFF1A23A)
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (numero == zapatoModel.talla)
                const BoxShadow(
                    color: Color(0xFFF1A23A),
                    blurRadius: 10,
                    offset: Offset(0, 5))
            ]),
        alignment: Alignment.center,
        child: Text(
          numero.toString().replaceAll('.0', ''),
          style: TextStyle(
              color: numero == zapatoModel.talla
                  ? Colors.white
                  : const Color(0xFFF1A23A),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _ZapatoConSompra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(bottom: 20, right: 0, child: _Zombra()),
          Image(image: AssetImage(zapatoModel.assetImage)),
        ],
      ),
    );
  }
}

class _Zombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(color: Color(0xFFEAA14E), blurRadius: 40),
          ],
        ),
      ),
    );
  }
}
