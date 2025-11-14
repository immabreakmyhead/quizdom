import 'package:cloud_firestore/cloud_firestore.dart';

// to upload data in firebase
Future<void> uploadQuestionsToFirebase() async {
  for (final sector in data.entries) {
    uploadQuestionsForAField(
      sector.key,
      sector.value,
    );
  }
}

Future<void> uploadQuestionsForAField(String field, dynamic data) async {
  FirebaseFirestore.instance.collection('QuestionsTest').doc(field).set(data);
}

final data = {
  "Flutter": {
    "title": "Flutter",
    "image_url":
        "https://litslink.com/wp-content/uploads/2020/03/flutter-app-featured.png",
    "questions": {
      "0": {
        "correctOptionKey": "1",
        "options": {"1": "number", "2": "int", "3": "String", "4": "bool"},
        "questionText": "Which of the following is NOT a valid Dart data type?"
      },
      "1": {
        "correctOptionKey": "4",
        "options": {
          "1": "Widget build()",
          "2": "super.build()",
          "3": "Widget build(BuildContext context)",
          "4": "@override Widget build()"
        },
        "questionText":
            "Which is NOT a valid build method signature in Flutter?"
      },
      "2": {
        "correctOptionKey": "3",
        "options": {
          "1": "pubspec.yaml",
          "2": "Analysis_options.yaml",
          "3": "Dartpad.yaml",
          "4": "build.gradle"
        },
        "questionText": "Which file is NOT typically part of a Flutter project?"
      },
      "3": {
        "correctOptionKey": "2",
        "options": {
          "1": "StatefulWidget",
          "2": "ImmutableWidget",
          "3": "StatelessWidget",
          "4": "InheritedWidget"
        },
        "questionText": "Which widget type does NOT exist in Flutter?"
      },
      "4": {
        "correctOptionKey": "4",
        "options": {"1": "async", "2": "await", "3": "Future", "4": "parallel"},
        "questionText":
            "Which keyword is NOT used for Dart asynchronous programming?"
      },
      "5": {
        "correctOptionKey": "3",
        "options": {"1": "const", "2": "final", "3": "static", "4": "var"},
        "questionText":
            "Which keyword is NOT used for variable immutability in Dart?"
      },
      "6": {
        "correctOptionKey": "1",
        "options": {
          "1": "context.push()",
          "2": "Navigator.push()",
          "3": "Navigator.pop()",
          "4": "Router.of(context).push()"
        },
        "questionText": "Which is NOT a valid navigation method in Flutter?"
      },
      "7": {
        "correctOptionKey": "4",
        "options": {
          "1": "Hot Restart",
          "2": "Hot Reload",
          "3": "Debug Paint",
          "4": "Cold Refresh"
        },
        "questionText": "Which development feature does NOT exist in Flutter?"
      },
      "8": {
        "correctOptionKey": "2",
        "options": {
          "1": "MaterialApp",
          "2": "CupertinoScaffold",
          "3": "Scaffold",
          "4": "WidgetsApp"
        },
        "questionText": "Which root widget does NOT exist in Flutter?"
      },
      "9": {
        "correctOptionKey": "3",
        "options": {
          "1": "BuildContext",
          "2": "Key",
          "3": "WidgetTree",
          "4": "AnimationController"
        },
        "questionText": "Which is NOT a built-in Flutter/Dart type?"
      },
      "10": {
        "correctOptionKey": "4",
        "options": {
          "1": "initState()",
          "2": "dispose()",
          "3": "didChangeDependencies()",
          "4": "rebuild()"
        },
        "questionText": "Which method is NOT part of the State lifecycle?"
      },
      "11": {
        "correctOptionKey": "1",
        "options": {
          "1": "Flutter uses JavaScript bridge",
          "2": "Flutter apps compile to native code",
          "3": "Skia is the rendering engine",
          "4": "Dart is AOT compiled"
        },
        "questionText": "Which statement about Flutter architecture is FALSE?"
      },
      "12": {
        "correctOptionKey": "3",
        "options": {"1": "??", "2": "??=", "3": "?:", "4": "?"},
        "questionText": "Which null-aware operator does NOT exist in Dart?"
      },
      "13": {
        "correctOptionKey": "2",
        "options": {
          "1": "Expanded",
          "2": "ExpandedView",
          "3": "Flexible",
          "4": "Spacer"
        },
        "questionText":
            "Which widget is NOT related to flexible layouts in Flutter?"
      },
      "14": {
        "correctOptionKey": "4",
        "options": {
          "1": "ListView.builder",
          "2": "ListView.separated",
          "3": "ListView.custom",
          "4": "ListView.array"
        },
        "questionText": "Which ListView constructor does NOT exist?"
      },
      "15": {
        "correctOptionKey": "1",
        "options": {
          "1": "mixins",
          "2": "extensions",
          "3": "enums",
          "4": "sealed classes"
        },
        "questionText": "Which Dart feature was introduced in Dart 3?"
      },
      "16": {
        "correctOptionKey": "3",
        "options": {
          "1": "Provider",
          "2": "Riverpod",
          "3": "Redux",
          "4": "Bloc"
        },
        "questionText":
            "Which state management solution is NOT officially recommended by Flutter?"
      },
      "17": {
        "correctOptionKey": "2",
        "options": {
          "1": "Theme.of(context)",
          "2": "Context.theme()",
          "3": "MediaQuery.of(context)",
          "4": "Navigator.of(context)"
        },
        "questionText": "Which context method does NOT exist?"
      },
      "18": {
        "correctOptionKey": "4",
        "options": {
          "1": "dart:core",
          "2": "dart:async",
          "3": "dart:ui",
          "4": "dart:widgets"
        },
        "questionText": "Which core Dart library does NOT exist?"
      },
      "19": {
        "correctOptionKey": "3",
        "options": {
          "1": "required",
          "2": "late",
          "3": "optional",
          "4": "static"
        },
        "questionText":
            "Which keyword is NOT used for variable declarations in Dart?"
      }
    }
  },
  "AI and machine learning": {
    "title": "AI and machine learning",
    "image_url":
        "https://img.freepik.com/premium-vector/artificial-intelligence-illustration-ai-creative-design-vector-illustration_541075-747.jpg",
    "questions": {
      "0": {
        "correctOptionKey": "2",
        "options": {
          "1": "Artificially Intelligent Machine",
          "2": "Artificial Intelligence",
          "3": "Automated Intelligence",
          "4": "Advanced Intelligence"
        },
        "questionText": "What does AI stand for?"
      },
      "1": {
        "correctOptionKey": "3",
        "options": {
          "1": "Random Forest",
          "2": "Support Vector Machine",
          "3": "K-Means Clustering",
          "4": "Logistic Regression"
        },
        "questionText":
            "Which of the following is an unsupervised learning algorithm?"
      },
      "2": {
        "correctOptionKey": "1",
        "options": {
          "1": "Labeled data",
          "2": "Unlabeled data",
          "3": "Partially labeled data",
          "4": "No data at all"
        },
        "questionText": "Supervised learning requires which type of data?"
      },
      "3": {
        "correctOptionKey": "4",
        "options": {
          "1": "Algorithm Training",
          "2": "Neural Mapping",
          "3": "Backward Learning",
          "4": "Backpropagation"
        },
        "questionText":
            "What is the name of the algorithm used to adjust weights in a neural network during training?"
      },
      "4": {
        "correctOptionKey": "2",
        "options": {
          "1": "Supervised Learning",
          "2": "Reinforcement Learning",
          "3": "Unsupervised Learning",
          "4": "Self-Learning"
        },
        "questionText":
            "Which type of learning involves an agent interacting with an environment to maximize rewards?"
      },
      "5": {
        "correctOptionKey": "3",
        "options": {
          "1": "Mean Square Loss",
          "2": "Binary Loss",
          "3": "Loss Function",
          "4": "Cost Aggregator"
        },
        "questionText":
            "In machine learning, what is used to measure the difference between actual and predicted values?"
      },
      "6": {
        "correctOptionKey": "1",
        "options": {
          "1": "Perceptron",
          "2": "ReLU",
          "3": "Sigmoid",
          "4": "Linear Unit"
        },
        "questionText":
            "What is the simplest type of artificial neural network called?"
      },
      "7": {
        "correctOptionKey": "4",
        "options": {
          "1": "Overfitting",
          "2": "Underfitting",
          "3": "Bias",
          "4": "All of the above"
        },
        "questionText":
            "Which of the following are common problems in machine learning models?"
      },
      "8": {
        "correctOptionKey": "2",
        "options": {
          "1": "Flattening",
          "2": "Feature Extraction",
          "3": "Weight Calculation",
          "4": "Batch Normalization"
        },
        "questionText":
            "What is the process of selecting relevant input variables for a machine learning model?"
      },
      "9": {
        "correctOptionKey": "3",
        "options": {
          "1": "Gradient Rise",
          "2": "Activation Learning",
          "3": "Gradient Descent",
          "4": "Weight Optimization"
        },
        "questionText":
            "Which optimization algorithm is commonly used to minimize the loss function in deep learning?"
      },
      "10": {
        "correctOptionKey": "1",
        "options": {
          "1": "TensorFlow",
          "2": "NumPy",
          "3": "Matplotlib",
          "4": "Pandas"
        },
        "questionText":
            "Which of these is a popular deep learning framework developed by Google?"
      },
      "11": {
        "correctOptionKey": "2",
        "options": {
          "1": "Precision",
          "2": "Accuracy",
          "3": "Recall",
          "4": "Specificity"
        },
        "questionText":
            "Which metric measures the overall correctness of a machine learning model?"
      },
      "12": {
        "correctOptionKey": "3",
        "options": {
          "1": "Dropout",
          "2": "Batch Size",
          "3": "Epoch",
          "4": "Learning Rate"
        },
        "questionText":
            "In deep learning, what term refers to one complete pass through the training dataset?"
      },
      "13": {
        "correctOptionKey": "4",
        "options": {
          "1": "Text Processing",
          "2": "Deep Learning",
          "3": "Data Augmentation",
          "4": "Natural Language Processing"
        },
        "questionText": "What does NLP stand for in the context of AI?"
      },
      "14": {
        "correctOptionKey": "2",
        "options": {
          "1": "Supervised Learning",
          "2": "Unsupervised Learning",
          "3": "Transfer Learning",
          "4": "Backpropagation"
        },
        "questionText": "Which type of learning does not require labeled data?"
      },
      "15": {
        "correctOptionKey": "1",
        "options": {
          "1": "K-Nearest Neighbors",
          "2": "Decision Tree",
          "3": "Random Forest",
          "4": "Neural Network"
        },
        "questionText":
            "Which algorithm classifies a data point based on its proximity to labeled examples?"
      },
      "16": {
        "correctOptionKey": "4",
        "options": {
          "1": "Bias",
          "2": "Feature Importance",
          "3": "Variance",
          "4": "Both Bias and Variance"
        },
        "questionText": "What does the bias-variance tradeoff aim to balance?"
      },
      "17": {
        "correctOptionKey": "3",
        "options": {"1": "YOLO", "2": "RCNN", "3": "CNN", "4": "ResNet"},
        "questionText":
            "Which deep learning model is widely used for image recognition tasks?"
      },
      "18": {
        "correctOptionKey": "1",
        "options": {
          "1": "Turing Test",
          "2": "AI Evaluation",
          "3": "Neural Examination",
          "4": "Algorithm Efficiency Test"
        },
        "questionText":
            "What test is used to determine if a machine exhibits human-like intelligence?"
      },
      "19": {
        "correctOptionKey": "2",
        "options": {
          "1": "Algorithm Set",
          "2": "Neural Network",
          "3": "Data Matrix",
          "4": "Feature Space"
        },
        "questionText":
            "What is a network of artificial neurons modeled after the human brain called?"
      }
    },
  },
  "Science": {
    "title": "Science",
    "image_url":
        "https://img.freepik.com/free-vector/flat-biotechnology-concept-illustration_23-2148892456.jpg",
    "questions": {
      "0": {
        "correctOptionKey": "3",
        "options": {
          "1": "Oxygen",
          "2": "Carbon Dioxide",
          "3": "Nitrogen",
          "4": "Argon"
        },
        "questionText": "Which gas makes up the majority of Earth's atmosphere?"
      },
      "1": {
        "correctOptionKey": "2",
        "options": {
          "1": "Proton",
          "2": "Electron",
          "3": "Neutron",
          "4": "Photon"
        },
        "questionText": "Which subatomic particle has a negative charge?"
      },
      "2": {
        "correctOptionKey": "4",
        "options": {
          "1": "Photosynthesis",
          "2": "Respiration",
          "3": "Transpiration",
          "4": "Chemosynthesis"
        },
        "questionText":
            "Which process do plants use to convert sunlight into energy?"
      },
      "3": {
        "correctOptionKey": "1",
        "options": {"1": "Newton", "2": "Joule", "3": "Watt", "4": "Pascal"},
        "questionText": "What is the SI unit of force?"
      },
      "4": {
        "correctOptionKey": "3",
        "options": {"1": "Mars", "2": "Venus", "3": "Mercury", "4": "Saturn"},
        "questionText": "Which planet is closest to the Sun?"
      },
      "5": {
        "correctOptionKey": "2",
        "options": {"1": "H2O", "2": "CO2", "3": "O2", "4": "CH4"},
        "questionText":
            "Which molecule is primarily responsible for global warming?"
      },
      "6": {
        "correctOptionKey": "4",
        "options": {"1": "Liver", "2": "Heart", "3": "Lungs", "4": "Skin"},
        "questionText": "Which is the largest organ in the human body?"
      },
      "7": {
        "correctOptionKey": "1",
        "options": {"1": "Solid", "2": "Liquid", "3": "Gas", "4": "Plasma"},
        "questionText":
            "What is the most common state of matter in the universe?"
      },
      "8": {
        "correctOptionKey": "3",
        "options": {
          "1": "Hydrogen",
          "2": "Helium",
          "3": "Carbon",
          "4": "Oxygen"
        },
        "questionText": "Which element is the basis of organic chemistry?"
      },
      "9": {
        "correctOptionKey": "2",
        "options": {
          "1": "Mitosis",
          "2": "Meiosis",
          "3": "Fission",
          "4": "Budding"
        },
        "questionText":
            "Which process is responsible for the formation of gametes?"
      },
      "10": {
        "correctOptionKey": "4",
        "options": {
          "1": "Gravity",
          "2": "Electromagnetism",
          "3": "Strong Nuclear Force",
          "4": "Friction"
        },
        "questionText":
            "Which of the following is NOT a fundamental force of nature?"
      },
      "11": {
        "correctOptionKey": "1",
        "options": {"1": "DNA", "2": "RNA", "3": "Protein", "4": "Lipid"},
        "questionText":
            "Which molecule carries genetic information in living organisms?"
      },
      "12": {
        "correctOptionKey": "3",
        "options": {"1": "Mars", "2": "Jupiter", "3": "Saturn", "4": "Uranus"},
        "questionText": "Which planet has the most prominent ring system?"
      },
      "13": {
        "correctOptionKey": "2",
        "options": {
          "1": "Chlorine",
          "2": "Sodium",
          "3": "Potassium",
          "4": "Calcium"
        },
        "questionText": "Which element is a key component of table salt?"
      },
      "14": {
        "correctOptionKey": "4",
        "options": {
          "1": "Conduction",
          "2": "Convection",
          "3": "Radiation",
          "4": "Insulation"
        },
        "questionText":
            "Which of the following is NOT a method of heat transfer?"
      },
      "15": {
        "correctOptionKey": "1",
        "options": {
          "1": "Photosynthesis",
          "2": "Respiration",
          "3": "Fermentation",
          "4": "Digestion"
        },
        "questionText": "Which process releases oxygen into the atmosphere?"
      },
      "16": {
        "correctOptionKey": "3",
        "options": {
          "1": "Neutron Star",
          "2": "Black Hole",
          "3": "Red Giant",
          "4": "White Dwarf"
        },
        "questionText": "What is the final stage of a star like the Sun?"
      },
      "17": {
        "correctOptionKey": "2",
        "options": {
          "1": "Acceleration",
          "2": "Inertia",
          "3": "Velocity",
          "4": "Momentum"
        },
        "questionText":
            "Which property of matter is described by Newton's First Law of Motion?"
      },
      "18": {
        "correctOptionKey": "4",
        "options": {
          "1": "Hydrogen",
          "2": "Helium",
          "3": "Lithium",
          "4": "Iron"
        },
        "questionText":
            "Which element is the heaviest produced in regular stellar fusion?"
      },
      "19": {
        "correctOptionKey": "1",
        "options": {
          "1": "Celsius",
          "2": "Fahrenheit",
          "3": "Kelvin",
          "4": "Rankine"
        },
        "questionText":
            "Which temperature scale is based on the boiling and freezing points of water?"
      },
      "20": {
        "correctOptionKey": "3",
        "options": {
          "1": "Mitochondria",
          "2": "Nucleus",
          "3": "Ribosome",
          "4": "Golgi Apparatus"
        },
        "questionText": "Which organelle is responsible for protein synthesis?"
      },
      "21": {
        "correctOptionKey": "2",
        "options": {"1": "Earth", "2": "Venus", "3": "Mars", "4": "Mercury"},
        "questionText":
            "Which planet is known as Earth's 'sister planet' due to its similar size and composition?"
      },
      "22": {
        "correctOptionKey": "4",
        "options": {
          "1": "Chlorophyll",
          "2": "Hemoglobin",
          "3": "Melanin",
          "4": "Keratin"
        },
        "questionText":
            "Which pigment is responsible for the green color in plants?"
      },
      "23": {
        "correctOptionKey": "1",
        "options": {"1": "Pascal", "2": "Newton", "3": "Joule", "4": "Watt"},
        "questionText": "What is the SI unit of pressure?"
      },
      "24": {
        "correctOptionKey": "3",
        "options": {
          "1": "Ozone Layer",
          "2": "Ionosphere",
          "3": "Troposphere",
          "4": "Stratosphere"
        },
        "questionText":
            "Which layer of the atmosphere is closest to Earth's surface?"
      },
      "25": {
        "correctOptionKey": "2",
        "options": {
          "1": "Hydrogen",
          "2": "Helium",
          "3": "Oxygen",
          "4": "Nitrogen"
        },
        "questionText":
            "Which element is the second most abundant in the universe?"
      },
      "26": {
        "correctOptionKey": "4",
        "options": {
          "1": "Fossil Fuels",
          "2": "Solar Energy",
          "3": "Wind Energy",
          "4": "Nuclear Fusion"
        },
        "questionText": "Which energy source is NOT renewable?"
      },
      "27": {
        "correctOptionKey": "1",
        "options": {"1": "Ampere", "2": "Volt", "3": "Ohm", "4": "Watt"},
        "questionText": "What is the SI unit of electric current?"
      },
      "28": {
        "correctOptionKey": "3",
        "options": {
          "1": "Cytoplasm",
          "2": "Nucleus",
          "3": "Cell Wall",
          "4": "Cell Membrane"
        },
        "questionText": "Which structure is NOT found in animal cells?"
      },
      "29": {
        "correctOptionKey": "2",
        "options": {"1": "Mars", "2": "Jupiter", "3": "Saturn", "4": "Neptune"},
        "questionText": "Which planet has the Great Red Spot?"
      }
    }
  },
  "History": {
    "title": "History",
    "image_url":
        "https://thumbs.dreamstime.com/b/history-flat-concept-vector-illustration-history-flat-concept-vector-illustration-school-subject-historical-book-humanities-188954901.jpg",
  },
  "Sports": {
    "title": "Sports",
    "image_url":
        "https://www.agoodson.com/wp-content/uploads/2022/05/AndyPotts_Styles_Sports.jpeg",
  },
  "Technology": {
    "title": "Technology",
    "image_url":
        "https://img.freepik.com/free-vector/illustration-social-media-concept_53876-18383.jpg",
  },
  "Geography": {
    "title": "Geography",
    "image_url":
        "https://img.freepik.com/free-vector/geography-teacher-explaining-lesson-pupil-woman-with-pointer-girl-planet-model-flat-illustration_74855-10671.jpg?semt=ais_hybrid",
    "questions": {
      "0": {
        "correctOptionKey": "3",
        "options": {
          "1": "Asia",
          "2": "Africa",
          "3": "Antarctica",
          "4": "Europe"
        },
        "questionText": "Which continent is the least populated?"
      },
      "1": {
        "correctOptionKey": "2",
        "options": {
          "1": "Nile",
          "2": "Amazon",
          "3": "Yangtze",
          "4": "Mississippi"
        },
        "questionText": "Which river is the longest in the world?"
      },
      "2": {
        "correctOptionKey": "4",
        "options": {
          "1": "Mount Kilimanjaro",
          "2": "Mount McKinley",
          "3": "Mount Elbrus",
          "4": "Mount Everest"
        },
        "questionText": "Which mountain is the highest peak in the world?"
      }
    }
  }
};
