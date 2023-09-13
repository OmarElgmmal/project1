import 'package:flutter/material.dart';

import 'model.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List<NotificationModel> list = [
    NotificationModel(
      body:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
      time: "منذ ساعتان",
      title: "تم قبول طلبك وجاري تحضيره الأن",
      image:
          "https://img.freepik.com/free-photo/3d-icon-blue-speech-bubble-with-bell_107791-16815.jpg?w=740&t=st=1693743530~exp=1693744130~hmac=a944167d98d25f5a50388f614e8c30ab469c0567a67d44b16cf405938bcceba0",
    ),
    NotificationModel(
      body:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
      time: "منذ ساعتان",
      title: "رسالة إدارية",
      image:
          "https://img.freepik.com/free-vector/vector-icon-set-chat-bubble-white-blue-message-texting_134830-1235.jpg?w=1060&t=st=1693746313~exp=1693746913~hmac=68aa71218423cd1cdaaff78d65c810720518c2d06f586bf266460de7d0b6ee5b",
    ),
    NotificationModel(
      body:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
      time: "منذ ساعتان",
      title: "عروض جديدة بإنتظارك",
      image:
          "https://img.freepik.com/free-psd/3d-social-media-question-engagement-user-interface-icon-isolated_47987-11630.jpg?w=740&t=st=1693746364~exp=1693746964~hmac=651775349bc7b0db36d8c887de08f21c0a8026aeb94370b270d35e85c3e6ba42",
    ),
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isLoading = true;

  getData() async {
    await Future.delayed(
      const Duration(
        seconds: 5,
      ),
    );
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "الإشعارات",
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsetsDirectional.all(16),
              itemBuilder: (context, index) => _Item(model: list[index]),
              itemCount: list.length,
            ),
    );
  }
}

class _Item extends StatelessWidget {
  final NotificationModel model;

  const _Item({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsetsDirectional.all(6),
            width: 33,
            height: 33,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(.13),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Image.network(
              model.image,
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  model.body,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  model.time,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
