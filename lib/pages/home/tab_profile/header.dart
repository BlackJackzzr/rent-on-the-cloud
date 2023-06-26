import 'package:flutter/material.dart';

var loginOrRegisterStyle = const TextStyle(
  color: Colors.white,
  fontSize: 20.0,
);

class Header extends StatelessWidget {
  final bool isLogin;
  const Header({Key? key, required this.isLogin}) : super(key: key);

  Widget _notLoginBuilder(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.green),
      height: 95.0,
      child: Row(
        children: [
          const SizedBox(width: 15),
          const SizedBox(
            height: 65,
            width: 65,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbgbqv2nj30i20i2wen.jpg'),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('login');
                    },
                    child: Text(
                      '登录',
                      style: loginOrRegisterStyle,
                    ),
                  ),
                  Text(
                    '/',
                    style: loginOrRegisterStyle,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('register');
                    },
                    child: Text(
                      '注册',
                      style: loginOrRegisterStyle,
                    ),
                  ),
                ],
              ),
              const Text(
                '登录后可体验更多',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _loginBuilder(BuildContext context) {
    String userName = '作业太多';
    const String userImage =
        'https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbnovh8jj30hr0hrq3l.jpg';
    return Container(
      decoration: const BoxDecoration(color: Colors.green),
      height: 95.0,
      child: Row(
        children: [
          const SizedBox(width: 15),
          const SizedBox(
            height: 65,
            width: 65,
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                userName,
                style: loginOrRegisterStyle,
              ),
              const Text(
                '查看编辑个人资料',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLogin ? _loginBuilder(context) : _notLoginBuilder(context);
  }
}
