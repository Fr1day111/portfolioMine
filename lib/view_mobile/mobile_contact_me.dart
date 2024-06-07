import 'package:emailjs/emailjs.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../utils/app_text_styles.dart';
import '../utils/env.dart';
import '../widgets/MyButton.dart';
import '../widgets/contact_me_widget.dart';
import '../widgets/textField.dart';

final loadingProvider = StateProvider<bool>((ref) => false);

class ContactMeMobileView extends ConsumerStatefulWidget {
  const ContactMeMobileView({required this.contactMeKey,super.key});

  final GlobalKey contactMeKey;

  @override
  ConsumerState<ContactMeMobileView> createState() =>
      _ContactMeMobileViewState();
}

class _ContactMeMobileViewState extends ConsumerState<ContactMeMobileView> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isLoading = ref.watch(loadingProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 100.0, bottom: 100),
      child: SizedBox(
        key: widget.contactMeKey,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Me:',
                    style: MyTextStyle.subHeadingStyle,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ContactMeWidget(
                                icon: Icons.phone,
                                title: 'Call Me',
                                detail: '(+977) 9867254064',
                              ),
                              ContactMeWidget(
                                icon: Icons.mail,
                                title: 'E-Mail',
                                detail: 'nwrsudeep@gmail.com',
                              ),
                              ContactMeWidget(
                                icon: Icons.location_pin,
                                title: 'Address',
                                detail: 'Santinagar, Kathmandu',
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: MyTextField(
                                          label: 'Name',
                                          controller: nameController)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: MyTextField(
                                          label: 'Email',
                                          controller: emailController,
                                          isEmail: true)),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              MyTextField(
                                label: 'Message',
                                controller: messageController,
                                isMultiline: true,
                                maxLines: 5,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              isLoading
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : MyButton(
                                      label: 'Submit',
                                      onTap: () {
                                        ref.read(loadingProvider.notifier).update((state) => true);
                                        sendEmail(
                                                nameController.text,
                                                emailController.text,
                                                messageController.text)
                                            .then((value) {
                                          ref.read(loadingProvider.notifier).update((state) => false);
                                          if (value == 'success') {
                                            formKey.currentState?.reset();
                                            nameController.clear();
                                            emailController.clear();
                                            messageController.clear();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'Message Sent!!!!!!')));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'Something went wrong. Please try other way!!!!!!!!')));
                                          }
                                        });
                                      })
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

Future<String?> sendEmail(String name, String email, String subject) async {
  // Replace these values with your own EmailJS credentials
  const serviceId = 'service_06l8dos';
  const templateId = 'template_hws9akw';

  final emailData = {
    'name': name,
    'user_email': email,
    'message': subject,
  };

  try {
    await EmailJS.send(
      serviceId,
      templateId,
      emailData,
      Options(
        publicKey: '8D9lPRfbdeYGztgPg',
        privateKey: Env.myApiKey,
      ),
    );
    return 'success';
  } catch (e) {
    print('Error sending email: $e');
  }
  return null;
}
