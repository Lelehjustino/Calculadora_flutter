import 'package:flutter/material.dart';

class Display extends StatelessWidget {

  final  String text; /* passei um parametro em que espero receber um texto */

  Display(this.text); /* 444 */

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Color.fromRGBO(48, 48, 48, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[   /*para o que serve o "<Widget>" */
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.scaleDown, // Evita extrapolar o tamanho do container
                alignment: Alignment.centerRight, // Alinha como TextAlign.end
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    decoration: TextDecoration.none,
                    fontSize: 80,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ), /* o filho é o valor que eu passei como parametro em 444*/
      ),
    );
  }
}