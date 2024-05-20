import 'package:accounting_app/models/answer_model.dart';
import 'package:accounting_app/models/question_model.dart';
import 'package:accounting_app/models/quiz_model.dart';

final List<QuizModel> quizRepository = [
  QuizModel(
    quiz: 'Possible improvements or modifications',
    date: 'April 1, 2024',
    questions: [
      QuestionModel(
        userName: 'By James H.',
        question:
            'What problems or inconveniences are you experiencing when using the current version of the application?',
        date: 'May 13, 2024',
        isOpen: false,
        answers: [
          AnswerModel(
            userName: 'Denis McLance',
            answer:
                'There may be limitations in terms of customization options or lack of certain features that would enhance the overall user experience and functionality of the app.',
            date: 'May 13, 2024',
          ),
          AnswerModel(
            userName: 'Alex Lanson',
            answer:
                'Sometimes the app experiences glitches or crashes, which can be frustrating when trying to access important financial information quickly.',
            date: 'May 14, 2024',
          ),
        ],
      ),
      QuestionModel(
        userName: 'By Sara H.',
        question:
            'What improvements would you like to see in existing features?',
        date: 'May 13, 2024',
        isOpen: false,
        answers: [
          AnswerModel(
            userName: 'Alex Lanson',
            answer:
                'Improved user interface design for a more intuitive and seamless user experience, making it easier for users to navigate the app.',
            date: 'May 13, 2024',
          ),
        ],
      ),
      QuestionModel(
        userName: 'By James H.',
        question: 'What do you like most about the app?',
        date: 'May 11, 2024',
        isOpen: false,
        answers: [
          AnswerModel(
            userName: 'Denis McLance',
            answer:
                'I love the ease of adding new transactions and the quick ability to track my expenses.',
            date: 'May 11, 2024',
          ),
          AnswerModel(
            userName: 'Rachel Turner',
            answer:
                'The useful feature of setting budgets by category helps me plan my finances.',
            date: 'May 11, 2024',
          ),
        ],
      ),
      QuestionModel(
        userName: 'By Franklin M.',
        question:
            'Would you like to be able to create a shared budget with other users?',
        date: 'May 8, 2024',
        isOpen: false,
        answers: [
          AnswerModel(
            userName: 'Rachel Turner',
            answer:
                'Yes, the ability to create a shared budget with other users is the best solution and can promote transparency and collaboration, making it easier for groups or families to track expenses and work toward common financial goals.',
            date: 'May 9, 2024',
          ),
        ],
      ),
      QuestionModel(
        userName: 'By Lina H.',
        question:
            'What types of reports or data visualizations would be most useful to you?',
        date: 'May 3, 2024',
        isOpen: false,
        answers: [
          AnswerModel(
            userName: 'Alex Lanson',
            answer:
                'Summary reports that provide an overview of spending patterns, income sources, and savings progress can be very useful. Visualizations such as pie charts or bar graphs can effectively convey this information.',
            date: 'May 3, 2024',
          ),
          AnswerModel(
            userName: 'Denis McLance',
            answer:
                'Forecasting reports that project future financial scenarios based on current spending and saving trends can be beneficial for long-term planning. Visualizations like trend lines or area charts can help in understanding potential financial outcomes.',
            date: 'May 4, 2024',
          ),
        ],
      ),
      QuestionModel(
        userName: 'By James H.',
        question: 'What budgeting functions do you consider most important?',
        date: 'May 1, 2024',
        isOpen: false,
        answers: [
          AnswerModel(
            userName: 'Alex Lanson',
            answer:
                'Expense Tracking: Monitoring and categorizing expenses is crucial for understanding where money is being spent. This helps in identifying areas where spending can be reduced or optimized.',
            date: 'May 2, 2024',
          ),
          AnswerModel(
            userName: 'Denis McLance',
            answer:
                'Goal Setting: Setting financial goals, whether short-term or long-term, provides direction and motivation for budgeting efforts. It helps prioritize spending and saving decisions to align with these goals.',
            date: 'May 2, 2024',
          ),
          AnswerModel(
            userName: 'Rachel Turner',
            answer:
                'Regular Review: Consistently reviewing and adjusting the budget based on actual spending and income data is essential for maintaining financial health. This allows for course corrections and ensures that the budget remains relevant and effective over time.',
            date: 'May 3, 2024',
          ),
        ],
      ),
      QuestionModel(
        userName: 'By Lina H.',
        question:
            'How detailed do you prefer to track your expenses (by category, subcategory, adding tags, notes)?',
        date: 'April 21, 2024',
        isOpen: false,
        answers: [
          AnswerModel(
            userName: 'Rachel Turner',
            answer:
                'Сategory Tracking: Categorizing expenses into broad categories like groceries, utilities, transportation, etc., provides a good balance between detail and simplicity. It gives a clear overview of where money is going without getting too granular.',
            date: 'April 21, 2024',
          ),
          AnswerModel(
            userName: 'Denis McLance',
            answer:
                'Subcategory Tracking: Adding subcategories within major expense categories can offer more detailed insights into spending patterns. For example, under "groceries," subcategories could include fresh produce, snacks, beverages, etc. This level of detail can help pinpoint specific areas for adjustment.',
            date: 'April 21, 2024',
          ),
          AnswerModel(
            userName: 'Alex Lanson',
            answer:
                'Tags and Notes: Utilizing tags and notes can further enhance expense tracking by adding context or specific details to transactions. Tags can help identify expenses related to specific events or projects, while notes can provide additional information for future reference. This level of detail is particularly useful for those who want a comprehensive view of their finances and spending habits.',
            date: 'April 23, 2024',
          ),
        ],
      ),
      QuestionModel(
        userName: 'By James H.',
        question:
            'What information about your finances would you like to see on the app\'s home screen?',
        date: 'April 16, 2024',
        isOpen: false,
        answers: [
          AnswerModel(
            userName: 'Denis McLance',
            answer:
                'Visualizing progress towards specific financial goals, such as saving a certain amount of money or paying off debt.',
            date: 'April 17, 2024',
          ),
        ],
      ),
      QuestionModel(
        userName: 'By Sara H.',
        question:
            'What additional features related to financial planning or investing would you like to see in the app?',
        date: 'April 1, 2024',
        isOpen: false,
        answers: [
          AnswerModel(
            userName: 'Denis McLance',
            answer:
                'The ability to create a personalized financial plan based on your financial goals, risk tolerance and time frame.',
            date: 'April 1, 2024',
          ),
        ],
      ),
      QuestionModel(
        userName: 'By Franklin M.',
        question:
            'Any additional suggestions or comments to improve the application?',
        date: 'April 1, 2024',
        isOpen: false,
        answers: [
          AnswerModel(
            userName: 'Alex Lanson',
            answer:
                'Supports multiple currencies and languages to meet the needs of users from different countries and regions.',
            date: 'April 1, 2024',
          ),
          AnswerModel(
            userName: 'Denis McLance',
            answer:
                'Ability to create custom reports and export data to various formats for further analysis and sharing.',
            date: 'April 2, 2024',
          ),
        ],
      ),
    ],
  ),
];
