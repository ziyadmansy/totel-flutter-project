import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';

import '../../core/enums/account_avatar_type.dart';
import '../../r.g.dart';

class AccountAvatar extends StatelessWidget {
  final String? url;
  final String? blurHash;
  final File? image;
  final bool showEditButton;
  final VoidCallback? editCallback;
  final VoidCallback? viewCallback;
  final AccountAvatarType type;

  const AccountAvatar(
      {Key? key,
      this.url,
      this.blurHash,
      this.image,
      this.showEditButton = false,
      this.editCallback,
      this.viewCallback,
      this.type = AccountAvatarType.Drawer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          onTap: viewCallback,
          child: Container(
            width: type.radius,
            height: type.radius,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(type.radius),
              border: type.border
                  ? Border.all(
                      width: 2.0,
                      color: Colors.white,
                    )
                  : null,
              boxShadow: type.shadow
                  ? [
                      const BoxShadow(
                        color: Color(0xff616161),
                        offset: Offset(0, 5),
                        blurRadius: 10,
                      ),
                    ]
                  : null,
            ),
            child: CircleAvatar(
              backgroundImage: (image == null
                  ? ((url.isNotNullOrEmpty)
                      ? NetworkImage(url!)
                      : R.image.img_avatar()) as ImageProvider<Object>?
                  : FileImage(image!)),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              radius: type.radius,
            ),
          ),
        ),
        if (showEditButton)
          Container(
            width: type.radius,
            height: type.radius,
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(type.radius),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: editCallback,
            ),
          ),
      ],
    );
  }
}
