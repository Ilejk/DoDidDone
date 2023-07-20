import 'package:todo_app/common/export/export.dart';

class ReusableTextWidget extends StatelessWidget {
  const ReusableTextWidget({
    super.key,
    required this.text,
    this.textStyle,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
  });
  final String text;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      style: textStyle,
    );
  }
}
