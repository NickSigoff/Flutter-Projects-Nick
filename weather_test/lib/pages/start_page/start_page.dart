import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_test/pages/home_page/home_page.dart';
import 'package:weather_test/pages/start_page/bloc/start_page_bloc.dart';

import '../../utils/main_colors.dart';

class StartPage extends StatelessWidget {
  final TextEditingController _cityNameController = TextEditingController();

  StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StartPageBloc, StartPageState>(
      listener: (context, state) {
        if (state is StartPageSuccess) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage(weatherForecast: state.weatherForecast)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(32.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                MainColors.mainDeepBlueGradient,
                MainColors.mainLightBlueGradient,
              ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to\nWeather App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Spacer(),
                Container(
                  height: 300,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        controller: _cityNameController,
                        decoration: _buildInputDecoration(state),
                      ),
                      const SizedBox(height: 32.0),
                      GestureDetector(
                        onTap: () {
                          context.read<StartPageBloc>().add(
                              OnTapContinueButtonEvent(
                                  cityName: _cityNameController.text.trim()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.0),
                            color: Colors.white,
                          ),
                          child: state is StartPageLoading
                              ? const Center(child: CircularProgressIndicator())
                              : const Text(
                                  'Continue',
                                  style: TextStyle(fontSize: 25),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }

  InputDecoration _buildInputDecoration(StartPageState state) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
        borderSide: const BorderSide(color: Colors.blue, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
      ),
      hintText: 'Enter your city to continue',
      hintStyle: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.5)),
      errorText: 'City not found! Please, try again',
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),
    );
  }
}
