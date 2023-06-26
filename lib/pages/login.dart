import 'package:flutter/material.dart';
import 'package:hospitality_rental/widgets/page_content.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  bool showPassword = false;
  late  String _email, _password;
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '用户名',
                  hintText: '请输入用户名',
                ),
                onSaved: (v) => _email = v!,
              ),
              const SizedBox(height: 20,),
              TextFormField(
                obscureText: !showPassword,
                onSaved: (v) => _password = v!,
                validator: (v) {
                  if (v!.isEmpty) {
                    return '请输入密码';
                  }
                },
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '请输入密码',
                  suffixIcon: IconButton(
                    icon: Icon(
                        showPassword?Icons.visibility_off:Icons.visibility
                    ),
                    onPressed: (){
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  // Navigator.pushReplacementNamed(context, '/', arguments: {'isLogin':true});
                  // 验证表单中的字段
                  if ((_formKey.currentState as FormState).validate()) {
                    // 保存表单中的字段值
                    (_formKey.currentState as FormState).save();
                    // 检查用户名和密码是否匹配
                    if (_email == '736312755@qq.com' && _password == '666666') {
                      // 导航到主页面并设置isLogin为true
                      Navigator.pushReplacementNamed(context, '/', arguments: {'isLogin': true});
                    } else {
                      // 显示错误消息
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('用户名或密码错误'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // 设置按钮的背景颜色
                ),
                child: const Text(
                  '登陆',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('还没有账号'),
                  TextButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, 'register');
                    },
                    child: const Text(
                      '去注册',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
