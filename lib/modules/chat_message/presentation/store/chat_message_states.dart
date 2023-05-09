abstract class ChatMessageStates{}

class IntialChatMessageState extends ChatMessageStates{}
class AddMessage extends ChatMessageStates{}
class OnTextChanged extends ChatMessageStates{}
class onEmojiShowed extends ChatMessageStates{}
class onReplyShowed extends ChatMessageStates{}
class onRepliedSet extends ChatMessageStates{}
class onPanelShowen extends ChatMessageStates{}
class InitialUploadChatImage extends ChatMessageStates{}
class ImageSelectedState extends ChatMessageStates{}