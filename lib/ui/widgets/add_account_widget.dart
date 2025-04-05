import 'package:banco_douro/ui/styles/colors.dart';
import 'package:flutter/material.dart';

class AddAccountModal extends StatefulWidget {
  const AddAccountModal({super.key});

  @override
  State<AddAccountModal> createState() => _AddAccountModalState();
}

class _AddAccountModalState extends State<AddAccountModal> {
  String _accountType = "DIEGO";

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
              decoration: const InputDecoration(label: Text("Nome")),
            ),
            TextFormField(
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
                    onPressed: () {},
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
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        AppColors.orange,
                      ),
                    ),
                    child: const Text(
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
}
