import 'package:cloud_firestore/cloud_firestore.dart';

// to upload data in firebase
Future<void> uploadQuestionsToFirebase() async {
  // First, clear all existing documents in the collection to delete old categories
  final collectionRef = FirebaseFirestore.instance.collection('QuestionsTest');
  final snapshots = await collectionRef.get();
  for (final doc in snapshots.docs) {
    await doc.reference.delete();
  }

  // Upload the new categories
  for (final sector in data.entries) {
    await uploadQuestionsForAField(
      sector.key,
      sector.value,
    );
  }
}

Future<void> uploadQuestionsForAField(String field, dynamic data) async {
  await FirebaseFirestore.instance.collection('QuestionsTest').doc(field).set(data);
}

final data = {
  "Space & Cosmos": {
    "title": "Space & Cosmos",
    "image_url": "https://images.unsplash.com/photo-1506318137071-a8e063b4bec0?auto=format&fit=crop&w=600&q=80",
    "questions": {
      "0": {
        "correctOptionKey": "1",
        "options": {"1": "Andromeda", "2": "Triangulum", "3": "Sagittarius", "4": "Orion"},
        "questionText": "Which galaxy is the closest major neighbor to our Milky Way?"
      },
      "1": {
        "correctOptionKey": "3",
        "options": {"1": "Mercury", "2": "Mars", "3": "Venus", "4": "Jupiter"},
        "questionText": "What is the hottest planet in our solar system?"
      },
      "2": {
        "correctOptionKey": "2",
        "options": {"1": "4.5 billion", "2": "13.8 billion", "3": "9.3 billion", "4": "20.1 billion"},
        "questionText": "What is the approximate age of the universe in years?"
      },
      "3": {
        "correctOptionKey": "1",
        "options": {"1": "Yuri Gagarin", "2": "Neil Armstrong", "3": "John Glenn", "4": "Alan Shepard"},
        "questionText": "Who was the first human to travel into outer space?"
      },
      "4": {
        "correctOptionKey": "4",
        "options": {"1": "Jupiter", "2": "Mars", "3": "Neptune", "4": "Saturn"},
        "questionText": "Which solar system planet is known to have the most moons?"
      },
      "5": {
        "correctOptionKey": "3",
        "options": {"1": "Explorer 1", "2": "Vanguard 1", "3": "Sputnik 1", "4": "Apollo 11"},
        "questionText": "What is the name of the first human-made satellite launched into space?"
      },
      "6": {
        "correctOptionKey": "2",
        "options": {"1": "Kepler", "2": "James Webb", "3": "Spitzer", "4": "Chandra"},
        "questionText": "Which space telescope was launched in 2021 to succeed Hubble?"
      },
      "7": {
        "correctOptionKey": "1",
        "options": {"1": "Event Horizon", "2": "Singularity", "3": "Accretion Disk", "4": "Schwarzschild Radius"},
        "questionText": "What is the boundary surrounding a black hole from which nothing can escape?"
      },
      "8": {
        "correctOptionKey": "2",
        "options": {"1": "Venus", "2": "Mars", "3": "Mercury", "4": "Jupiter"},
        "questionText": "Which planet is famously known as the 'Red Planet'?"
      },
      "9": {
        "correctOptionKey": "3",
        "options": {"1": "Europa", "2": "Ganymede", "3": "Titan", "4": "Io"},
        "questionText": "What is the name of Saturn's largest moon?"
      },
      "10": {
        "correctOptionKey": "1",
        "options": {"1": "Spiral", "2": "Elliptical", "3": "Irregular", "4": "Lenticular"},
        "questionText": "What shape classification is our Milky Way galaxy?"
      },
      "11": {
        "correctOptionKey": "4",
        "options": {"1": "Helium", "2": "Oxygen", "3": "Carbon", "4": "Hydrogen"},
        "questionText": "What gas makes up the majority of the Sun's mass?"
      },
      "12": {
        "correctOptionKey": "2",
        "options": {"1": "8 seconds", "2": "8 minutes", "3": "8 hours", "4": "8 days"},
        "questionText": "Roughly how long does it take for light from the Sun to reach Earth?"
      },
      "13": {
        "correctOptionKey": "3",
        "options": {"1": "Mauna Loa", "2": "Mount Vesuvius", "3": "Olympus Mons", "4": "Mount Etna"},
        "questionText": "What is the name of the largest volcano in our solar system?"
      },
      "14": {
        "correctOptionKey": "1",
        "options": {"1": "Uranus", "2": "Neptune", "3": "Venus", "4": "Pluto"},
        "questionText": "Which planet rotates on its side, almost at a 98-degree tilt?"
      },
      "15": {
        "correctOptionKey": "2",
        "options": {"1": "Magnetism", "2": "Gravity", "3": "Friction", "4": "Inertia"},
        "questionText": "What force keeps the planets in orbit around the Sun?"
      },
      "16": {
        "correctOptionKey": "4",
        "options": {"1": "Neil Armstrong", "2": "Yuri Gagarin", "3": "Michael Collins", "4": "Buzz Aldrin"},
        "questionText": "Who was the second person to step foot on the Moon?"
      },
      "17": {
        "correctOptionKey": "3",
        "options": {"1": "Andromeda", "2": "Triangulum", "3": "Milky Way", "4": "Sombrero"},
        "questionText": "What is the name of the galaxy we live in?"
      },
      "18": {
        "correctOptionKey": "1",
        "options": {"1": "Saturn", "2": "Jupiter", "3": "Uranus", "4": "Neptune"},
        "questionText": "Which planet has a prominent hexagonal cloud pattern at its north pole?"
      },
      "19": {
        "correctOptionKey": "2",
        "options": {"1": "Time", "2": "Distance", "3": "Speed", "4": "Brightness"},
        "questionText": "What is a light-year a measurement of?"
      }
    }
  },
  "Cyber & Tech": {
    "title": "Cyber & Tech",
    "image_url": "https://images.unsplash.com/photo-1550751827-4bd374c3f58b?auto=format&fit=crop&w=600&q=80",
    "questions": {
      "0": {
        "correctOptionKey": "2",
        "options": {"1": "Creeper", "2": "Brain", "3": "Melissa", "4": "ILOVEYOU"},
        "questionText": "What was the name of the first computer virus created in the wild?"
      },
      "1": {
        "correctOptionKey": "1",
        "options": {"1": "Hypertext Transfer Protocol", "2": "Hyperlink Text Transfer Program", "3": "High Transfer Protocol", "4": "Hypertext Tech Protocol"},
        "questionText": "What does HTTP stand for in web addresses?"
      },
      "2": {
        "correctOptionKey": "3",
        "options": {"1": "Java", "2": "C++", "3": "Python", "4": "Ruby"},
        "questionText": "Which programming language is named after a British comedy group?"
      },
      "3": {
        "correctOptionKey": "4",
        "options": {"1": "Virtual Personal Network", "2": "Very Private Network", "3": "Verified Port Network", "4": "Virtual Private Network"},
        "questionText": "What does the abbreviation VPN stand for?"
      },
      "4": {
        "correctOptionKey": "2",
        "options": {"1": "Hardware components", "2": "Credentials and personal data", "3": "Internet bandwidth", "4": "Processor cycles"},
        "questionText": "In cybersecurity, what does a phishing attack try to steal?"
      },
      "5": {
        "correctOptionKey": "1",
        "options": {"1": "Block unauthorized access", "2": "Boost internet speed", "3": "Scan for hard drive errors", "4": "Clean physical components"},
        "questionText": "What is the primary function of a network firewall?"
      },
      "6": {
        "correctOptionKey": "3",
        "options": {"1": "Apple", "2": "Microsoft", "3": "Android Inc.", "4": "IBM"},
        "questionText": "Which original startup company created the Android operating system?"
      },
      "7": {
        "correctOptionKey": "2",
        "options": {"1": "SQL", "2": "Blockchain", "3": "MongoDB", "4": "Oracle"},
        "questionText": "What is the primary database technology used to store Bitcoin transactions?"
      },
      "8": {
        "correctOptionKey": "4",
        "options": {"1": "Read Access Memory", "2": "Rapid Action Module", "3": "Random Active Memory", "4": "Random Access Memory"},
        "questionText": "What does RAM stand for in computer hardware?"
      },
      "9": {
        "correctOptionKey": "1",
        "options": {"1": "Alan Turing", "2": "Bill Gates", "3": "Steve Jobs", "4": "Charles Babbage"},
        "questionText": "Who is widely considered the father of modern computer science?"
      },
      "10": {
        "correctOptionKey": "3",
        "options": {"1": "80", "2": "21", "3": "443", "4": "8080"},
        "questionText": "What is the port number commonly used for secure web traffic (HTTPS)?"
      },
      "11": {
        "correctOptionKey": "2",
        "options": {"1": "Spyware", "2": "Ransomware", "3": "Trojan Horse", "4": "Adware"},
        "questionText": "Which type of malware encrypts files and demands payment to release them?"
      },
      "12": {
        "correctOptionKey": "1",
        "options": {"1": "Structured Query Language", "2": "Simple Queue Layout", "3": "System Query Logic", "4": "Sequential Query List"},
        "questionText": "What does SQL stand for?"
      },
      "13": {
        "correctOptionKey": "4",
        "options": {"1": "Windows", "2": "macOS", "3": "Unix", "4": "Linux"},
        "questionText": "Which operating system kernel was created by Linus Torvalds?"
      },
      "14": {
        "correctOptionKey": "2",
        "options": {"1": "Black Hat", "2": "White Hat", "3": "Grey Hat", "4": "Red Hat"},
        "questionText": "What is the term for a hacker who uses their skills for ethical purposes?"
      },
      "15": {
        "correctOptionKey": "3",
        "options": {"1": "Google", "2": "Amazon", "3": "Microsoft", "4": "Facebook"},
        "questionText": "Which technology giant acquired GitHub in 2018?"
      },
      "16": {
        "correctOptionKey": "1",
        "options": {"1": "101", "2": "110", "3": "011", "4": "111"},
        "questionText": "What is the binary representation of the decimal number 5?"
      },
      "17": {
        "correctOptionKey": "4",
        "options": {"1": "Computer Processing Unit", "2": "Core Processor Unit", "3": "Central Power Unit", "4": "Central Processing Unit"},
        "questionText": "What does CPU stand for?"
      },
      "18": {
        "correctOptionKey": "2",
        "options": {"1": "Wi-Fi", "2": "Bluetooth", "3": "Zigbee", "4": "Infrared"},
        "questionText": "Which wireless tech is named after a 10th-century Scandinavian king?"
      },
      "19": {
        "correctOptionKey": "3",
        "options": {"1": "UNIVAC", "2": "Colossus", "3": "ENIAC", "4": "Altair"},
        "questionText": "What is the name of the first electronic general-purpose computer?"
      }
    }
  },
  "Pop Culture": {
    "title": "Pop Culture",
    "image_url": "https://images.unsplash.com/photo-1536440136628-849c177e76a1?auto=format&fit=crop&w=600&q=80",
    "questions": {
      "0": {
        "correctOptionKey": "2",
        "options": {"1": "Tatooine", "2": "Hoth", "3": "Mustafar", "4": "Endor"},
        "questionText": "Which planet in the Star Wars universe is covered entirely in ice and snow?"
      },
      "1": {
        "correctOptionKey": "3",
        "options": {"1": "Steven Spielberg", "2": "James Cameron", "3": "Christopher Nolan", "4": "Ridley Scott"},
        "questionText": "Who directed the mind-bending sci-fi movie Interstellar?"
      },
      "2": {
        "correctOptionKey": "1",
        "options": {"1": "Wakanda", "2": "Zamunda", "3": "Genovia", "4": "Asgard"},
        "questionText": "What is the name of the fictional African kingdom in Black Panther?"
      },
      "3": {
        "correctOptionKey": "4",
        "options": {"1": "Chris Evans", "2": "Chris Hemsworth", "3": "Mark Ruffalo", "4": "Robert Downey Jr."},
        "questionText": "Which actor played Iron Man in the Marvel Cinematic Universe?"
      },
      "4": {
        "correctOptionKey": "2",
        "options": {"1": "Essos", "2": "Westeros", "3": "Middle-earth", "4": "Narnia"},
        "questionText": "What is the name of the primary continent where Game of Thrones takes place?"
      },
      "5": {
        "correctOptionKey": "1",
        "options": {"1": "Red", "2": "Blue", "3": "Green", "4": "Yellow"},
        "questionText": "In 'The Matrix', what color pill does Neo take to wake up in reality?"
      },
      "6": {
        "correctOptionKey": "3",
        "options": {"1": "Toy Story", "2": "Monsters Inc.", "3": "Shrek", "4": "Finding Nemo"},
        "questionText": "Which movie won the first Academy Award for Best Animated Feature?"
      },
      "7": {
        "correctOptionKey": "2",
        "options": {"1": "Crookshanks", "2": "Hedwig", "3": "Scabbers", "4": "Fawkes"},
        "questionText": "What is the name of Harry Potter's pet snowy owl?"
      },
      "8": {
        "correctOptionKey": "4",
        "options": {"1": "Metropolis", "2": "Central City", "3": "Star City", "4": "Gotham City"},
        "questionText": "Which fictional city is protected by Batman?"
      },
      "9": {
        "correctOptionKey": "1",
        "options": {"1": "John Williams", "2": "Hans Zimmer", "3": "Danny Elfman", "4": "Howard Shore"},
        "questionText": "Who composed the music score for Star Wars, Jaws, and Harry Potter?"
      },
      "10": {
        "correctOptionKey": "3",
        "options": {"1": "Lonely Mountain", "2": "Mount Erebus", "3": "Mount Doom", "4": "Mount Vesuvius"},
        "questionText": "In Lord of the Rings, what is the volcano where the One Ring was forged?"
      },
      "11": {
        "correctOptionKey": "2",
        "options": {"1": "Britney Spears", "2": "Madonna", "3": "Lady Gaga", "4": "Beyoncé"},
        "questionText": "Which singer is widely known as the 'Queen of Pop'?"
      },
      "12": {
        "correctOptionKey": "1",
        "options": {"1": "Link", "2": "Zelda", "3": "Ganon", "4": "Mario"},
        "questionText": "What is the name of the green-clad protagonist in Legend of Zelda?"
      },
      "13": {
        "correctOptionKey": "4",
        "options": {"1": "Gone with the Wind", "2": "Citizen Kane", "3": "The Godfather", "4": "Casablanca"},
        "questionText": "Which classic film features the line, 'Here's looking at you, kid'?"
      },
      "14": {
        "correctOptionKey": "2",
        "options": {"1": "Central Park", "2": "Central Perk", "3": "Monk's Diner", "4": "The Bean"},
        "questionText": "What is the name of the coffee shop in the TV show Friends?"
      },
      "15": {
        "correctOptionKey": "3",
        "options": {"1": "Jack Nicholson", "2": "Joaquin Phoenix", "3": "Heath Ledger", "4": "Jared Leto"},
        "questionText": "Who played the Joker in the 2008 film 'The Dark Knight'?"
      },
      "16": {
        "correctOptionKey": "1",
        "options": {"1": "Taylor Swift", "2": "Ariana Grande", "3": "Katy Perry", "4": "Selena Gomez"},
        "questionText": "Which pop star's dedicated fans are called 'Swifties'?"
      },
      "17": {
        "correctOptionKey": "4",
        "options": {"1": "Isla Sorna", "2": "Isla de Muerta", "3": "Isla Cabras", "4": "Isla Nublar"},
        "questionText": "What is the name of the main dinosaur island in the movie Jurassic Park?"
      },
      "18": {
        "correctOptionKey": "2",
        "options": {"1": "The Nether", "2": "The Upside Down", "3": "The Underworld", "4": "The Shadow Realm"},
        "questionText": "In 'Stranger Things', what is the parallel dark dimension called?"
      },
      "19": {
        "correctOptionKey": "3",
        "options": {"1": "Tarzan", "2": "Aladdin", "3": "The Lion King", "4": "Mulan"},
        "questionText": "Which animated Disney movie features a character named Simba?"
      }
    }
  },
  "Legends & Myths": {
    "title": "Legends & Myths",
    "image_url": "https://images.unsplash.com/photo-1543722530-d2c3201371e7?auto=format&fit=crop&w=600&q=80",
    "questions": {
      "0": {
        "correctOptionKey": "1",
        "options": {"1": "Sleipnir", "2": "Pegasus", "3": "Fenrir", "4": "Jormungandr"},
        "questionText": "In Norse mythology, what is the name of Odin's eight-legged horse?"
      },
      "1": {
        "correctOptionKey": "3",
        "options": {"1": "Petra", "2": "Chichen Itza", "3": "Machu Picchu", "4": "Pompeii"},
        "questionText": "Which ancient city was rediscovered in Peru by Hiram Bingham in 1911?"
      },
      "2": {
        "correctOptionKey": "2",
        "options": {"1": "Zeus", "2": "Hades", "3": "Poseidon", "4": "Ares"},
        "questionText": "Who is the Greek god of the underworld?"
      },
      "3": {
        "correctOptionKey": "4",
        "options": {"1": "Griffin", "2": "Centaur", "3": "Minotaur", "4": "Sphinx"},
        "questionText": "What mythical creature has the head of a human and the body of a lion?"
      },
      "4": {
        "correctOptionKey": "1",
        "options": {"1": "Ra", "2": "Osiris", "3": "Anubis", "4": "Horus"},
        "questionText": "In Egyptian mythology, who is the god of the sun?"
      },
      "5": {
        "correctOptionKey": "3",
        "options": {"1": "Atlantis", "2": "Shangri-La", "3": "El Dorado", "4": "Camelot"},
        "questionText": "Which mythical city of the Americas is said to be paved with gold?"
      },
      "6": {
        "correctOptionKey": "2",
        "options": {"1": "Asgard", "2": "Valhalla", "3": "Midgard", "4": "Helheim"},
        "questionText": "What Norse location is known as the great hall of slain heroes?"
      },
      "7": {
        "correctOptionKey": "4",
        "options": {"1": "Lancelot", "2": "Merlin", "3": "Uther", "4": "King Arthur"},
        "questionText": "Who was the legendary king who pulled Excalibur from the stone?"
      },
      "8": {
        "correctOptionKey": "1",
        "options": {"1": "Mayans", "2": "Aztecs", "3": "Incas", "4": "Olmecs"},
        "questionText": "Which ancient civilization built the temple city of Tikal in Guatemala?"
      },
      "9": {
        "correctOptionKey": "3",
        "options": {"1": "Perseus", "2": "Hercules", "3": "Icarus", "4": "Achilles"},
        "questionText": "What is the name of the Greek character who flew too close to the sun?"
      },
      "10": {
        "correctOptionKey": "2",
        "options": {"1": "Neptune", "2": "Jupiter", "3": "Mars", "4": "Pluto"},
        "questionText": "In Roman mythology, who is the equivalent of the Greek god Zeus?"
      },
      "11": {
        "correctOptionKey": "4",
        "options": {"1": "Lemuria", "2": "Mu", "3": "Avalon", "4": "Atlantis"},
        "questionText": "What legendary island was first mentioned by Plato and sank into the sea?"
      },
      "12": {
        "correctOptionKey": "1",
        "options": {"1": "Medusa", "2": "Hydra", "3": "Chimera", "4": "Scylla"},
        "questionText": "Which monster of Greek myth had snakes for hair and turned people to stone?"
      },
      "13": {
        "correctOptionKey": "3",
        "options": {"1": "Amber Road", "2": "Spice Route", "3": "Silk Road", "4": "Incense Route"},
        "questionText": "What is the name of the ancient trade route that connected China to Rome?"
      },
      "14": {
        "correctOptionKey": "2",
        "options": {"1": "Dragon", "2": "Phoenix", "3": "Pegasus", "4": "Hippogriff"},
        "questionText": "In mythology, what rises from its own ashes in a cycle of rebirth?"
      },
      "15": {
        "correctOptionKey": "4",
        "options": {"1": "Colossus of Rhodes", "2": "Lighthouse of Alexandria", "3": "Temple of Artemis", "4": "Hanging Gardens"},
        "questionText": "Which ancient wonder was located in Babylon and featured tiered gardens?"
      },
      "16": {
        "correctOptionKey": "1",
        "options": {"1": "Thor", "2": "Loki", "3": "Odin", "4": "Baldur"},
        "questionText": "Who was the Norse god of thunder who wielded the hammer Mjolnir?"
      },
      "17": {
        "correctOptionKey": "3",
        "options": {"1": "Odysseus", "2": "Perseus", "3": "Jason", "4": "Theseus"},
        "questionText": "Which mythological hero went on a quest for the Golden Fleece?"
      },
      "18": {
        "correctOptionKey": "2",
        "options": {"1": "The Sphinx", "2": "The Great Pyramid", "3": "The Valley of Kings", "4": "Karnak"},
        "questionText": "Which giant triangular stone monument is famously found in Giza, Egypt?"
      },
      "19": {
        "correctOptionKey": "4",
        "options": {"1": "William Tell", "2": "King Arthur", "3": "Lancelot", "4": "Robin Hood"},
        "questionText": "Which legendary archer is famous for robbing the rich to give to the poor?"
      }
    }
  },
  "Deep Sea & Wildlife": {
    "title": "Deep Sea & Wildlife",
    "image_url": "https://images.unsplash.com/photo-1544551763-46a013bb70d5?auto=format&fit=crop&w=600&q=80",
    "questions": {
      "0": {
        "correctOptionKey": "3",
        "options": {"1": "Sunlight Zone", "2": "Twilight Zone", "3": "Abyssopelagic Zone", "4": "Hadal Zone"},
        "questionText": "Which ocean zone is completely devoid of sunlight and begins at 4,000 meters?"
      },
      "1": {
        "correctOptionKey": "2",
        "options": {"1": "Blue Whale", "2": "Sperm Whale", "3": "Lion", "4": "Howler Monkey"},
        "questionText": "Which animal is known as the loudest on Earth, clicking up to 230 decibels?"
      },
      "2": {
        "correctOptionKey": "1",
        "options": {"1": "Mariana Trench", "2": "Puerto Rico Trench", "3": "Java Trench", "4": "Sunda Trench"},
        "questionText": "What is the deepest known location in the Earth's oceans?"
      },
      "3": {
        "correctOptionKey": "4",
        "options": {"1": "Amoeba", "2": "Rotifer", "3": "Nematode", "4": "Tardigrade"},
        "questionText": "Which microscopic animal can survive in the vacuum of outer space?"
      },
      "4": {
        "correctOptionKey": "3",
        "options": {"1": "Viperfish", "2": "Blobfish", "3": "Anglerfish", "4": "Gulper Eel"},
        "questionText": "Which fish has a glowing rod-like appendage on its head to lure prey?"
      },
      "5": {
        "correctOptionKey": "2",
        "options": {"1": "Great White Shark", "2": "Whale Shark", "3": "Hammerhead Shark", "4": "Megalodon"},
        "questionText": "What is the largest living species of shark?"
      },
      "6": {
        "correctOptionKey": "1",
        "options": {"1": "Axolotl", "2": "Chameleon", "3": "Gecko", "4": "Starfish"},
        "questionText": "Which animal can regenerate its entire limbs, tail, spinal cord, and parts of its brain?"
      },
      "7": {
        "correctOptionKey": "4",
        "options": {"1": "Halophiles", "2": "Thermophiles", "3": "Anaerobes", "4": "Extremophiles"},
        "questionText": "What is the term for organisms that thrive in extreme physical or geochemical conditions?"
      },
      "8": {
        "correctOptionKey": "3",
        "options": {"1": "Squid", "2": "Jellyfish", "3": "Octopus", "4": "Starfish"},
        "questionText": "Which marine animal has three hearts and blue blood?"
      },
      "9": {
        "correctOptionKey": "2",
        "options": {"1": "Stonefish", "2": "Box Jellyfish", "3": "Blue-Ringed Octopus", "4": "Lionfish"},
        "questionText": "What is the most venomous marine animal known to humans?"
      },
      "10": {
        "correctOptionKey": "1",
        "options": {"1": "Wandering Albatross", "2": "Andean Condor", "3": "Bald Eagle", "4": "Golden Eagle"},
        "questionText": "Which bird has the longest wingspan of any living bird?"
      },
      "11": {
        "correctOptionKey": "4",
        "options": {"1": "Plankton", "2": "Small Fish", "3": "Squid", "4": "Krill"},
        "questionText": "What is the main food source of the giant blue whale?"
      },
      "12": {
        "correctOptionKey": "3",
        "options": {"1": "Stonefish", "2": "Monkfish", "3": "Blobfish", "4": "Goblin Shark"},
        "questionText": "Which deep-sea fish is famous for its gelatinous, sad-looking face?"
      },
      "13": {
        "correctOptionKey": "2",
        "options": {"1": "Komodo Dragon", "2": "Tuatara", "3": "Gila Monster", "4": "Iguana"},
        "questionText": "Which reptile has a third eye on top of its head used to register changes in light?"
      },
      "14": {
        "correctOptionKey": "1",
        "options": {"1": "Bat", "2": "Flying Squirrel", "3": "Flying Lemur", "4": "Sugar Glider"},
        "questionText": "What is the only mammal capable of true, sustained flight?"
      },
      "15": {
        "correctOptionKey": "4",
        "options": {"1": "Clownfish", "2": "Dolphin", "3": "Sea Otter", "4": "Seahorse"},
        "questionText": "Which sea creature is known to mate for life and swims in pairs?"
      },
      "16": {
        "correctOptionKey": "3",
        "options": {"1": "Polar Bear", "2": "Beaver", "3": "Sea Otter", "4": "Chinchilla"},
        "questionText": "Which mammal has the densest fur of any animal on Earth?"
      },
      "17": {
        "correctOptionKey": "2",
        "options": {"1": "Coral Reef", "2": "Hydrothermal Vent", "3": "Kelp Forest", "4": "Seamount"},
        "questionText": "What is the name of the deep-sea ecosystem that gets its energy from chemicals rather than sunlight?"
      },
      "18": {
        "correctOptionKey": "1",
        "options": {"1": "Elephant", "2": "Rhinoceros", "3": "Giraffe", "4": "Blue Whale"},
        "questionText": "Which land mammal has the longest gestation period of almost 22 months?"
      },
      "19": {
        "correctOptionKey": "4",
        "options": {"1": "Moon Jellyfish", "2": "Box Jellyfish", "3": "Lion's Mane", "4": "Turritopsis dohrnii"},
        "questionText": "Which jellyfish is considered biologically immortal because it can revert to its polyp stage?"
      }
    }
  },
  "Science & Inventions": {
    "title": "Science & Inventions",
    "image_url": "https://images.unsplash.com/photo-1507668077129-56e32842fceb?auto=format&fit=crop&w=600&q=80",
    "questions": {
      "0": {
        "correctOptionKey": "1",
        "options": {"1": "Alexander Fleming", "2": "Louis Pasteur", "3": "Robert Koch", "4": "Joseph Lister"},
        "questionText": "Who discovered the first antibiotic substance, penicillin, in 1928?"
      },
      "1": {
        "correctOptionKey": "4",
        "options": {"1": "Albert Einstein", "2": "Isaac Newton", "3": "Galileo Galilei", "4": "Nikola Tesla"},
        "questionText": "Which famous inventor developed the Alternating Current (AC) electrical system?"
      },
      "2": {
        "correctOptionKey": "3",
        "options": {"1": "Iron", "2": "Copper", "3": "Carbon", "4": "Silicon"},
        "questionText": "What element is the primary basis of organic chemistry and all known life?"
      },
      "3": {
        "correctOptionKey": "2",
        "options": {"1": "Solids", "2": "Gases", "3": "Liquids", "4": "Plasmas"},
        "questionText": "Boyle's Law describes the behavior of which state of matter?"
      },
      "4": {
        "correctOptionKey": "1",
        "options": {"1": "Thomas Edison", "2": "Alexander Graham Bell", "3": "Guglielmo Marconi", "4": "Benjamin Franklin"},
        "questionText": "Who is credited with inventing the phonograph and the first commercial incandescent lightbulb?"
      },
      "5": {
        "correctOptionKey": "3",
        "options": {"1": "Oxygen", "2": "Carbon Dioxide", "3": "Nitrogen", "4": "Hydrogen"},
        "questionText": "What gas makes up approximately 78% of Earth's atmosphere?"
      },
      "6": {
        "correctOptionKey": "2",
        "options": {"1": "Proton", "2": "Electron", "3": "Neutron", "4": "Quark"},
        "questionText": "Which subatomic particle has a negative electric charge?"
      },
      "7": {
        "correctOptionKey": "4",
        "options": {"1": "Edward Jenner", "2": "Jonas Salk", "3": "Albert Sabin", "4": "Louis Pasteur"},
        "questionText": "Who developed the first successful rabies and anthrax vaccines, and discovered pasteurization?"
      },
      "8": {
        "correctOptionKey": "1",
        "options": {"1": "Diamond", "2": "Quartz", "3": "Topaz", "4": "Corundum"},
        "questionText": "What is the hardest naturally occurring mineral on the Mohs hardness scale?"
      },
      "9": {
        "correctOptionKey": "3",
        "options": {"1": "30,000 km/s", "2": "150,000 km/s", "3": "300,000 km/s", "4": "1,000,000 km/s"},
        "questionText": "What is the approximate speed of light in a vacuum?"
      },
      "10": {
        "correctOptionKey": "2",
        "options": {"1": "Geology", "2": "Mycology", "3": "Entomology", "4": "Botany"},
        "questionText": "What is the scientific study of fungi called?"
      },
      "11": {
        "correctOptionKey": "4",
        "options": {"1": "Marie Curie", "2": "Rosalind Franklin", "3": "Lise Meitner", "4": "Ada Lovelace"},
        "questionText": "Who is widely recognized as the world's first computer programmer for her work on Babbage's engine?"
      },
      "12": {
        "correctOptionKey": "1",
        "options": {"1": "Photosynthesis", "2": "Respiration", "3": "Transpiration", "4": "Fermentation"},
        "questionText": "What process do plants use to convert sunlight into chemical energy?"
      },
      "13": {
        "correctOptionKey": "3",
        "options": {"1": "Jonas Salk", "2": "Louis Pasteur", "3": "Edward Jenner", "4": "Alexander Fleming"},
        "questionText": "Who developed the world's first successful vaccine, which was for smallpox in 1796?"
      },
      "14": {
        "correctOptionKey": "2",
        "options": {"1": "Wilhelm Röntgen", "2": "Marie Curie", "3": "Ernest Rutherford", "4": "Pierre Curie"},
        "questionText": "Who was the first person to win two Nobel Prizes, in Physics and Chemistry, for researching radioactivity?"
      },
      "15": {
        "correctOptionKey": "1",
        "options": {"1": "Charles Darwin", "2": "Gregor Mendel", "3": "Jean-Baptiste Lamarck", "4": "Alfred Russel Wallace"},
        "questionText": "Who formulated the theory of evolution by natural selection in his 1859 book?"
      },
      "16": {
        "correctOptionKey": "4",
        "options": {"1": "James Watson", "2": "Francis Crick", "3": "Maurice Wilkins", "4": "Rosalind Franklin"},
        "questionText": "Whose X-ray diffraction images (Photo 51) were critical to discovering the double-helix structure of DNA?"
      },
      "17": {
        "correctOptionKey": "3",
        "options": {"1": "Seismograph", "2": "Barometer", "3": "Anemometer", "4": "Hygrometer"},
        "questionText": "What scientific instrument is used to measure wind speed?"
      },
      "18": {
        "correctOptionKey": "2",
        "options": {"1": "Gold", "2": "Silver", "3": "Copper", "4": "Aluminum"},
        "questionText": "Which metal is the best conductor of electricity at room temperature?"
      },
      "19": {
        "correctOptionKey": "4",
        "options": {"1": "Johannes Kepler", "2": "Nicolaus Copernicus", "3": "Galileo Galilei", "4": "Johannes Gutenberg"},
        "questionText": "Who invented the movable-type printing press in Europe around 1440, revolutionizing knowledge sharing?"
      }
    }
  }
};
