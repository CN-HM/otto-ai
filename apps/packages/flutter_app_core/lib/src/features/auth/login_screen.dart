import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../app/app_config.dart';
import '../../shared/widgets/message_notice.dart';
import '../../shared/widgets/surface_card.dart';
import 'auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _smsCodeController = TextEditingController();

  void _dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _smsCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final branding = context.read<AiAppConfig>().branding;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: Consumer<AuthController>(
                builder: (context, auth, _) {
                  final successMessage = auth.message.contains('成功') || auth.message.contains('已发送');
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const _LoginHero(),
                      const SizedBox(height: 24),
                      SurfaceCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              '欢迎使用',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              auth.isLoginMode
                                  ? branding.loginDescription
                                  : branding.registerDescription,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.color
                                    ?.withValues(alpha: 0.7),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: _usernameController,
                              decoration: const InputDecoration(labelText: '用户名'),
                            ),
                            const SizedBox(height: 14),
                            TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(labelText: '密码'),
                            ),
                            if (!auth.isLoginMode) ...[
                              const SizedBox(height: 14),
                              TextField(
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(labelText: '手机号'),
                              ),
                              const SizedBox(height: 14),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _smsCodeController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(labelText: '验证码'),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  SizedBox(
                                    width: 124,
                                    child: OutlinedButton(
                                      onPressed: auth.isLoading
                                          ? null
                                          : () async {
                                              _dismissKeyboard();
                                              if (_phoneController.text.trim().isEmpty) {
                                                return;
                                              }
                                              await auth.sendSmsCode(_phoneController.text);
                                            },
                                      child: const Text('获取验证码'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            const SizedBox(height: 18),
                            MessageNotice(
                              message: auth.message,
                              error: auth.message.isNotEmpty && !successMessage,
                            ),
                            if (auth.message.isNotEmpty) const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: auth.isLoading
                                  ? null
                                  : () async {
                                      _dismissKeyboard();
                                      if (auth.isLoginMode) {
                                        await auth.login(
                                          username: _usernameController.text,
                                          password: _passwordController.text,
                                        );
                                        return;
                                      }

                                      await auth.register(
                                        username: _usernameController.text,
                                        password: _passwordController.text,
                                        phone: _phoneController.text,
                                        code: _smsCodeController.text,
                                      );
                                    },
                              child: Text(auth.isLoginMode ? '登录' : '注册'),
                            ),
                            const SizedBox(height: 12),
                            TextButton(
                              onPressed: auth.isLoading
                                  ? null
                                  : () {
                                      _dismissKeyboard();
                                      auth.toggleMode();
                                    },
                              child: Text(auth.isLoginMode ? '切换到注册' : '切换到登录'),
                            ),
                            if (auth.isLoading) ...[
                              const SizedBox(height: 12),
                              const Center(child: CircularProgressIndicator()),
                            ],
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginHero extends StatelessWidget {
  const _LoginHero();

  @override
  Widget build(BuildContext context) {
    final branding = context.read<AiAppConfig>().branding;
    return Column(
      children: [
        Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            color: const Color(0xFFD1FAE5),
            borderRadius: BorderRadius.circular(28),
          ),
          alignment: Alignment.center,
          child: const Text(
            'otto ai',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color(0xFF065F46),
            ),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          branding.heroTitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          branding.heroSubtitle,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).textTheme.bodyLarge?.color?.withValues(alpha: 0.7),
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
