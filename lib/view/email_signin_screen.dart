import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_/controller/email_signin_controller.dart';

class EmailSignIn extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  EmailSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signInController = Get.put(EmailSignInController());

    return Scaffold(
      appBar: AppBar(title: const Text('Login with Email')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Visibility(
                  visible: signInController.isLoading.value,
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: signInController.error.value?.isNotEmpty == true,
                  child: Text(
                    signInController.error.value ?? '',
                    style: const TextStyle(color: Colors.red, fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: signInController.emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: signInController.emptyValidator,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: signInController.passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                validator: signInController.emptyValidator,
              ),
              const SizedBox(height: 8),
              Center(
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      signInController.signInWithEmailAndPassword();
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
