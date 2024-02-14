import 'package:flutter/material.dart';
import 'package:kaizen_be_better/layout/kaizen_colors.dart';
import 'package:kaizen_be_better/layout/navigation_bar.dart';

class RegisterTaskScreen extends StatefulWidget {
  const RegisterTaskScreen({super.key});

  @override
  State<RegisterTaskScreen> createState() => _RegisterTaskScreenState();
}

class _RegisterTaskScreenState extends State<RegisterTaskScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kaizen: Be Better', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromRGBO(18, 18, 40, 1),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor(KaizenColors.generalWhite),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child:  Icon(
          Icons.check,
          color: HexColor(KaizenColors.primaryColor),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterTaskScreen()));
        },
      ),
      backgroundColor: const Color.fromRGBO(25, 25, 40, 1),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: HexColor(KaizenColors.generalWhite)),
                    decoration:  InputDecoration(hintText: 'Nome da atividade', hintStyle: TextStyle(color: HexColor(KaizenColors.generalWhite))),
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(hintText: 'Data')
                  ),
                  TextFormField(
                      decoration: const InputDecoration(hintText: 'Hora')
                  ),
                ],
              ),)
        ),
      ),
    );
  }
}
