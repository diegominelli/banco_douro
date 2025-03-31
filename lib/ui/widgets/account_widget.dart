import 'package:banco_douro/models/account.dart';
import 'package:banco_douro/ui/styles/colors.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  final Account account;
  const AccountWidget({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightOrange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Column(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
      ),
    );
  }
}
