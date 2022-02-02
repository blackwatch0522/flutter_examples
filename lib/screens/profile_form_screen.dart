import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfileFormScreen extends StatefulWidget {
  const ProfileFormScreen({Key? key}) : super(key: key);

  @override
  _ProfileFormScreenState createState() => _ProfileFormScreenState();
}

class _ProfileFormScreenState extends State<ProfileFormScreen> {
  final form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
    'age': FormControl<int>(validators: [Validators.required]),
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Form Screen")),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ReactiveForm(
              formGroup: form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ReactiveFormConsumer(
                    builder: (context, form, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("이름: ${form.control('name').value ?? ""}"),
                          Text("나이: ${form.control('age').value ?? ""}"),
                          Text("이메일: ${form.control('email').value ?? ""}"),
                        ],
                      );
                    },
                  ),
                  ReactiveTextField(
                      formControlName: 'name',
                      decoration: const InputDecoration(labelText: "이름"),
                      validationMessages: (control) => {
                            "required": "이름을 입력해 주세요.",
                          }),
                  ReactiveTextField(
                      formControlName: 'age',
                      decoration: const InputDecoration(labelText: "나이"),
                      validationMessages: (control) =>
                          {"required": "나이를 입력해 주세요."}),
                  ReactiveTextField(
                      formControlName: 'email',
                      decoration: const InputDecoration(labelText: "이메일"),
                      validationMessages: (control) =>
                          {"required": "이메일을 입력해 주세요."}),
                  ReactiveFormConsumer(builder: (context, form, child) {
                    return TextButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            backgroundColor: form.valid
                                ? MaterialStateProperty.all(Colors.blue)
                                : MaterialStateProperty.all(Colors.grey[350])),
                        onPressed: form.valid
                            ? () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: const Text("저장완료"),
                                          content: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                  "이름: ${form.control('name').value ?? ""}"),
                                              Text(
                                                  "나이: ${form.control('age').value ?? ""}"),
                                              Text(
                                                  "이메일: ${form.control('email').value ?? ""}"),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("확인"))
                                            ],
                                          ),
                                        ));
                              }
                            : null,
                        child: const Text("적용"));
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
