import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_/controller/email_create_controller.dart';

class EmailCreate extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  EmailCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = Get.put(EmailCreateController());

    return Scaffold(
      appBar: AppBar(title: const Text('Crear cuenta')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Visibility(
                  visible: emailController.isLoading.value,
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: emailController.error.value?.isNotEmpty == true,
                  child: Text(
                    emailController.error.value ?? '',
                    style: const TextStyle(color: Colors.red, fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: emailController.emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: emailController.emailValidator,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: emailController.passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                validator: emailController.passwordValidator,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: emailController.repeatPasswordController,
                decoration:
                    const InputDecoration(labelText: 'Repetir Contraseña'),
                validator: emailController.passwordValidator,
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Crear'),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      Get.find<EmailCreateController>()
                          .createUserWithEmailAndPassword();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
