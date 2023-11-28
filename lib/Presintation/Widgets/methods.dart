import 'package:flutter/material.dart';
import 'package:khafif/Constants/mycolors.dart';
import 'package:khafif/Views/tracking_order_screen.dart';

customAppBar(String title, BuildContext context, bool home) {
  return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        backgroundColor: MyColors.backGroundColor,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(title),
        leading: home
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.grey,
                  size: 16,
                ),
              )
            : Container(
                width: 32.0,
                height: 32.0,
                //padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: MyColors.buttonCOlor,
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: MyColors.backColor,
                      size: 16,
                    ),
                  ),
                ),
              ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              )),
        ],
      ));
}

Widget accontButton(
  Icon icon,
  String label,
) {
  return Container(
    // color: Colors.white,
    padding: const EdgeInsets.only(
      top: 20,
      right: 20,
      left: 20,
    ),
    child: TextButton(
        style: TextButton.styleFrom(
            foregroundColor: Colors.grey,
            //side: const BorderSide(color: Colors.black, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.white,
            minimumSize: const Size.fromHeight(56)),
        onPressed: () async {
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => const Zoom2()));
        },
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 8,
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        )),
  );
}

Widget globalButton(
    String lable,
    double hi,
    double wd,
    double rad,
    Color buttonColor,
    Color textColor,
    bool isIcon,
    BuildContext context,
    var classObj) {
  return SizedBox(
    // color: Colors.amber,
    height: hi,
    width: wd,
    //margin: const EdgeInsets.all(16),
    child: TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        //side: const BorderSide(color: Colors.black, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(rad),
        ),
        backgroundColor: buttonColor,
        minimumSize: Size.fromHeight(hi),
      ),
      onPressed: () async {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => classObj),
        );
      },
      child: isIcon
          ? const Icon(Icons.menu)
          : Text(
              lable,
              style: TextStyle(
                  fontSize: 16.0,
                  color: textColor,
                  fontWeight: FontWeight.bold),
            ),
    ),
  );
}

InputDecoration textFormFieldDecoration(
    {required String hintText, required Icon icon}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    //icon: icon,
    prefixIcon: icon,

    border: const UnderlineInputBorder(
      // won't be used if the state-specific arguments are defined
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 2.0),
    ),
    disabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 2.0),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 5.0),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    focusedErrorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 5.0),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
}

InputDecoration searchFieldDecoration(
    {required String hintText, required Icon icon}) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    prefixIcon: icon,
    filled: true,
    hintStyle: TextStyle(color: Colors.grey.shade300),
    errorStyle: const TextStyle(color: Colors.red),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1, //<-- SEE HERE
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1, //<-- SEE HERE
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 0, //<-- SEE HERE
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 0, //<-- SEE HERE
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}

Widget buildTextFormField(String lable, Icon icon,
    TextEditingController textController, bool isSearch) {
  return TextFormField(
      onChanged: (value) {},
      controller: textController,
      validator: (inputValue) {
        if (inputValue!.isEmpty) {
          return "Please Enter $lable";
        }
        return null;
      },
      keyboardType: lable == 'Phone Number'
          ? TextInputType.number
          : lable == 'Email'
              ? TextInputType.emailAddress
              : TextInputType.text,
      textAlign: TextAlign.start,
      cursorColor: Colors.grey,
      cursorHeight: 24,
      decoration: isSearch
          ? searchFieldDecoration(hintText: lable, icon: icon)
          : textFormFieldDecoration(hintText: lable, icon: icon));
}

Widget buildNoInternetWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Image.asset(
          'assets/images/nointernet.gif',
          width: double.infinity,
          height: 200,
        ),
        const Text(
          'No Internet Connection',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey),
        ),
      ],
    ),
  );
}

Widget showLoadingIndicator() {
  return const Center(
    child: CircularProgressIndicator(
      color: Colors.orange,
    ),
  );
}

// Widget buildCustomMeal(String label, Icon icon1, Icon icon2) {
//   return Container(
//     width: 300,
//     height: 300,
//     decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         image: DecorationImage(
//             image: const AssetImage("assets/images/fries.jpg"),
//             colorFilter: ColorFilter.mode(
//                 Colors.yellow.withOpacity(0.7), BlendMode.overlay))),
//     child: Align(alignment: Alignment.bottomCenter, child: Text(label)),
//   );
// }

Widget globalTitle(String label, BuildContext context) {
  return Container(
    width: double.infinity,
    height: MediaQuery.sizeOf(context).height * 0.05,
    //color: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        InkWell(onTap: () {}, child: const Icon(Icons.more_horiz))
      ],
    ),
  );
}

customboxDecoration(double rad, Color color) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(rad),
      boxShadow: [
        BoxShadow(
            offset: const Offset(3, 3),
            color: Colors.grey.shade300,
            blurRadius: 5)
      ]);
}

Widget buildInfoContent(String title, Icon icon) {
  return Container(
    width: 56,
    height: double.infinity,
    margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
    //padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    decoration: customboxDecoration(16, Colors.white),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        Text(
          title,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    ),
  );
}
