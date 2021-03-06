import 'package:andre_suplementos/models/product.dart';
import 'package:flutter/material.dart';
import 'components/images_from.dart';
import 'package:andre_suplementos/screens/edit_product/components/sizes_form.dart';

class EditProductScreen extends StatelessWidget {

  EditProductScreen(Product p) :
        editing = p != null,
        product = p != null ? p.clone() : Product();

  final Product product;
  final bool editing;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(editing ? 'Editar Anúncio' : 'Criar Anúncio'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            ImagesForm(product),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    initialValue: product.name,
                    decoration: const InputDecoration(
                      hintText: 'Título',
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                    ),
                    validator: (name){
                      if(name.length < 6)
                        return 'Título muito curto';
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'A partir de',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    'R\$ ...',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      'Descrição',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextFormField(
                    initialValue: product.description,
                    style: const TextStyle(
                        fontSize: 16
                    ),
                    decoration: const InputDecoration(
                        hintText: 'Descrição',
                        border: InputBorder.none
                    ),
                    maxLines: null,
                    validator: (desc){
                      if(desc.length < 10)
                        return 'Descrição muito curta';
                      return null;
                    },
                  ),
                  SizesForm(product),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 44,
                    child: RaisedButton(
                      onPressed: (){
                        if(formKey.currentState.validate()){
                          print('válido!!!');
                        }
                      },
                      textColor: Colors.white,
                      color: primaryColor,
                      disabledColor: primaryColor.withAlpha(100),
                      child: const Text(
                        'Salvar',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}