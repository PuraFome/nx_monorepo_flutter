import 'package:flutter/material.dart';

void main() => runApp(MeusRendimentosDebitos());

class MeusRendimentosDebitos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: FormularioRendimentoDebito(),
      ),
    );
  }
}

class FormularioRendimentoDebito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();
  final TextEditingController _controladorCampoDescricao =
      TextEditingController();
  bool mensal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Novo Rendimento ou Debito'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _controladorCampoValor,
                style: TextStyle(
                  fontSize: 24,
                ),
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'valor',
                  hintText: '00.00',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _controladorCampoDescricao,
                style: TextStyle(
                  fontSize: 24,
                ),
                decoration: InputDecoration(
                  labelText: 'descrição',
                  hintText: 'Empresa ou local',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final String valor = _controladorCampoValor.text;
                final String descricao = _controladorCampoDescricao.text;
              },
              child: const Text('salvar'),
            ),
          ],
        ));
  }
}

class ListaRendimentosDebitos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rendimentos e Debitos'),
      ),
      body: Column(children: <Widget>[
        ItemRedimentoDebito(
            RendimentoDebito(321.5, 'teste', '01/01/2000', false)),
        ItemRedimentoDebito(
            RendimentoDebito(31.5, 'teste', '01/01/2000', false)),
        ItemRedimentoDebito(
            RendimentoDebito(3.5, 'teste', '01/01/2000', false)),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print(Text('teste')),
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemRedimentoDebito extends StatelessWidget {
  final RendimentoDebito _rendimentoDebito;

  ItemRedimentoDebito(this._rendimentoDebito);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_rendimentoDebito.valor.toString()),
      subtitle: Text(_rendimentoDebito.descricao),
    ));
  }
}

class RendimentoDebito {
  final double valor;
  final String descricao;
  final String data;
  final bool mensal;

  RendimentoDebito(this.valor, this.descricao, this.data, this.mensal);
}
