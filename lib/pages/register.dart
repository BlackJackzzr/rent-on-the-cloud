import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  bool showPassword = false;
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _email, _password, _confirmPassword;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册'),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(30),
        child: Form(
          key: _formKey, // 设置globalKey，用于后面获取FormStat
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '用户名',
                  hintText: '请输入用户名',
                ),
                onSaved: (v) => _email = v!,
                validator: (v) {
                  if (v!.isEmpty) {
                    return '请输入用户名';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                obscureText: !showPassword,
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
                onSaved: (v) => _password = v!,
                validator: (v) {
                  if (v!.isEmpty) {
                    return '请输入密码';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                obscureText: !showPassword,
                decoration: InputDecoration(
                  labelText: '确认密码',
                  hintText: '请再次输入密码',
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
                onSaved: (v) => _confirmPassword = v!,
                validator: (v) {
                  if (v!.isEmpty) {
                    return '请再次输入密码';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  // 验证表单中的字段
                  if ((_formKey.currentState as FormState).validate()) {
                    // 保存表单中的字段值
                    (_formKey.currentState as FormState).save();
                    // 检查密码和确认密码是否匹配
                    if (_password == _confirmPassword) {
                      // 显示成功消息
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('注册成功'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      // 延迟5秒后导航到登录页面
                      Future.delayed(const Duration(seconds: 5), () {
                        Navigator.pushReplacementNamed(context, 'login');
                      });
                    } else {
                      // 显示错误消息
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('注册失败：两次密码输入不一致'),
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
                  '注册',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('已有账号'),
                  TextButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, 'login');
                    },
                    child: const Text(
                      '去登录',
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
