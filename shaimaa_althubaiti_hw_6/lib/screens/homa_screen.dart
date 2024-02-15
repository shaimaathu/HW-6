import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shaimaa_althubaiti_hw_6/data/persons_data.dart';
import 'package:shaimaa_althubaiti_hw_6/helper/extintion.dart';
import 'package:shaimaa_althubaiti_hw_6/model/persons_model.dart';
import 'package:shaimaa_althubaiti_hw_6/widgets/button_widget.dart';
import 'package:shaimaa_althubaiti_hw_6/widgets/person_card.dart';
import 'package:shaimaa_althubaiti_hw_6/widgets/textfield_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late Persons person;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 255, 255, 255),title: const Text("people data",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Color.fromARGB(255, 143, 86, 152)),),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: context.getHeight() / 4.5,
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Textfield(
                          hintText: "enter your name",
                          textController: nameController,
                        ),
                        ButtonWidget(
                          title: 'clear email',
                          onPress: () {
                            nameController.clear();
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Textfield(
                          hintText: "enter your email",
                          textController: emailController,
                        ),
                        ButtonWidget(
                          title: 'clear email',
                          onPress: () {
                            emailController.clear();
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonWidget(
                          title: 'Submit',
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              person = Persons(
                                  name: nameController.text,
                                  email: emailController.text);
                              GetIt.I
                                  .get<PersonsData>()
                                  .addData(person: person);
                              setState(() {});
                            }
                          },
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        ButtonWidget(
                          title: 'remove list',
                          onPress: () {
                            GetIt.I.get<PersonsData>().storage.remove("person");
                            setState(() {});
                          },
                        )
                      ],
                    )
                  ],
                )),
          ),
          Container(
            height: context.getHeight() / 1.6,
            width: context.getWidth() * 2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Color.fromARGB(255, 143, 86, 152),
            ),
            child: ListView(children: [
              if (GetIt.I.get<PersonsData>().personData.isNotEmpty)
                ...GetIt.I
                    .get<PersonsData>()
                    .personData
                    .map((e) => PersonCard(name: e.name, email: e.email))
                    .toList()
            ]),
          )
        ],
      ),
    );
  }
}
