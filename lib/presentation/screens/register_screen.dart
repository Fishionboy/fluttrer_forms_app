import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/inputs/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children:const [

              FlutterLogo(size: 100,),
           
              _RegisterForm(),

              SizedBox(height: 20,)     ,       

          
            ] 
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            validator: (value) {
            if(value == null || value.isEmpty) return 'campo requerido'; 
            if(value.trim().isEmpty) return 'campo requerido';
            if(value.length < 6) return 'Más de 6 letras';
            return null;
            },
            onChanged: (value) => username = value),

          SizedBox(height: 10,),

          CustomTextFormField(
            label: 'Correo electrónico',
            validator: (value) {
            if(value == null || value.isEmpty) return 'campo requerido'; 
            if(value.trim().isEmpty) return 'campo requerido';
            final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            );
            if(!emailRegExp.hasMatch(value)) return 'Formato Email incorrecto';
            return null;
            },
            onChanged: (value) => email = value),

          SizedBox(height: 10,),
          
          CustomTextFormField(
            label: 'Contraseña',
            validator: (value) {
            if(value == null || value.isEmpty) return 'campo requerido'; 
            if(value.trim().isEmpty) return 'campo requerido';
            if(value.length < 6) return 'Más de 6 letras';
            return null;
            },
            onChanged: (value) => password = value,
            obscureText: true),

          SizedBox(height: 10,),
         

          const SizedBox(height: 20,),

          FilledButton(
            onPressed: (){
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;
              print('$username, $email, $password');
            }, 
            child: Text('Nuevo usuario')),
        ],
      ),
    );
  }
}