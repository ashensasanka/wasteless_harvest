import 'package:country_picker/country_picker.dart';
import 'package:farmer/ui/screens/farmer_home_page.dart';
import 'package:flutter/material.dart';
import 'package:farmer/constants/constants.dart';
import 'package:farmer/ui/widgets/custom_textfield.dart';
import 'package:farmer/ui/screens/signin_farmer_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../../provider/auth_provider.dart';
import '../../utils/utils.dart';

class SignUpAExpert extends StatefulWidget {
  SignUpAExpert({Key? key}) : super(key: key);

  @override
  State<SignUpAExpert> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpAExpert> {
  TextEditingController expertphoneController = TextEditingController();
  TextEditingController expertusernameController = TextEditingController();
  TextEditingController expertpasswordController = TextEditingController();
  TextEditingController expertcpasswordController = TextEditingController();
  TextEditingController expertemailController = TextEditingController();
  TextEditingController expertaddressController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    super.dispose();
    expertusernameController.dispose();
    expertpasswordController.dispose();
    expertcpasswordController.dispose();
    expertemailController.dispose();
    expertaddressController.dispose();
  }
  Country selectedCountry = Country(
      phoneCode: "94",
      countryCode: "SL",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Sri Lanka",
      example: "Sri Lanka",
      displayName: "Sri Lanka",
      displayNameNoCountryCode: "SL",
      e164Key: "");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    expertphoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: expertphoneController.text.length)
    );
    final isLoading =
        Provider.of<AuthProvider1>(context, listen: true).isLoading;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: isLoading == true
            ? const Center(
          child: CircularProgressIndicator(
            color: Colors.purple,
          ),
        ):
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/signup.png'),
              const Text(
                'Sign Up Expert',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // name field
              textFeld(
                hintText: "Enter User Name....",
                icon: Icons.account_circle,
                inputType: TextInputType.text,
                maxLines: 1,
                controller: expertusernameController,
              ),

              // email
              TextField(
                controller: expertpasswordController,
                style: const TextStyle(color: Colors.black, fontSize: 14.5),
                obscureText: isPasswordVisible ? false : true,
                decoration: InputDecoration(
                  fillColor: Color(0xffbce8ca),
                  filled: true,
                  prefixIconConstraints: const BoxConstraints(minWidth: 45),
                  prefixIcon: Container(
                    height: 35,
                    margin: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green,
                    ),
                    child: Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(minWidth: 45, maxWidth: 46),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    child: Icon(
                      isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: 'Enter Password....',
                  hintStyle: const TextStyle(color: Color.fromRGBO(75, 93, 81, 1), fontSize: 16.5), // Set hint color here
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: expertcpasswordController,
                style: const TextStyle(color: Colors.black, fontSize: 14.5),
                obscureText: isPasswordVisible ? false : true,
                decoration: InputDecoration(
                  fillColor: Color(0xffbce8ca),
                  filled: true,
                  prefixIconConstraints: const BoxConstraints(minWidth: 45),
                  prefixIcon: Container(
                    height: 35,
                    margin: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green,
                    ),
                    child: Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(minWidth: 45, maxWidth: 46),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    child: Icon(
                      isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: 'Enter Password....',
                  hintStyle: const TextStyle(color: Color.fromRGBO(75, 93, 81, 1), fontSize: 16.5), // Set hint color here
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              textFeld(
                hintText: "Confirm Password....",
                icon: Icons.password,
                inputType: TextInputType.visiblePassword,
                maxLines: 1,
                controller: expertcpasswordController,
              ),
              textFeld(
                hintText: "Enter Email....",
                icon: Icons.email,
                inputType: TextInputType.emailAddress,
                maxLines: 1,
                controller: expertemailController,
              ),

              // address
              textFeld(
                hintText: "Enter Address....",
                icon: Icons.home,
                inputType: TextInputType.streetAddress,
                maxLines: 2,
                controller: expertaddressController,
              ),
              TextFormField(
                controller: expertphoneController,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
                onChanged: (value){
                  setState(() {
                    expertphoneController.text = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter Phone Number',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey.shade600
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12)
                  ),
                  prefixIcon: Container(
                    padding: const EdgeInsets.fromLTRB(13.0, 12.0, 10.0,0),
                    child: InkWell(
                      onTap: (){
                        showCountryPicker(
                            context: context,
                            countryListTheme: CountryListThemeData(
                                bottomSheetHeight: 500
                            ),
                            onSelect:(value){
                              setState((){
                                selectedCountry = value;
                              });
                            });
                      },
                      child: Text("${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),
                  suffixIcon: expertphoneController.text.length > 8 && expertphoneController.text.length<10? Container(
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green
                    ),
                    child: Icon(Icons.done, color: Colors.white,size: 20,),
                  ):null,
                ),
              ),
              // const CustomTextfield(
              //   obscureText: false,
              //   hintText: 'Enter OTP',
              //   icon: Icons.paste_sharp,
              // ),
              // const CustomTextfield(
              //   obscureText: false,
              //   hintText: 'Enter Email',
              //   icon: Icons.alternate_email,
              // ),
              // const CustomTextfield(
              //   obscureText: false,
              //   hintText: 'Enter Address',
              //   icon: Icons.home,
              // ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () => storeDatasendMessage(),
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const SignInFarmer(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Have an Account? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget textFeld({
    required String hintText,
    required IconData icon,
    required TextInputType inputType,
    required int maxLines,
    required TextEditingController controller,
  }) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
          cursorColor: Colors.green,
          controller: controller,
          keyboardType: inputType,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.green,
              ),
              child: Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.blueGrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
            hintText: hintText,
            alignLabelWithHint: true,
            border: InputBorder.none,
            fillColor: Color(0xffbce8ca),
            filled: true,
          ),
        ));
  }
  // void sendPhoneNumber() {
  //   //+94785668020
  //   final ap = Provider.of<AuthProvider>(context, listen: false);
  //   String phoneNumber = phoneController.text.trim();
  //   ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  // }
  // store user data to database
  void storeDatasendMessage() async {
    final ap = Provider.of<AuthProvider1>(context, listen: false);
    String phoneNumber = expertphoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
    UserModel userModel = UserModel(
      username: expertusernameController.text.trim(),
      password: expertpasswordController.text.trim(),
      cpassword: expertcpasswordController.text.trim(),
      email: expertemailController.text.trim(),
      address: expertaddressController.text.trim(),
      phoneNumber: expertphoneController.text.trim(),
      uid: "Expert",
      name: "",
      age: "",
      premium:false,
      imageURL: ""
    );
    if (expertusernameController != null) {
      ap.saveExpertUserDataToFirebase(
        context: context,
        userModel: userModel,
        // profilePic: image!,
        onSuccess: () {
          // ap.saveUserDataToSP().then(
          //       (value) => ap.setSignIn().then(
          //         (value) => Navigator.pushAndRemoveUntil(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const HomePage(),
          //         ),
          //             (route) => false),
          //   ),
          // );
        },
      );
    } else {
      showSnackBar(context, "Please upload your profile photo");
    }
  }


}
