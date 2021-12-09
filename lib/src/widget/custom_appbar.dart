import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_logo(), _actions()],
    );
  }

  SizedBox _logo() {
    return SizedBox(
      width: 80,
      child: Image.asset("assets/images/logo.png"),
    );
  }

  Row _actions() {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active_outlined,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        SizedBox(
          width: 24,
          height: 24,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        const CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(
            "https://w.namu.la/s/e1203086a408b9b55a50210bf3e08d6e7646d659853010adb9bb76acede0dded64c90aaaaa78fcc5c788f304a01d459cf6b659654beac249814f1196c65413ecd88ac7030dde18242d2c46f1f87abab2",
          ),
        )
      ],
    );
  }
}
