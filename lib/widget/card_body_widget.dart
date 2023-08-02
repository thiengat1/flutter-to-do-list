import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  const CardBody(
      {Key? key,
      required this.item,
      required this.deleteTask,
      required this.index})
      : super(key: key);
  final item;

  final Function deleteTask;
  final int index;

  void handleDelete() {
    deleteTask(item.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      height: 70,
      decoration: BoxDecoration(
        color: index % 2 == 0
            ? Colors.green
            : const Color.fromARGB(255, 149, 146, 136),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            item.name,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () async {
              if (await confirm(context)) {
                return handleDelete();
              }
              return;
            },
            hoverColor: Colors.amber,
            child: const Icon(
              Icons.delete_outline,
              size: 20,
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }
}
