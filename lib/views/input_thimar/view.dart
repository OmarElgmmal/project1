import 'package:flutter/material.dart';

class InputNotification extends StatelessWidget {
  const InputNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "طلباتي",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => const _Item(),
        itemCount: 4,
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.02),
              offset: const Offset(0,6),
      blurStyle: BlurStyle.outer,
            blurRadius: 17
          ),
        ]
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "طلب #1",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const Text(
                "15يوليو2022",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff9C9C9C),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Image.network(
                          "https://healthiersteps.com/wp-content/uploads/2022/06/tomatoes-fresh.jpg",
                          height: 25,
                          width: 25,
                        )),
                    const SizedBox(
                      width: 3,
                    ),
                    Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Image.network(
                          "https://hicksnurseries.com/wp-content/uploads/2016/08/carrots-compressor.jpg",
                          height: 25,
                          width: 25,
                        )),
                    const SizedBox(
                      width: 3,
                    ),
                    Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Image.network(
                          "https://www.lahona.com/gallery/lahona_009/watermelon-for-babies.jpg",
                          height: 25,
                          width: 25,
                        )),
                    const SizedBox(
                      width: 3,
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "+2",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Container(
                height: 23,
                width: 95,
                decoration: BoxDecoration(
                  color: const Color(0xffEDF5E6),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                    child: Text(
                  "بإنتظار الموافقة",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                )),
              ),
              const SizedBox(
                height: 31,
              ),
              Text(
                "180ر.س",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
