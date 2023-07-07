import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortuna/provider/infoProvider.dart';
import 'package:fortuna/service/color.dart';
import 'package:fortuna/service/extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:styled_widget/styled_widget.dart';

class Profile extends HookConsumerWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var info = ref.read(infoProvider)!;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: HexColor("#101212"),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(info.name).bold().fontSize(20),
          const SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset("assets/images/ic_fatecheck_calendar.svg"),
              const SizedBox(width: 5),
              Text(
                (info.isLunar ? "음력 " : "양력 ") + DateFormat("yyyy년 M월 d일 hh:mm").format(info.date) + " 생",
              ).textColor(gray),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset("assets/images/ic_fatecheck_phone.svg"),
              const SizedBox(width: 5),
              Text(
                info.phone,
              ).textColor(gray),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset("assets/images/ic_fatecheck_email.svg"),
              const SizedBox(width: 5),
              Text(
                info.email,
              ).textColor(gray),
            ],
          ),
        ],
      ),
    );
  }
}
