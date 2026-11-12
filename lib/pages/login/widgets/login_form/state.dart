part of 'widget.dart';

class _LoginFormState extends State<LoginForm> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  String? _message;
  var _busy = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit(AuthAction action, {String? success}) async {
    setState(() {
      _busy = true;
      _message = null;
    });
    final error = await action(_email.text.trim(), _password.text);
    if (!mounted) return;
    setState(() {
      _busy = false;
      _message = error ?? success;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _email,
          decoration: const InputDecoration(hintText: 'Email'),
          keyboardType: TextInputType.emailAddress,
        ),
        TextField(
          controller: _password,
          decoration: const InputDecoration(hintText: 'Password'),
          obscureText: true,
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: _busy ? null : () => _submit(widget.onSignIn),
          child: const Text('Sign in'),
        ),
        TextButton(
          onPressed: _busy
              ? null
              : () => _submit(
                    widget.onSignUp,
                    success: 'Check your email to confirm your account',
                  ),
          child: const Text('Sign up'),
        ),
        if (_message != null) Text(_message!, textAlign: TextAlign.center),
      ],
    );
  }
}
