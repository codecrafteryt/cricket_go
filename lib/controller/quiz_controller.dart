  /*
        ---------------------------------------
        Project: Stumped Game Mobile Application
            Date: April 11, 2024
        Author: Ameer from Pakistan
        ---------------------------------------
        Description: quiz controller logic code
      */
  import 'package:get/get.dart';
  import 'package:shared_preferences/shared_preferences.dart';
  import '../data/model/quiz_question_model.dart';
  import '../view/quiz/result_screen.dart';

  class QuizController extends GetxController {
    final SharedPreferences sharedPreferences;
    QuizController({required this.sharedPreferences});

    RxInt currentQuestionIndex = 0.obs;
    RxInt score = 0.obs;
    RxList<bool> questionAnswered = <bool>[].obs;
    RxInt selectedAnswerIndex = (-1).obs;
    RxBool isAnswered = false.obs;

    // List of quiz questions
    final List<QuizQuestion> questions = [
      QuizQuestion(
        question: "Harold (Dickie) Bird is best known for his career in cricket as:",
        options: ["An umpire", "A batsman", "An administrator", "A bowler"],
        correctAnswerIndex: 0,
        //imagePath: "assets/images/don.png",
      ),
      QuizQuestion(
        question: "For how many days is a Test match scheduled?",
        options: [ "50 overs", "Five days", "One day", "100 overs",],
        correctAnswerIndex: 1,
        //imagePath: "assets/images/quiz2.png",
      ),
      QuizQuestion(
        question: "In which year were the first laws of cricket believed to have been written?",
        options: [ "1709", "1882", "1774", "1806"],
        correctAnswerIndex: 2,
        //imagePath: "assets/images/quiz3.png",
      ),
      QuizQuestion(
        question: "What is the slang term given to a ball that is bowled so well that it is considered unplayable by the batsman?",
        options: ["A half volley", "A jaffa", "An over", "An inswinger"],
        correctAnswerIndex: 3,
       // imagePath: "assets/images/quiz4.png",
      ),
      QuizQuestion(
        question: "What does the term LBW stand for in cricket?",
        options: ["Lunch bought weekly", "Long blue wickets", "Leg before wide", "Leg before wicket"],
        correctAnswerIndex: 3,
       // imagePath: "assets/images/quiz5.png",
      ),
      QuizQuestion(
        question: "When the batsman hits the ball and it clears the boundary on the full, how many runs are scored?",
        options: ["Four", "None", "Six", "Three"],
        correctAnswerIndex: 2,
        imagePath: "assets/images/quiz6.png",
      ),
    ];

    @override
    void onInit() {
      super.onInit();
      questionAnswered.value = List.generate(questions.length, (index) => false);
    }

    // Select an answer but don't move to next question automatically
    void selectAnswer(int selectedIndex) {
      if (!questionAnswered[currentQuestionIndex.value]) {
        selectedAnswerIndex.value = selectedIndex;
        isAnswered.value = true; // Mark question as answered

        if (selectedIndex == questions[currentQuestionIndex.value].correctAnswerIndex) {
          score.value++;
        }

        questionAnswered[currentQuestionIndex.value] = true;
        update();
      }
    }

    // Navigate to next question or results when the Next button is pressed
    void goToNextQuestion() {
      if (currentQuestionIndex.value < questions.length - 1) {
        currentQuestionIndex.value++;
        selectedAnswerIndex.value = -1;
        isAnswered.value = false;
      } else {
        // All questions answered, show results
       Get.to(() => ResultScreen());
      }
      update();
    }

    // Original method (not used anymore but kept for reference)
    void answerQuestion(int selectedIndex) {
      if (!questionAnswered[currentQuestionIndex.value]) {
        selectedAnswerIndex.value = selectedIndex;
        isAnswered.value = true;
        if (selectedIndex == questions[currentQuestionIndex.value].correctAnswerIndex) {
          score.value++;
        }
        questionAnswered[currentQuestionIndex.value] = true;
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (currentQuestionIndex.value < questions.length - 1) {
            currentQuestionIndex.value++;
            selectedAnswerIndex.value = -1;
            isAnswered.value = false;
          } else {
           Get.to(() => ResultScreen());
          }
        });
        update();
      }
    }

    void resetQuiz() {
      currentQuestionIndex.value = 0;
      score.value = 0;
      selectedAnswerIndex.value = -1;
      isAnswered.value = false;
      questionAnswered.value = List.generate(questions.length, (index) => false);
    }
  }