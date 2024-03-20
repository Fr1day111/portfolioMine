
import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_text_styles.dart';
import 'package:portfolio/widgets/MyButton.dart';
import 'package:portfolio/widgets/contact_me_widget.dart';
import 'package:portfolio/widgets/textField.dart';


class ContactMeMobileView extends StatefulWidget {
  const ContactMeMobileView({super.key});

  @override
  State<ContactMeMobileView> createState() => _ContactMeMobileViewState();
}

class _ContactMeMobileViewState extends State<ContactMeMobileView> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0,bottom: 100),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.9,
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
                        width: MediaQuery.of(context).size.width*0.6,
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ContactMeWidget(icon: Icons.phone,title: 'Call Me',detail: '(+977) 9867254064',),
                              ContactMeWidget(icon: Icons.mail,title: 'E-Mail',detail: 'nwrsudeep@gmail.com',),
                              ContactMeWidget(icon: Icons.location_pin,title: 'Address',detail: 'Santinagar, Kathmandu',),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: MyTextField(
                                          label: 'Name', controller: nameController)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: MyTextField(
                                          label: 'Email', controller: emailController,isEmail: true)),
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
                              MyButton(label: 'Submit', onTap: (){})

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
