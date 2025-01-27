# Gynzy Assignment

**Author**: Ruben Brugman

**Hours spend on assignment**: 4.5

This Flutter project demonstrates a basic exercise screen for students,
developed as part of the Gynzy technical assessment.

## Getting Started

Prerequisites:

Flutter: Ensure you have Flutter installed on your system. Download and install
it from <https://flutter.dev/get-started/install>.

1. Install dependencies:

   ```sh
   flutter pub get
   ```

1. Run the application for web by running:

   ```sh
   flutter run lib/main.dart --web-port=8080
   ```

1. Select the browser in which the app should run. (for the Chrome option it
   opens up a bare Chrome instance)

## Design & Implementation

Due to the time constraint I've only implemented two types of question:

- A numeric question, where the user needs to input a number through on screen
  buttons.
- A choice question, where the user needs to make a choice between 4 options.

I've setup the Question widget structure in such a way that it should be
extendable for other types of questions.

Within the choice based question I have not implemented restrictions on the
amount of options. This should be in place and set to minium and maximum of 4,
since the widget implementation only supports displaying 4 choices.

Besides that I am not happy with the look and feel of the `numeric_question`
Widget and would spend more time on this to make it feel consistent with the
nicely styled `choice_question`

### Viewmodel

Normally I would apply a viewmodel based approach. Due to the time constraint of
the assignment I decided to keep it simple and just use Stateless en Stateful
widgets.

### Localization

For a production ready application I would have implemented a localization setup
so that the code does not contain direct references to UI strings. Due to the
time constants of the assignment I've hardcoded all UI strings within the code.

### API integration

I've not integrated with an API. I've placed comment containing `NOTE`
throughout the code indicating where I would make technical changes.

### UI improvements

I would tackle the following points to improve the UI:

- Add the possibility of displaying images to questions.
- Improve the UI of the `numeric_question` and make it look less Material like.
- Add animations to make the application feel more interactive.
- Add a count time timer while a question is active.
- Use a progress bar which shrinks to it center instead from right to left.

### Testing

I am not familiar with UI tests within Flutter so I did not write any
automatic tests from the code. I however manually tested the application myself
running in debug.

> I look forward to discussing the assignment.
