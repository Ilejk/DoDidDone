import 'package:todo_app/common/export/export.dart';

class ExpansionTiles extends StatelessWidget {
  const ExpansionTiles({
    super.key,
    required this.title,
    required this.subtitle,
    this.onExpnasioncahned,
    this.trailing,
    required this.children,
  });
  final String title;
  final String subtitle;
  final void Function(bool)? onExpnasioncahned;
  final Widget? trailing;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryDarkGrey,
        borderRadius: BorderRadius.circular(AppConsts.kRadius),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: BottomTitles(
            title: title,
            subtitle: subtitle,
          ),
          tilePadding: EdgeInsets.zero,
          onExpansionChanged: onExpnasioncahned,
          trailing: trailing,
          children: children,
        ),
      ),
    );
  }
}
