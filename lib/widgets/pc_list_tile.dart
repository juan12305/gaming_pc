import 'package:flutter/material.dart';
import '../models/pc_gamer.dart';

class PcListTile extends StatelessWidget {
  final PcGamer pc;
  final VoidCallback onTap;

  PcListTile({required this.pc, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(pc.name),
      onTap: onTap,
    );
  }
}
