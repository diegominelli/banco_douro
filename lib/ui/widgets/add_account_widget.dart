import 'package:banco_douro/models/account.dart';
import 'package:banco_douro/services/account_service.dart';
import 'package:banco_douro/ui/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddAccountModal extends StatefulWidget {
  const AddAccountModal({super.key});

  @override
  State<AddAccountModal> createState() => _AddAccountModalState();
}

class _AddAccountModalState extends State<AddAccountModal> {
  String _accountType = "DIEGO";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: EdgeInsets.only(
        left: 32,
        right: 32,
        top: 32,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                "assets/icon_add_account.png",
                width: 64,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Adicionar nova conta",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Preencha os dados abaixo: ",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(label: Text("Nome")),
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(label: Text("Último nome")),
            ),
            const SizedBox(height: 16),
            const Text("Tipo da conta"),
            DropdownButton<String>(
              value: _accountType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: "DIEGO",
                  child: Text("Diego"),
                ),
                DropdownMenuItem(
                  value: "CANJICA",
                  child: Text("Canjica"),
                ),
                DropdownMenuItem(
                  value: "PUDIM",
                  child: Text("Pudim"),
                ),
                DropdownMenuItem(
                  value: "BRIGADEIRO",
                  child: Text("Brigadeiro"),
                ),
              ],
              onChanged: (valor) {
                if (valor != null) {
                  setState(() {
                    _accountType = valor;
                  });
                }
              },
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: (isLoading)
                        ? null
                        : () {
                            onButtoncancelClicked();
                          },
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      onButtonSendClicked();
                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        AppColors.orange,
                      ),
                    ),
                    child: (isLoading)
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ))
                        : const Text(
                            "Adicionar",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  onButtoncancelClicked() {
    if (!isLoading) {
      Navigator.pop(context);
    }
  }

  onButtonSendClicked() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      String name = _nameController.text;
      String lastName = _lastNameController.text;

      Account account = Account(
        id: const Uuid().v1(),
        name: name,
        lastName: lastName,
        balance: 0,
        accountType: _accountType,
      );

      await AccountService().addAccount(account);

      closeModal();
    }
  }

  closeModal() {
    Navigator.pop(context);
  }
}
