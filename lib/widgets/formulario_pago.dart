import 'package:flutter/material.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormCard extends StatefulWidget {
  const FormCard({Key? key}) : super(key: key);

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  var cardMask = MaskTextInputFormatter(
      mask: '#### #### #### ####', filter: {"#": RegExp(r'[0-9]')});
  var dateMask =
      MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
  var codeMask =
      MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(
              "https://www.mastercard.es/content/dam/public/mastercardcom/eu/es/images/Consumidores/escoge-tu-tarjeta/credito/credito-estandar/card-image-standard-credit-card.png"),
          const SizedBox(
            height: 20,
          ),
          _inputNombre(),
          const SizedBox(
            height: 10,
          ),
          _inputCard(),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: _inputDate(),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: _inputCode(),
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width - 30,
            margin: const EdgeInsets.all(15),
            child: ElevatedButton(onPressed: () {}, child: const Text("Pagar")),
          ),
        ],
      ),
    );
  }

  Container _inputNombre() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
            hintText: "Nombre y Apellido", border: InputBorder.none),
      ),
    );
  }

  Container _inputCard() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        inputFormatters: [cardMask],
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
            hintText: "0000 0000 0000 0000", border: InputBorder.none),
      ),
    );
  }

  Container _inputDate() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        inputFormatters: [dateMask],
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 20),
        decoration:
            const InputDecoration(hintText: "01/24", border: InputBorder.none),
      ),
    );
  }

  Container _inputCode() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        inputFormatters: [codeMask],
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 20),
        decoration:
            const InputDecoration(hintText: "000", border: InputBorder.none),
      ),
    );
  }
}
