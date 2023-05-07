import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;

class EmojisKeyBoard extends StatelessWidget {
  EmojisKeyBoard({Key? key, this.emojiKeyboardController,this.isEmojiOn = false,this.onEmojiSelected,this.onBackspacePressed}) : super(key: key);

  TextEditingController? emojiKeyboardController;
  bool isEmojiOn;
  OnEmojiSelected? onEmojiSelected;
  OnBackspacePressed? onBackspacePressed;
  @override
  Widget build(BuildContext context) {
    return isEmojiOn
        ? Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: EmojiPicker(
              onBackspacePressed: onBackspacePressed,
              textEditingController: emojiKeyboardController,
              onEmojiSelected: onEmojiSelected,
              // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
              config: Config(
                columns: 7,
                emojiSizeMax: 32 *
                    (foundation.defaultTargetPlatform == TargetPlatform.iOS
                        ? 1.30
                        : 1.0),
                // Issue: https://github.com/flutter/flutter/issues/28894
                verticalSpacing: 0,
                horizontalSpacing: 0,
                gridPadding: EdgeInsets.zero,
                initCategory: Category.RECENT,
                bgColor: Color(0xFFF2F2F2),
                indicatorColor: Colors.blue,
                iconColor: Colors.grey,
                iconColorSelected: Colors.blue,
                backspaceColor: Colors.blue,
                skinToneDialogBgColor: Colors.white,
                skinToneIndicatorColor: Colors.grey,
                enableSkinTones: true,
                showRecentsTab: true,
                recentsLimit: 28,
                noRecents: const Text(
                  'No Recents',
                  style: TextStyle(fontSize: 20, color: Colors.black26),
                  textAlign: TextAlign.center,
                ),
                // Needs to be const Widget
                loadingIndicator: const SizedBox.shrink(),
                // Needs to be const Widget
                tabIndicatorAnimDuration: kTabScrollDuration,
                categoryIcons: const CategoryIcons(),
                buttonMode: ButtonMode.MATERIAL,
              ),
            ),
          )
        : Container();
  }
}
