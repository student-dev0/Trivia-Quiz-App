class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

final List<Question> questions = [
  Question(
    question: 'What is the main purpose of an API in software development?',
    options: [
      'A. To compile source code',
      'B. To connect different software systems',
      'C. To optimize memory usage',
      'D. To encrypt user data',
    ],
    correctAnswer: 'B. To connect different software systems',
  ),
  Question(
    question:
        'Which data structure uses the principle of “Last In, First Out”?',
    options: ['A. Queue', 'B. Linked List', 'C. Stack', 'D. Tree'],
    correctAnswer: 'C. Stack',
  ),
  Question(
    question: 'In cloud computing, what does SaaS stand for?',
    options: [
      'A. Software and Application System',
      'B. Storage as a Service',
      'C. Software as a Service',
      'D. System as a Server',
    ],
    correctAnswer: 'C. Software as a Service',
  ),
  Question(
    question:
        'Which of the following best describes Continuous Integration (CI)?',
    options: [
      'A. Running a program continuously',
      'B. Merging code changes frequently to detect issues early',
      'C. Testing software manually after deployment',
      'D. Integrating databases with front-end UI',
    ],
    correctAnswer: 'B. Merging code changes frequently to detect issues early',
  ),
  Question(
    question: 'What is the main function of Docker in DevOps?',
    options: [
      'A. To create virtual machines',
      'B. To manage network configurations',
      'C. To containerize applications for consistency across environments',
      'D. To automate testing',
    ],
    correctAnswer:
        'C. To containerize applications for consistency across environments',
  ),
  Question(
    question: 'In cybersecurity, what does the term “phishing” refer to?',
    options: [
      'A. Cracking software licenses',
      'B. Gaining unauthorized access via a brute-force attack',
      'C. Deceiving users to reveal confidential information',
      'D. Scanning ports for vulnerabilities',
    ],
    correctAnswer: 'C. Deceiving users to reveal confidential information',
  ),
  Question(
    question:
        'What is the primary purpose of a load balancer in web applications?',
    options: [
      'A. To increase the website’s security',
      'B. To distribute incoming network traffic across multiple servers',
      'C. To back up database files',
      'D. To reduce DNS lookup times',
    ],
    correctAnswer:
        'B. To distribute incoming network traffic across multiple servers',
  ),
  Question(
    question: 'Which programming paradigm is Dart primarily based on?',
    options: [
      'A. Functional programming',
      'B. Logic-based programming',
      'C. Object-oriented programming',
      'D. Declarative programming',
    ],
    correctAnswer: 'C. Object-oriented programming',
  ),
  Question(
    question:
        'What does the term “responsive design” mean in web and mobile development?',
    options: [
      'A. Websites that respond quickly to input',
      'B. Designing interfaces that adapt to various screen sizes',
      'C. Applications that load faster on all networks',
      'D. Code that compiles on multiple devices',
    ],
    correctAnswer: 'B. Designing interfaces that adapt to various screen sizes',
  ),
  Question(
    question: 'In a relational database, what is a “foreign key”?',
    options: [
      'A. A primary key in the same table',
      'B. A key that uniquely identifies each record',
      'C. A key used to link two tables together',
      'D. A randomly generated identifier',
    ],
    correctAnswer: 'C. A key used to link two tables together',
  ),
];
