import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/EditProductScreen';
  EditProductScreen({Key key}) : super(key: key);

  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageurlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageurlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  textColor: Colors.white,
                  onPressed: () {},
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.save),
                      Text("Salvar"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Titulo',
                  ),

                  /// Keyboard enter key set to [Next]
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Preço',
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                  ),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  onFieldSubmitted: (_) {
                    // FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  focusNode: _descriptionFocusNode,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Url da Imagem'),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.done,
                  controller: _imageurlController,
                ),
                Container(
                  width: 100,
                  height: 75,
                  margin: EdgeInsets.only(top: 8, right: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  child: _imageurlController.text.isEmpty
                      ? Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Preview',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        )
                      : FittedBox(
                          child: Image.network(_imageurlController.text),
                          fit: BoxFit.scaleDown,
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
