import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/components/notet_settings.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function() onEditPressed;
  final void Function() onDeletePressed;

  const NoteTile({
    super.key,
    required this.text,
    required this.onDeletePressed,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(
        top: 10,
        left: 25,
        right: 25,
      ),
      child: ListTile(
        title: Text(
          text,
          style: GoogleFonts.dmSerifText(
            fontSize: 18,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        trailing: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              showPopover(
                context: context,
                bodyBuilder: (context) {
                  return NotetSettings(
                    onDeleteTap: onDeletePressed,
                    onEditTap: onEditPressed,
                  );
                },
                height: 100,
                width: 100,
                backgroundColor: Theme.of(context).colorScheme.surface,
              );
            },
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          );
        }),
      ),
    );
  }
}
