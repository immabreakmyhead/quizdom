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
  "Countries & Capitals": {
    "title": "Countries & Capitals",
    "image_url": "https://img.freepik.com/free-vector/world-map-concept-illustration_114360-1506.jpg",
    "questions": {
      "0": {
        "correctOptionKey": "2",
        "options": {"1": "Milan", "2": "Rome", "3": "Venice", "4": "Florence"},
        "questionText": "What is the capital of Italy?"
      },
      "1": {
        "correctOptionKey": "1",
        "options": {"1": "Canberra", "2": "Sydney", "3": "Melbourne", "4": "Perth"},
        "questionText": "What is the capital of Australia?"
      },
      "2": {
        "correctOptionKey": "3",
        "options": {"1": "Brazil", "2": "Argentina", "3": "Chile", "4": "Peru"},
        "questionText": "Which country has Santiago as its capital?"
      },
      "3": {
        "correctOptionKey": "1",
        "options": {"1": "Tokyo", "2": "Osaka", "3": "Kyoto", "4": "Hiroshima"},
        "questionText": "What is the capital of Japan?"
      },
      "4": {
        "correctOptionKey": "4",
        "options": {"1": "Berlin", "2": "Hamburg", "3": "Munich", "4": "Paris"},
        "questionText": "What is the capital of France?"
      },
      "5": {
        "correctOptionKey": "2",
        "options": {"1": "Toronto", "2": "Ottawa", "3": "Vancouver", "4": "Montreal"},
        "questionText": "What is the capital of Canada?"
      },
      "6": {
        "correctOptionKey": "1",
        "options": {"1": "Beijing", "2": "Shanghai", "3": "Hong Kong", "4": "Guangzhou"},
        "questionText": "What is the capital of China?"
      },
      "7": {
        "correctOptionKey": "3",
        "options": {"1": "Lisbon", "2": "Madrid", "3": "Berlin", "4": "Rome"},
        "questionText": "What is the capital of Germany?"
      },
      "8": {
        "correctOptionKey": "4",
        "options": {"1": "Cairo", "2": "Alexandria", "3": "Giza", "4": "Khartoum"},
        "questionText": "What is the capital of Sudan?"
      },
      "9": {
        "correctOptionKey": "2",
        "options": {"1": "Bangkok", "2": "Hanoi", "3": "Jakarta", "4": "Kuala Lumpur"},
        "questionText": "What is the capital of Vietnam?"
      }
    }
  },

  "Famous Landmarks": {
    "title": "Famous Landmarks",
    "image_url": "https://img.freepik.com/free-vector/world-landmarks-concept_23-2147769298.jpg",
    "questions": {
      "0": {
        "correctOptionKey": "4",
        "options": {"1": "Rome", "2": "Athens", "3": "Istanbul", "4": "Paris"},
        "questionText": "In which city is the Eiffel Tower located?"
      },
      "1": {
        "correctOptionKey": "2",
        "options": {"1": "India", "2": "China", "3": "Japan", "4": "Mongolia"},
        "questionText": "The Great Wall is located in which country?"
      },
      "2": {
        "correctOptionKey": "3",
        "options": {"1": "Paris", "2": "Rome", "3": "Sydney", "4": "London"},
        "questionText": "Where is the Sydney Opera House located?"
      },
      "3": {
        "correctOptionKey": "1",
        "options": {"1": "Agra", "2": "Mumbai", "3": "New Delhi", "4": "Jaipur"},
        "questionText": "Where is the Taj Mahal located?"
      },
      "4": {
        "correctOptionKey": "4",
        "options": {"1": "Mexico City", "2": "Bogotá", "3": "Buenos Aires", "4": "Machu Picchu"},
        "questionText": "Where is Machu Picchu located?"
      },
      "5": {
        "correctOptionKey": "2",
        "options": {"1": "Athens", "2": "Rome", "3": "Paris", "4": "Istanbul"},
        "questionText": "Where is the Colosseum located?"
      },
      "6": {
        "correctOptionKey": "1",
        "options": {"1": "Cairo", "2": "Casablanca", "3": "Alexandria", "4": "Lagos"},
        "questionText": "Where is the Great Pyramid of Giza located?"
      },
      "7": {
        "correctOptionKey": "3",
        "options": {"1": "London", "2": "Paris", "3": "Stonehenge", "4": "Berlin"},
        "questionText": "Where is Stonehenge located?"
      },
      "8": {
        "correctOptionKey": "4",
        "options": {"1": "Tokyo", "2": "Seoul", "3": "Beijing", "4": "Angkor Wat"},
        "questionText": "Where is Angkor Wat located?"
      },
      "9": {
        "correctOptionKey": "2",
        "options": {"1": "Cairo", "2": "Petra", "3": "Damascus", "4": "Jerusalem"},
        "questionText": "Where is the ancient city of Petra located?"
      }
    }
  },

  "Flags of the World": {
    "title": "Flags of the World",
    "image_url": "https://img.freepik.com/free-vector/world-flags-concept_23-2147771553.jpg",
    "questions": {
      "0": {
        "correctOptionKey": "1",
        "options": {"1": "Japan", "2": "South Korea", "3": "China", "4": "Vietnam"},
        "questionText": "Which country has a red circle on a white background?"
      },
      "1": {
        "correctOptionKey": "3",
        "options": {"1": "France", "2": "Netherlands", "3": "Russia", "4": "Croatia"},
        "questionText": "Which country's flag has white, blue, and red horizontal stripes?"
      },
      "2": {
        "correctOptionKey": "2",
        "options": {"1": "USA", "2": "Germany", "3": "Italy", "4": "Belgium"},
        "questionText": "Which country's flag has black, red, and yellow horizontal stripes?"
      },
      "3": {
        "correctOptionKey": "4",
        "options": {"1": "Norway", "2": "Finland", "3": "Denmark", "4": "Switzerland"},
        "questionText": "Which country's flag has a white cross on a red square background?"
      },
      "4": {
        "correctOptionKey": "3",
        "options": {"1": "India", "2": "Pakistan", "3": "Bangladesh", "4": "Sri Lanka"},
        "questionText": "Which country has a green flag with a red circle in the middle?"
      },
      "5": {
        "correctOptionKey": "2",
        "options": {"1": "UK", "2": "Australia", "3": "New Zealand", "4": "Canada"},
        "questionText": "Which country has the Union Jack in the top left corner of its flag?"
      },
      "6": {
        "correctOptionKey": "1",
        "options": {"1": "South Africa", "2": "Kenya", "3": "Nigeria", "4": "Egypt"},
        "questionText": "Which country's flag has six colors forming a Y-shape?"
      },
      "7": {
        "correctOptionKey": "4",
        "options": {"1": "Sweden", "2": "Norway", "3": "Finland", "4": "Iceland"},
        "questionText": "Which Nordic country has a white cross on a blue background?"
      },
      "8": {
        "correctOptionKey": "3",
        "options": {"1": "Argentina", "2": "Chile", "3": "Uruguay", "4": "Paraguay"},
        "questionText": "Which country has a white sun on a blue and white striped flag?"
      },
      "9": {
        "correctOptionKey": "2",
        "options": {"1": "Mexico", "2": "Italy", "3": "France", "4": "Spain"},
        "questionText": "Which country has a vertical tricolor of green, white, and red?"
      }
    }
  },

  "Continents & Oceans": {
    "title": "Continents & Oceans",
    "image_url": "https://img.freepik.com/free-vector/earth-geography-concept_23-2148891757.jpg",
    "questions": {
      "0": {
        "correctOptionKey": "4",
        "options": {"1": "Atlantic", "2": "Indian", "3": "Arctic", "4": "Pacific"},
        "questionText": "Which is the largest ocean on Earth?"
      },
      "1": {
        "correctOptionKey": "2",
        "options": {"1": "Africa", "2": "Asia", "3": "Europe", "4": "South America"},
        "questionText": "Which is the largest continent by area?"
      },
      "2": {
        "correctOptionKey": "3",
        "options": {"1": "Europe", "2": "Africa", "3": "Antarctica", "4": "Asia"},
        "questionText": "Which continent is the least populated?"
      },
      "3": {
        "correctOptionKey": "1",
        "options": {"1": "Atlantic", "2": "Indian", "3": "Southern", "4": "Arctic"},
        "questionText": "Which ocean is the second largest by surface area?"
      },
      "4": {
        "correctOptionKey": "2",
        "options": {"1": "Australia", "2": "Europe", "3": "South America", "4": "Africa"},
        "questionText": "Which continent has the highest number of countries?"
      },
      "5": {
        "correctOptionKey": "3",
        "options": {"1": "Pacific", "2": "Atlantic", "3": "Indian", "4": "Arctic"},
        "questionText": "Which ocean is mainly located between Africa, Asia, and Australia?"
      },
      "6": {
        "correctOptionKey": "4",
        "options": {"1": "Asia", "2": "Europe", "3": "Africa", "4": "South America"},
        "questionText": "Which continent is famous for the Amazon rainforest?"
      },
      "7": {
        "correctOptionKey": "1",
        "options": {"1": "Atlantic", "2": "Pacific", "3": "Indian", "4": "Southern"},
        "questionText": "Which ocean borders both Africa and Europe?"
      },
      "8": {
        "correctOptionKey": "2",
        "options": {"1": "Africa", "2": "Asia", "3": "Europe", "4": "North America"},
        "questionText": "Which continent is home to the Himalayas?"
      },
      "9": {
        "correctOptionKey": "3",
        "options": {"1": "Pacific", "2": "Atlantic", "3": "Southern", "4": "Arctic"},
        "questionText": "Which ocean surrounds Antarctica?"
      }
    }
  },

  "Cultures & Traditions": {
    "title": "Cultures & Traditions",
    "image_url": "https://img.freepik.com/free-vector/cultural-diversity-concept_23-2148539419.jpg",
    "questions": {
      "0": {
        "correctOptionKey": "1",
        "options": {"1": "Brazil", "2": "Spain", "3": "Mexico", "4": "Argentina"},
        "questionText": "Carnival is most famously celebrated in which country?"
      },
      "1": {
        "correctOptionKey": "4",
        "options": {"1": "China", "2": "Thailand", "3": "India", "4": "Japan"},
        "questionText": "Which country is known for the tradition of cherry blossom festivals?"
      },
      "2": {
        "correctOptionKey": "2",
        "options": {"1": "Germany", "2": "Oktoberfest", "3": "Italy", "4": "Spain"},
        "questionText": "Where is the Oktoberfest held?"
      },
      "3": {
        "correctOptionKey": "3",
        "options": {"1": "India", "2": "Pakistan", "3": "Nepal", "4": "Bhutan"},
        "questionText": "Where is the festival of Holi primarily celebrated?"
      },
      "4": {
        "correctOptionKey": "1",
        "options": {"1": "Mexico", "2": "Canada", "3": "USA", "4": "Brazil"},
        "questionText": "Where is the Day of the Dead festival celebrated?"
      },
      "5": {
        "correctOptionKey": "2",
        "options": {"1": "Spain", "2": "Thailand", "3": "Japan", "4": "China"},
        "questionText": "Where is the Songkran Water Festival celebrated?"
      },
      "6": {
        "correctOptionKey": "3",
        "options": {"1": "USA", "2": "UK", "3": "Ireland", "4": "Scotland"},
        "questionText": "Where is St. Patrick's Day traditionally celebrated?"
      },
      "7": {
        "correctOptionKey": "1",
        "options": {"1": "China", "2": "Japan", "3": "Vietnam", "4": "Thailand"},
        "questionText": "Where is the Lunar New Year most celebrated?"
      },
      "8": {
        "correctOptionKey": "4",
        "options": {"1": "Spain", "2": "Italy", "3": "Portugal", "4": "Greece"},
        "questionText": "Where is the festival of Santorini's blue domes celebrated?"
      },
      "9": {
        "correctOptionKey": "2",
        "options": {"1": "India", "2": "Morocco", "3": "Egypt", "4": "Turkey"},
        "questionText": "Where is the festival of Marrakech celebrated?"
      }
    }
  },

  "Mountains & Lakes": {
    "title": "Mountains & Lakes",
    "image_url": "https://img.freepik.com/free-vector/mountains-landscape-illustration_23-2148260128.jpg",
    "questions": {
      "0": {
        "correctOptionKey": "4",
        "options": {"1": "K2", "2": "Kangchenjunga", "3": "Lhotse", "4": "Mount Everest"},
        "questionText": "What is the highest mountain in the world?"
      },
      "1": {
        "correctOptionKey": "2",
        "options": {"1": "Lake Victoria", "2": "Caspian Sea", "3": "Lake Baikal", "4": "Lake Superior"},
        "questionText": "Which is the largest lake in the world by surface area?"
      },
      "2": {
        "correctOptionKey": "3",
        "options": {"1": "Kilimanjaro", "2": "Everest", "3": "Mont Blanc", "4": "Elbrus"},
        "questionText": "Which mountain is the highest in Europe?"
      },
      "3": {
        "correctOptionKey": "1",
        "options": {"1": "Denali", "2": "Mount Logan", "3": "Mont Blanc", "4": "K2"},
        "questionText": "Which mountain is the highest peak in North America?"
      },
      "4": {
        "correctOptionKey": "4",
        "options": {"1": "Lake Michigan", "2": "Lake Huron", "3": "Lake Erie", "4": "Lake Superior"},
        "questionText": "Which is the largest freshwater lake in North America?"
      },
      "5": {
        "correctOptionKey": "2",
        "options": {"1": "Victoria", "2": "Tanganyika", "3": "Baikal", "4": "Great Slave Lake"},
        "questionText": "Which African lake is the second largest by volume?"
      },
      "6": {
        "correctOptionKey": "3",
        "options": {"1": "Mount Kosciuszko", "2": "Mount Fuji", "3": "Aconcagua", "4": "Mount Elbrus"},
        "questionText": "Which mountain is the highest in South America?"
      },
      "7": {
        "correctOptionKey": "1",
        "options": {"1": "Lake Baikal", "2": "Lake Superior", "3": "Lake Tanganyika", "4": "Caspian Sea"},
        "questionText": "Which is the deepest lake in the world?"
      },
      "8": {
        "correctOptionKey": "4",
        "options": {"1": "Matterhorn", "2": "Alps", "3": "Rockies", "4": "Everest"},
        "questionText": "Which mountain belongs to the Himalayas?"
      },
      "9": {
        "correctOptionKey": "2",
        "options": {"1": "Loch Ness", "2": "Lake Titicaca", "3": "Lake Geneva", "4": "Lake Ontario"},
        "questionText": "Which is the highest navigable lake in the world?"
      }
    }
  }
};




