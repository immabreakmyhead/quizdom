import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadQuestionsToFirebase() async {
  final collectionRef = FirebaseFirestore.instance.collection('QuestionsTest');
  final snapshots = await collectionRef.get();
  for (final doc in snapshots.docs) {
    await doc.reference.delete();
  }
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
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Andromeda", "2": "Triangulum", "3": "Sagittarius", "4": "Orion"},
        "questionText": "Which galaxy is the closest major neighbor to our Milky Way?"
      },
      "1": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Mercury", "2": "Mars", "3": "Venus", "4": "Jupiter"},
        "questionText": "What is the hottest planet in our solar system?"
      },
      "2": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "4.5 billion", "2": "13.8 billion", "3": "9.3 billion", "4": "20.1 billion"},
        "questionText": "What is the approximate age of the universe in years?"
      },
      "3": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Yuri Gagarin", "2": "Neil Armstrong", "3": "John Glenn", "4": "Alan Shepard"},
        "questionText": "Who was the first human to travel into outer space?"
      },
      "4": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "Jupiter", "2": "Mars", "3": "Neptune", "4": "Saturn"},
        "questionText": "Which solar system planet is known to have the most moons?"
      },
      "5": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Explorer 1", "2": "Vanguard 1", "3": "Sputnik 1", "4": "Apollo 11"},
        "questionText": "What is the name of the first human-made satellite launched into space?"
      },
      "6": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Kepler", "2": "James Webb", "3": "Spitzer", "4": "Chandra"},
        "questionText": "Which space telescope was launched in 2021 to succeed Hubble?"
      },
      "7": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Event Horizon", "2": "Singularity", "3": "Accretion Disk", "4": "Schwarzschild Radius"},
        "questionText": "What is the boundary surrounding a black hole from which nothing can escape?"
      },
      "8": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Venus", "2": "Mars", "3": "Mercury", "4": "Jupiter"},
        "questionText": "Which planet is famously known as the 'Red Planet'?"
      },
      "9": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Europa", "2": "Ganymede", "3": "Titan", "4": "Io"},
        "questionText": "What is the name of Saturn's largest moon?"
      },
      "10": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Spiral", "2": "Elliptical", "3": "Irregular", "4": "Lenticular"},
        "questionText": "What shape classification is our Milky Way galaxy?"
      },
      "11": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "Solar Flare", "2": "Prominence", "3": "Sunspot", "4": "Corona"},
        "questionText": "What is the outermost layer of the Sun's atmosphere called?"
      },
      "12": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Ceres", "2": "Eris", "3": "Haumea", "4": "Makemake"},
        "questionText": "Which dwarf planet is the most massive known in our solar system?"
      },
      "13": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Supernova", "2": "Nebula", "3": "Pulsar", "4": "Red Giant"},
        "questionText": "What is a highly magnetized, rotating neutron star called?"
      },
      "14": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Titan", "2": "Enceladus", "3": "Mimas", "4": "Rhea"},
        "questionText": "Which moon is known for having liquid hydrocarbon lakes on its surface?"
      },
      "15": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Light-year", "2": "Astronomical Unit", "3": "Parsec", "4": "Megameter"},
        "questionText": "What unit of measurement represents the average distance from the Earth to the Sun?"
      },
      "16": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "Helium", "2": "Oxygen", "3": "Carbon", "4": "Iron"},
        "questionText": "What element accumulates in a massive star's core just before it goes supernova?"
      },
      "17": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Proxima Centauri", "2": "Alpha Centauri A", "3": "Sirius", "4": "Barnard's Star"},
        "questionText": "What is the name of the closest star system to our Sun?"
      },
      "18": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "200,000 km/s", "2": "150,000 km/s", "3": "300,000 km/s", "4": "400,000 km/s"},
        "questionText": "What is the approximate speed of light in a vacuum?"
      },
      "19": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Kuiper Belt", "2": "Oort Cloud", "3": "Asteroid Belt", "4": "Heliosphere"},
        "questionText": "What theoretical boundary defines the limits of our Solar System?"
      },
      "20": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Hydrogen", "2": "Helium", "3": "Oxygen", "4": "Nitrogen"},
        "questionText": "What is the most abundant element in the Sun by mass?"
      },
      "21": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "Saturn", "2": "Mars", "3": "Earth", "4": "Jupiter"},
        "questionText": "Which planet in the solar system has the shortest day?"
      },
      "22": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Dust cloud", "2": "Spherical shell of icy comets", "3": "Asteroid belt", "4": "Gas ring"},
        "questionText": "What is the best description of the Oort Cloud?"
      },
      "23": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Polaris", "2": "Vega", "3": "Sirius", "4": "Betelgeuse"},
        "questionText": "What is the name of the brightest star in the night sky?"
      },
      "24": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Venus", "2": "Mercury", "3": "Mars", "4": "Uranus"},
        "questionText": "Which solar system planet has a rotation day longer than its orbit year?"
      },
      "25": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Red Giant", "2": "Yellow Dwarf", "3": "Blue Giant", "4": "White Dwarf"},
        "questionText": "What spectral type classification is our Sun?"
      },
      "26": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "Time", "2": "Velocity", "3": "Brightness", "4": "Distance"},
        "questionText": "What physical parameter does a light-year measure?"
      },
      "27": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Skylab", "2": "Mir", "3": "Salyut 1", "4": "ISS"},
        "questionText": "What is the name of the first space station ever launched?"
      },
      "28": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "ESA", "2": "NASA", "3": "JAXA", "4": "Roscosmos"},
        "questionText": "Which space agency launched the Rosetta mission to land on a comet?"
      },
      "29": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Green", "2": "Blue", "3": "Yellow", "4": "Purple"},
        "questionText": "What color does the sunset appear on Mars?"
      },
      "30": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "Mauna Kea", "2": "Mount Vesuvius", "3": "Mount Etna", "4": "Olympus Mons"},
        "questionText": "What is the name of the largest volcano in the solar system?"
      },
      "31": {
        "difficulty": "hard",
        "correctOptionKey": "1",
        "options": {"1": "Sombrero Galaxy", "2": "Whirlpool Galaxy", "3": "Pinwheel Galaxy", "4": "Sunflower Galaxy"},
        "questionText": "Which galaxy is famously shaped like a Mexican sombrero?"
      },
      "32": {
        "difficulty": "hard",
        "correctOptionKey": "3",
        "options": {"1": "Vanguard 1", "2": "Sputnik 2", "3": "Explorer 1", "4": "Pioneer 1"},
        "questionText": "What was the name of the first American satellite launched successfully?"
      },
      "33": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "Dark Energy", "2": "Gravity", "3": "Magnetic fields", "4": "Nuclear force"},
        "questionText": "What primary force holds galaxies together in clusters?"
      },
      "34": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "Astrology", "2": "Uranology", "3": "Meteorology", "4": "Cosmology"},
        "questionText": "What is the study of the origin, structure, and evolution of the universe called?"
      },
      "35": {
        "difficulty": "hard",
        "correctOptionKey": "1",
        "options": {"1": "Uranus", "2": "Neptune", "3": "Pluto", "4": "Ceres"},
        "questionText": "Which planet was discovered by William Herschel in 1781?"
      },
      "36": {
        "difficulty": "hard",
        "correctOptionKey": "3",
        "options": {"1": "Hydra", "2": "Nix", "3": "Charon", "4": "Styx"},
        "questionText": "What is the name of Pluto's largest moon?"
      },
      "37": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "8 seconds", "2": "8 minutes", "3": "8 hours", "4": "8 days"},
        "questionText": "Approximately how long does it take for light from the Sun to reach Earth?"
      },
      "38": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "Orion", "2": "Ursa Major", "3": "Cassiopeia", "4": "Pegasus"},
        "questionText": "Which constellation represents the Winged Horse in Greek mythology?"
      },
      "39": {
        "difficulty": "hard",
        "correctOptionKey": "1",
        "options": {"1": "Boomerang Nebula", "2": "Crab Nebula", "3": "Orion Nebula", "4": "Helix Nebula"},
        "questionText": "What is currently known as the coldest natural place in the universe?"
      }
    }
  },
  "Cyber & Tech": {
    "title": "Cyber & Tech",
    "image_url": "https://images.unsplash.com/photo-1550751827-4bd374c3f58b?auto=format&fit=crop&w=600&q=80",
    "questions": {
      "0": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "HyperText Transfer Protocol", "2": "HyperText Markup Language", "3": "HighTech Machine Language", "4": "HyperText Management Link"},
        "questionText": "What does HTML stand for?"
      },
      "1": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Central Processing Unit", "2": "Computer Power Utility", "3": "Core Programming Unit", "4": "Control Processing Unit"},
        "questionText": "What does CPU stand for?"
      },
      "2": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Python", "2": "Java", "3": "Binary", "4": "Assembly"},
        "questionText": "What is the base language that computers understand directly?"
      },
      "3": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "1000 bytes", "2": "1000 megabytes", "3": "1024 gigabytes", "4": "1024 bytes"},
        "questionText": "How many bytes are in one kilobyte?"
      },
      "4": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Firefox", "2": "Linux", "3": "Chrome", "4": "Windows"},
        "questionText": "Which of these is an open-source operating system?"
      },
      "5": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Worm", "2": "Trojan", "3": "Phishing", "4": "Spyware"},
        "questionText": "What term describes sending deceptive emails to steal sensitive data?"
      },
      "6": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Random Access Memory", "2": "Read Access Memory", "3": "Run Active Media", "4": "Rapid Allocation Memory"},
        "questionText": "What does RAM stand for?"
      },
      "7": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "LAN", "2": "WAN", "3": "VPN", "4": "IP Address"},
        "questionText": "What is the unique numerical label assigned to each device on a network?"
      },
      "8": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Compiler", "2": "Firewall", "3": "Router", "4": "Switch"},
        "questionText": "What software or hardware monitors network traffic to block unauthorized access?"
      },
      "9": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Ada Lovelace", "2": "Charles Babbage", "3": "Alan Turing", "4": "Bill Gates"},
        "questionText": "Who is widely considered the father of modern computer science?"
      },
      "10": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "21", "2": "80", "3": "443", "4": "22"},
        "questionText": "Which TCP port is standard for FTP connections?"
      },
      "11": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "JavaScript", "2": "C++", "3": "SQL", "4": "Python"},
        "questionText": "Which programming language is named after a British comedy troupe?"
      },
      "12": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Base64", "2": "Cryptography", "3": "Hashing", "4": "Salting"},
        "questionText": "What is the practice of securing communication through mathematical code systems?"
      },
      "13": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Hub", "2": "Modem", "3": "Router", "4": "Gateway"},
        "questionText": "Which device directs data packets across different networks?"
      },
      "14": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "SQL", "2": "NoSQL", "3": "JSON", "4": "HTML"},
        "questionText": "What programming language is primarily used to manage databases?"
      },
      "15": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Cookie", "2": "Cache", "3": "Session", "4": "Token"},
        "questionText": "What temporary storage area stores data so future requests can be served faster?"
      },
      "16": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "RSA", "2": "AES", "3": "DES", "4": "SHA-256"},
        "questionText": "Which cryptographic hash algorithm is used by the Bitcoin blockchain?"
      },
      "17": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "2FA", "2": "SSO", "3": "OAuth", "4": "LDAP"},
        "questionText": "What security method requires two separate forms of identification before access?"
      },
      "18": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Compiler", "2": "Linker", "3": "Interpreter", "4": "Assembler"},
        "questionText": "What program translates and executes code line-by-line without pre-compiling?"
      },
      "19": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "4G", "2": "IPv6", "3": "subnetting", "4": "DNS"},
        "questionText": "What internet protocol was introduced to solve the exhaustion of IPv4 addresses?"
      },
      "20": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Virtual Private Network", "2": "Virtual Protocol Network", "3": "Validated Private Network", "4": "Verified Public Node"},
        "questionText": "What does VPN stand for?"
      },
      "21": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Steve Jobs", "2": "Bill Gates", "3": "Tim Berners-Lee", "4": "Linus Torvalds"},
        "questionText": "Who is credited with creating the World Wide Web?"
      },
      "22": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "NoSQL", "2": "Relational", "3": "Graph", "4": "Key-value"},
        "questionText": "What type of database uses tables with rows and columns to store data?"
      },
      "23": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "Computer Style Sheets", "2": "Creative Style Sheets", "3": "Core Style Sheets", "4": "Cascading Style Sheets"},
        "questionText": "What does CSS stand for?"
      },
      "24": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Kotlin", "2": "Swift", "3": "C#", "4": "PHP"},
        "questionText": "What is the official modern coding language used for native Android development?"
      },
      "25": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Application Protocol Interface", "2": "Application Program Identifier", "3": "Application Programming Interface", "4": "Applied Programming Index"},
        "questionText": "What does API stand for?"
      },
      "26": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "21", "2": "80", "3": "443", "4": "8080"},
        "questionText": "What is the default TCP port used for unencrypted HTTP traffic?"
      },
      "27": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "80", "2": "8080", "3": "22", "4": "443"},
        "questionText": "What is the default TCP port used for secure HTTPS traffic?"
      },
      "28": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "A moth", "2": "A beetle", "3": "A fly", "4": "A spider"},
        "questionText": "What type of physical creature was the first recorded computer bug?"
      },
      "29": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Microsoft", "2": "Apple", "3": "Sun Microsystems", "4": "IBM"},
        "questionText": "Which company originally created and released the Java programming language?"
      },
      "30": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "Data Name Service", "2": "Domain Name System", "3": "Digital Network Server", "4": "Direct Network System"},
        "questionText": "What does DNS stand for?"
      },
      "31": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "Mainframe", "2": "Cloud", "3": "LAN", "4": "Botnet"},
        "questionText": "What is a network of hijacked computers controlled remotely by hackers called?"
      },
      "32": {
        "difficulty": "hard",
        "correctOptionKey": "1",
        "options": {"1": "Ransomware", "2": "Adware", "3": "Spyware", "4": "Rootkit"},
        "questionText": "What type of malware locks user files and demands payment to release them?"
      },
      "33": {
        "difficulty": "hard",
        "correctOptionKey": "3",
        "options": {"1": "image", "2": "picture", "3": "img", "4": "src"},
        "questionText": "Which HTML tag is used to embed an image in a web page?"
      },
      "34": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "Secure System Drive", "2": "Solid State Drive", "3": "Static Speed Disk", "4": "Super Speed Device"},
        "questionText": "What does SSD stand for?"
      },
      "35": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "Vitalik Buterin", "2": "Hal Finney", "3": "Nick Szabo", "4": "Satoshi Nakamoto"},
        "questionText": "What is the pseudonym of the creator of Bitcoin?"
      },
      "36": {
        "difficulty": "hard",
        "correctOptionKey": "1",
        "options": {"1": "Graphical User Interface", "2": "General User Interface", "3": "Graphic Utility Integration", "4": "Graphical Unit Identifier"},
        "questionText": "What does GUI stand for?"
      },
      "37": {
        "difficulty": "hard",
        "correctOptionKey": "3",
        "options": {"1": "FTP", "2": "SSL", "3": "SSH", "4": "Telnet"},
        "questionText": "Which protocol is used to securely log into and execute commands on a remote system?"
      },
      "38": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "Objective-C", "2": "Swift", "3": "Java", "4": "Kotlin"},
        "questionText": "What is the primary language recommended by Apple for modern iOS development?"
      },
      "39": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "git copy", "2": "git pull", "3": "git download", "4": "git clone"},
        "questionText": "What git command is used to duplicate an existing remote repository locally?"
      }
    }
  },
  "Pop Culture": {
    "title": "Pop Culture",
    "image_url": "https://images.unsplash.com/photo-1536440136628-849c177e76a1?auto=format&fit=crop&w=600&q=80",
    "questions": {
      "0": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "George Lucas", "2": "Steven Spielberg", "3": "James Cameron", "4": "Ridley Scott"},
        "questionText": "Who directed the movie 'Jaws'?"
      },
      "1": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Marvel", "2": "Dark Horse", "3": "DC Comics", "4": "Image Comics"},
        "questionText": "Which comic publisher created Batman?"
      },
      "2": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Michael Jackson", "2": "Prince", "3": "Madonna", "4": "David Bowie"},
        "questionText": "Who is known as the 'King of Pop'?"
      },
      "3": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "Tatooine", "2": "Coruscant", "3": "Naboo", "4": "Alderaan"},
        "questionText": "Which planet is Princess Leia's homeworld in Star Wars?"
      },
      "4": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Green", "2": "Yellow", "3": "Red", "4": "Blue"},
        "questionText": "What color is the iconic skin of the Simpsons family characters?"
      },
      "5": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Sony PlayStation", "2": "Sega Genesis", "3": "Nintendo NES", "4": "Atari 2600"},
        "questionText": "Which console saved the video game industry from the 1983 crash?"
      },
      "6": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "John Williams", "2": "Hans Zimmer", "3": "Danny Elfman", "4": "Howard Shore"},
        "questionText": "Who composed the music score for Star Wars, Jaws, and Harry Potter?"
      },
      "7": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "Westeros", "2": "Essos", "3": "Narnia", "4": "Middle-earth"},
        "questionText": "In what fictional world does 'The Lord of the Rings' take place?"
      },
      "8": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Vader", "2": "Sauron", "3": "Morgoth", "4": "Saruman"},
        "questionText": "Who is the primary antagonist in 'The Lord of the Rings'?"
      },
      "9": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Ryu", "2": "Ken", "3": "Mario", "4": "Link"},
        "questionText": "What is the best-selling video game franchise of all time?"
      },
      "10": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Nirvana", "2": "Pearl Jam", "3": "Soundgarden", "4": "Alice in Chains"},
        "questionText": "Which band released the era-defining 1991 album 'Nevermind'?"
      },
      "11": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "Winter is Coming", "2": "Hear Me Roar", "3": "Fire and Blood", "4": "A Lannister always pays his debts"},
        "questionText": "Which of these is NOT a motto of House Stark in Game of Thrones?"
      },
      "12": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Keanu Reeves", "2": "Robert Downey Jr.", "3": "Chris Evans", "4": "Mark Ruffalo"},
        "questionText": "Who played Iron Man in the Marvel Cinematic Universe?"
      },
      "13": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Marilyn Monroe", "2": "Audrey Hepburn", "3": "Taylor Swift", "4": "Lady Gaga"},
        "questionText": "Who was named TIME's 2023 Person of the Year?"
      },
      "14": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Dungeons & Dragons", "2": "Monopoly", "3": "Catan", "4": "Risk"},
        "questionText": "Which tabletop RPG system is set in the Forgotten Realms?"
      },
      "15": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Pac-Man", "2": "Minecraft", "3": "Tetris", "4": "Wii Sports"},
        "questionText": "Which single video game is the best-selling of all time?"
      },
      "16": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "Eminem", "2": "Dr. Dre", "3": "Snoop Dogg", "4": "Tupac Shakur"},
        "questionText": "Which artist released the iconic double album 'All Eyez on Me'?"
      },
      "17": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Dune", "2": "Foundation", "3": "Neuromancer", "4": "Hyperion"},
        "questionText": "Which classic sci-fi novel tells the story of Paul Atreides on Arrakis?"
      },
      "18": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Minecraft", "2": "Roblox", "3": "World of Warcraft", "4": "Runescape"},
        "questionText": "Which MMORPG is set in the world of Azeroth?"
      },
      "19": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Braveheart", "2": "Gladiator", "3": "Titanic", "4": "Unforgiven"},
        "questionText": "Which movie won the Best Picture Academy Award in 2000?"
      },
      "20": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Christopher Nolan", "2": "David Fincher", "3": "Quentin Tarantino", "4": "Martin Scorsese"},
        "questionText": "Who directed the movie 'Inception'?"
      },
      "21": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Corona", "2": "DunBroch", "3": "Arendelle", "4": "Genovia"},
        "questionText": "What is the name of the fictional kingdom in Disney's 'Frozen'?"
      },
      "22": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "The Wire", "2": "Breaking Bad", "3": "Mad Men", "4": "Dexter"},
        "questionText": "Which TV series features a chemistry teacher making illegal substances?"
      },
      "23": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "Brad Pitt", "2": "Johnny Depp", "3": "Matt Damon", "4": "Leonardo DiCaprio"},
        "questionText": "Who played Jack Dawson in the 1997 movie 'Titanic'?"
      },
      "24": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Avatar", "2": "Avengers: Endgame", "3": "Titanic", "4": "Star Wars: The Force Awakens"},
        "questionText": "What is currently the highest-grossing movie of all time worldwide?"
      },
      "25": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Whitney Houston", "2": "Britney Spears", "3": "Madonna", "4": "Celine Dion"},
        "questionText": "Which pop music singer is widely known as the 'Queen of Pop'?"
      },
      "26": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Springfield", "2": "Hawkins", "3": "Riverdale", "4": "Sunnydale"},
        "questionText": "What is the name of the fictional town in 'Stranger Things'?"
      },
      "27": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "Ernest Hemingway", "2": "William Faulkner", "3": "John Steinbeck", "4": "F. Scott Fitzgerald"},
        "questionText": "Who wrote the classic novel 'The Great Gatsby'?"
      },
      "28": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Superman", "2": "Iron Man", "3": "Captain America", "4": "Thor"},
        "questionText": "Which superhero is famously referred to as the 'Man of Steel'?"
      },
      "29": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Isla Sorna", "2": "Isla de Muerta", "3": "Isla Nublar", "4": "Isla Cruces"},
        "questionText": "What is the name of the island where the original 'Jurassic Park' is set?"
      },
      "30": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "Christian Bale", "2": "Hugh Jackman", "3": "Tom Hardy", "4": "Russell Crowe"},
        "questionText": "Who played Wolverine in the live-action X-Men movies?"
      },
      "31": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "Pink Floyd", "2": "Led Zeppelin", "3": "Queen", "4": "The Beatles"},
        "questionText": "Which band released the iconic 1969 studio album 'Abbey Road'?"
      },
      "32": {
        "difficulty": "hard",
        "correctOptionKey": "1",
        "options": {"1": "USS Enterprise", "2": "Millennium Falcon", "3": "Discovery", "4": "Voyager"},
        "questionText": "What is the name of the primary starship in the 'Star Trek' franchise?"
      },
      "33": {
        "difficulty": "hard",
        "correctOptionKey": "3",
        "options": {"1": "Morpheus", "2": "Agent Smith", "3": "Neo", "4": "Cypher"},
        "questionText": "Who is the main protagonist in 'The Matrix' series?"
      },
      "34": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "Seinfeld", "2": "Friends", "3": "The Office", "4": "How I Met Your Mother"},
        "questionText": "Which sitcom features characters named Ross, Rachel, and Monica?"
      },
      "35": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "Heath Ledger", "2": "Jared Leto", "3": "Jack Nicholson", "4": "Joaquin Phoenix"},
        "questionText": "Who won the Best Actor Oscar for playing the title role in 'Joker' (2019)?"
      },
      "36": {
        "difficulty": "hard",
        "correctOptionKey": "1",
        "options": {"1": "Middle-earth", "2": "Narnia", "3": "Westeros", "4": "Azeroth"},
        "questionText": "What is the name of the fantasy land where 'The Lord of the Rings' is set?"
      },
      "37": {
        "difficulty": "hard",
        "correctOptionKey": "3",
        "options": {"1": "Rihanna", "2": "Shakira", "3": "Beyonce", "4": "Adele"},
        "questionText": "Which famous singer released the hit song 'Single Ladies (Put a Ring on It)'?"
      },
      "38": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "Metropolis", "2": "Gotham", "3": "Central City", "4": "Star City"},
        "questionText": "What is the name of the fictional city protected by Batman?"
      },
      "39": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "Stephen King", "2": "George R.R. Martin", "3": "C.S. Lewis", "4": "J.K. Rowling"},
        "questionText": "Who wrote the world-famous 'Harry Potter' fantasy book series?"
      }
    }
  },
  "Legends & Myths": {
    "title": "Legends & Myths",
    "image_url": "https://images.unsplash.com/photo-1543722530-d2c3201371e7?auto=format&fit=crop&w=600&q=80",
    "questions": {
      "0": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Hades", "2": "Poseidon", "3": "Zeus", "4": "Ares"},
        "questionText": "Who is the king of the gods in Greek mythology?"
      },
      "1": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Minotaur", "2": "Centaur", "3": "Pegasus", "4": "Satyr"},
        "questionText": "Which creature had the head of a bull and the body of a man?"
      },
      "2": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "Ares", "2": "Hermes", "3": "Zeus", "4": "Hades"},
        "questionText": "Who ruled the underworld in Greek mythology?"
      },
      "3": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Nemean Lion", "2": "Hydra", "3": "Cerberus", "4": "Medusa"},
        "questionText": "What multi-headed beast regrew two heads for every one cut off?"
      },
      "4": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Athena", "2": "Artemis", "3": "Aphrodite", "4": "Hera"},
        "questionText": "Who was the Greek goddess of love and beauty?"
      },
      "5": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Hercules", "2": "Perseus", "3": "Theseus", "4": "Achilles"},
        "questionText": "Which Greek hero was famous for performing twelve tasks/labors?"
      },
      "6": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "Pegasus", "2": "Griffon", "3": "Phoenix", "4": "Sphinx"},
        "questionText": "What creature told riddles to travelers outside the city of Thebes?"
      },
      "7": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Odin", "2": "Thor", "3": "Loki", "4": "Freyr"},
        "questionText": "Who was the Norse god of thunder?"
      },
      "8": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Tartarus", "2": "Asgard", "3": "Valhalla", "4": "Elysium"},
        "questionText": "What Norse hall welcomed warriors fallen in battle?"
      },
      "9": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Chronos", "2": "Hyperion", "3": "Atlas", "4": "Prometheus"},
        "questionText": "Which Titan was condemned to hold up the celestial heavens forever?"
      },
      "10": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "Odin", "2": "Osiris", "3": "Ra", "4": "Anubis"},
        "questionText": "Who was the jackal-headed Egyptian god of mummification?"
      },
      "11": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Sleipnir", "2": "Fenrir", "3": "Jormungandr", "4": "Garmr"},
        "questionText": "What monstrous wolf is destined to kill Odin at Ragnarok?"
      },
      "12": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Gilgamesh", "2": "Enkidu", "3": "Utnapishtim", "4": "Humbaba"},
        "questionText": "Who is the hero of the oldest surviving epic myth story?"
      },
      "13": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Valkyries", "2": "Sirens", "3": "Norns", "4": "Harpies"},
        "questionText": "Who were the female spirits who chose those who would die in battle?"
      },
      "14": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Osiris", "2": "Horus", "3": "Seth", "4": "Thoth"},
        "questionText": "Which falcon-headed god was the protector of Egypt's pharaohs?"
      },
      "15": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Medusa", "2": "Stheno", "3": "Pegasus", "4": "Euryale"},
        "questionText": "What winged horse sprang from Medusa's neck when she was beheaded?"
      },
      "16": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "Jason", "2": "Perseus", "3": "Theseus", "4": "Odysseus"},
        "questionText": "Who is the legendary voyager of the Greek epic 'The Odyssey'?"
      },
      "17": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Amaterasu", "2": "Susanoo", "3": "Tsukuyomi", "4": "Izanagi"},
        "questionText": "Who is the sun goddess and primary deity of Shinto myth?"
      },
      "18": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Camelot", "2": "Avalon", "3": "Tintagel", "4": "Atlantis"},
        "questionText": "What mythical island was the final resting place of King Arthur?"
      },
      "19": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Chupacabra", "2": "Yeti", "3": "Quetzalcoatl", "4": "Thunderbird"},
        "questionText": "What feathered serpent was a major Mesoamerican deity?"
      },
      "20": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Osiris", "2": "Anubis", "3": "Horus", "4": "Ra"},
        "questionText": "Who is the Egyptian god of the underworld and judge of the dead?"
      },
      "21": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Gungnir", "2": "Excalibur", "3": "Mjolnir", "4": "Gram"},
        "questionText": "What is the name of Thor's hammer in Norse mythology?"
      },
      "22": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Thor", "2": "Loki", "3": "Balder", "4": "Heimdall"},
        "questionText": "Who is the trickster god in Norse mythology?"
      },
      "23": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "Centaur", "2": "Satyr", "3": "Chimera", "4": "Minotaur"},
        "questionText": "Which legendary monster has the head of a bull and body of a man?"
      },
      "24": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Athena", "2": "Artemis", "3": "Hera", "4": "Demeter"},
        "questionText": "Who is the Greek goddess of wisdom and strategic warfare?"
      },
      "25": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Thor", "2": "Tyr", "3": "Odin", "4": "Loki"},
        "questionText": "Who is the supreme father deity in Norse mythology?"
      },
      "26": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Griffin", "2": "Phoenix", "3": "Dragon", "4": "Pegasus"},
        "questionText": "Which mythical bird is known to rise from its own ashes?"
      },
      "27": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "Lancelot", "2": "Merlin", "3": "Galahad", "4": "King Arthur"},
        "questionText": "Who pulled the sword Excalibur from the stone to claim the crown?"
      },
      "28": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Zeus", "2": "Apollo", "3": "Hermes", "4": "Poseidon"},
        "questionText": "What is the Greek mythological name for the Roman god Jupiter?"
      },
      "29": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Valhalla", "2": "Elysium", "3": "Mount Olympus", "4": "Asgard"},
        "questionText": "What mountain serves as the home of the Greek gods?"
      },
      "30": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "Hades", "2": "Poseidon", "3": "Ares", "4": "Apollo"},
        "questionText": "Who is the Greek god of the sea and earthquakes?"
      },
      "31": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "Minotaur", "2": "Satyr", "3": "Pegasus", "4": "Centaur"},
        "questionText": "Which mythological creature is half-man and half-horse?"
      },
      "32": {
        "difficulty": "hard",
        "correctOptionKey": "1",
        "options": {"1": "Unicorn", "2": "Pegasus", "3": "Hippogriff", "4": "Chimera"},
        "questionText": "Which mythical beast has a single spiral horn on its forehead?"
      },
      "33": {
        "difficulty": "hard",
        "correctOptionKey": "3",
        "options": {"1": "Athena", "2": "Artemis", "3": "Aphrodite", "4": "Hestia"},
        "questionText": "Who is the Greek goddess of love, beauty, and desire?"
      },
      "34": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "Jormungandr", "2": "Fenrir", "3": "Garmr", "4": "Nidhogg"},
        "questionText": "Which monstrous wolf is bound by the gods using the ribbon Gleipnir?"
      },
      "35": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "Hercules", "2": "Theseus", "3": "Odysseus", "4": "Perseus"},
        "questionText": "Which Greek hero slew Medusa by using a reflective shield?"
      },
      "36": {
        "difficulty": "hard",
        "correctOptionKey": "1",
        "options": {"1": "Valhalla", "2": "Asgard", "3": "Helheim", "4": "Midgard"},
        "questionText": "What is the Norse hall where Odin houses the souls of heroic warriors?"
      },
      "37": {
        "difficulty": "hard",
        "correctOptionKey": "3",
        "options": {"1": "Anubis", "2": "Osiris", "3": "Ra", "4": "Thoth"},
        "questionText": "Who is the ancient Egyptian sun god, often merged with Amun?"
      },
      "38": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "Jupiter", "2": "Mars", "3": "Neptune", "4": "Vulcan"},
        "questionText": "Which Roman god is the counterpart to the Greek war god Ares?"
      },
      "39": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "Cerberus", "2": "Minotaur", "3": "Charybdis", "4": "Hydra"},
        "questionText": "What multi-headed water serpent did Hercules slay as his second labor?"
      }
    }
  },
  "Deep Sea & Wildlife": {
    "title": "Deep Sea & Wildlife",
    "image_url": "https://images.unsplash.com/photo-1544551763-46a013bb70d5?auto=format&fit=crop&w=600&q=80",
    "questions": {
      "0": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Giant Squid", "2": "Blue Whale", "3": "Colossal Squid", "4": "Whale Shark"},
        "questionText": "What is the largest animal known to have ever existed?"
      },
      "1": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Mariana Trench", "2": "Puerto Rico Trench", "3": "Java Trench", "4": "Sunda Trench"},
        "questionText": "What is the deepest point in the world's oceans?"
      },
      "2": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Shark", "2": "Clownfish", "3": "Anglerfish", "4": "Manta Ray"},
        "questionText": "Which fish has a bioluminescent glowing bulb on its head?"
      },
      "3": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "Ostrich", "2": "Emu", "3": "Cassowary", "4": "Peregrine Falcon"},
        "questionText": "What is the fastest animal on the planet?"
      },
      "4": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Giraffe", "2": "Cheetah", "3": "Lion", "4": "Leopard"},
        "questionText": "What is the fastest land animal over short distances?"
      },
      "5": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "1", "2": "2", "3": "3", "4": "4"},
        "questionText": "How many hearts does an octopus have?"
      },
      "6": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Platypus", "2": "Koala", "3": "Kangaroo", "4": "Opossum"},
        "questionText": "Which of these mammals lays eggs instead of giving birth?"
      },
      "7": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "A pack", "2": "A pride", "3": "A herd", "4": "A pod"},
        "questionText": "What is a group of dolphins called?"
      },
      "8": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Green Sea Turtle", "2": "Leatherback", "3": "Loggerhead", "4": "Hawksbill"},
        "questionText": "What is the largest species of turtle in the world?"
      },
      "9": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Antarctic", "2": "Gobi", "3": "Sahara", "4": "Kalahari"},
        "questionText": "What is the largest hot desert in the world?"
      },
      "10": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Great Barrier Reef", "2": "Belize Barrier Reef", "3": "New Caledonia Barrier Reef", "4": "Pulley Ridge"},
        "questionText": "What is the largest living structure on Earth, visible from space?"
      },
      "11": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "Sea Anemone", "2": "Coral", "3": "Sea Urchin", "4": "Box Jellyfish"},
        "questionText": "Which marine creature is considered the most venomous in the ocean?"
      },
      "12": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Dolphin", "2": "Orca", "3": "Humpback", "4": "Beluga"},
        "questionText": "Which apex predator is actually a member of the dolphin family?"
      },
      "13": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Shark", "2": "Tuna", "3": "Coelacanth", "4": "Sturgeon"},
        "questionText": "What prehistoric fish, thought extinct for 65 million years, was found in 1938?"
      },
      "14": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Giant Isopod", "2": "Spider Crab", "3": "Blobfish", "4": "Vampire Squid"},
        "questionText": "Which deep-sea scavenger is related to land-dwelling woodlice?"
      },
      "15": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Coral Reef", "2": "Hydrothermal Vent", "3": "Abyssal Plain", "4": "Seamount"},
        "questionText": "What deep-sea structure releases mineral-rich water heated by magma?"
      },
      "16": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "Sunfish", "2": "Marlin", "3": "Sturgeon", "4": "Sailfish"},
        "questionText": "What is the fastest-swimming fish in the ocean?"
      },
      "17": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Greenland Shark", "2": "Great White", "3": "Bowhead Whale", "4": "Galapagos Tortoise"},
        "questionText": "What is the longest-living vertebrate animal known?"
      },
      "18": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Kangaroo", "2": "Opossum", "3": "Platypus", "4": "Koala"},
        "questionText": "Which semi-aquatic mammal has venomous spurs on its hind legs?"
      },
      "19": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Chimpanzee", "2": "Bonobo", "3": "Gorilla", "4": "Orangutan"},
        "questionText": "Which primate shares the highest percentage of DNA with humans?"
      },
      "20": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Whale Shark", "2": "Great White Shark", "3": "Tiger Shark", "4": "Hammerhead Shark"},
        "questionText": "What is the largest living species of shark?"
      },
      "21": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Beluga", "2": "Orca", "3": "Narwhal", "4": "Dugong"},
        "questionText": "Which marine mammal is famous for its long, spiral tusk?"
      },
      "22": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Plankton", "2": "Krill", "3": "Small fish", "4": "Jellyfish"},
        "questionText": "What tiny shrimp-like creature constitutes the primary diet of blue whales?"
      },
      "23": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "Crocodile", "2": "Lion", "3": "Grizzly Bear", "4": "Hippopotamus"},
        "questionText": "Which land mammal can open its mouth the widest?"
      },
      "24": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Three", "2": "Two", "3": "One", "4": "Four"},
        "questionText": "How many hearts does an octopus possess?"
      },
      "25": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Blue Whale", "2": "Tuna", "3": "Sailfish", "4": "Swordfish"},
        "questionText": "What is recognized as the fastest swimming marine animal?"
      },
      "26": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Crow", "2": "Parrot", "3": "Raven", "4": "Owl"},
        "questionText": "Which bird species is famous for its ability to mimic human speech?"
      },
      "27": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "Flying Squirrel", "2": "Sugar Glider", "3": "Flying Lemur", "4": "Bat"},
        "questionText": "What is the only mammal capable of sustained active flight?"
      },
      "28": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Polar Bear", "2": "Kodiak Bear", "3": "Siberian Tiger", "4": "African Elephant"},
        "questionText": "What is the largest living land-dwelling carnivore?"
      },
      "29": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Blobfish", "2": "Viperfish", "3": "Anglerfish", "4": "Lanternfish"},
        "questionText": "Which deep-sea fish uses a bioluminescent organ to lure prey?"
      },
      "30": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "Eight", "2": "Ten", "3": "Twelve", "4": "Six"},
        "questionText": "How many limbs (arms and tentacles combined) does a squid have?"
      },
      "31": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "Eucalyptus", "2": "Grass", "3": "Fruits", "4": "Bamboo"},
        "questionText": "What is the primary food source of giant pandas in the wild?"
      },
      "32": {
        "difficulty": "hard",
        "correctOptionKey": "1",
        "options": {"1": "Lion", "2": "Tiger", "3": "Jaguar", "4": "Leopard"},
        "questionText": "Which big cat is traditionally referred to as the 'King of the Jungle'?"
      },
      "33": {
        "difficulty": "hard",
        "correctOptionKey": "3",
        "options": {"1": "Leatherback Turtle", "2": "Komodo Dragon", "3": "Saltwater Crocodile", "4": "Anaconda"},
        "questionText": "What is the largest living reptile species in the world?"
      },
      "34": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "Jellyfish", "2": "Starfish", "3": "Sea Urchin", "4": "Sea Cucumber"},
        "questionText": "Which marine invertebrate is shaped like a star with multiple arms?"
      },
      "35": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "Australia", "2": "Galapagos Islands", "3": "New Zealand", "4": "Madagascar"},
        "questionText": "What is the only place in the world where lemurs are native in the wild?"
      },
      "36": {
        "difficulty": "hard",
        "correctOptionKey": "1",
        "options": {"1": "Kiwi", "2": "Penguin", "3": "Kakapo", "4": "Albatross"},
        "questionText": "Which nocturnal flightless bird is native to New Zealand?"
      },
      "37": {
        "difficulty": "hard",
        "correctOptionKey": "3",
        "options": {"1": "Pronghorn", "2": "Leopard", "3": "Cheetah", "4": "Lion"},
        "questionText": "What is the fastest land animal over short sprints?"
      },
      "38": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "Seal", "2": "Sea Otter", "3": "Manatee", "4": "Walrus"},
        "questionText": "Which marine mammal is famous for holding hands while sleeping?"
      },
      "39": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "Blue Whale", "2": "Rhino", "3": "Hippopotamus", "4": "Elephant"},
        "questionText": "Which mammal has the longest gestation period (up to 22 months)?"
      }
    }
  },
  "Science & Inventions": {
    "title": "Science & Inventions",
    "image_url": "https://images.unsplash.com/photo-1507668077129-56e32842fceb?auto=format&fit=crop&w=600&q=80",
    "questions": {
      "0": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Albert Einstein", "2": "Isaac Newton", "3": "Galileo Galilei", "4": "Nikola Tesla"},
        "questionText": "Who is considered the father of modern observational astronomy?"
      },
      "1": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Thomas Edison", "2": "Nikola Tesla", "3": "Alexander Graham Bell", "4": "Guglielmo Marconi"},
        "questionText": "Who invented the phonograph and light bulb?"
      },
      "2": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "H2O", "2": "CO2", "3": "O2", "4": "NaCl"},
        "questionText": "What is the chemical formula for common table salt?"
      },
      "3": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Isaac Newton", "2": "Albert Einstein", "3": "Max Planck", "4": "Niels Bohr"},
        "questionText": "Who formulated the Special and General Theories of Relativity?"
      },
      "4": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Oxygen", "2": "Hydrogen", "3": "Nitrogen", "4": "Carbon dioxide"},
        "questionText": "What is the most abundant gas in Earth's atmosphere?"
      },
      "5": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Marie Curie", "2": "Rosalind Franklin", "3": "Ada Lovelace", "4": "Jane Goodall"},
        "questionText": "Who was the first woman to win a Nobel Prize?"
      },
      "6": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "Water", "2": "Carbon dioxide", "3": "Helium", "4": "Hydrogen"},
        "questionText": "What is the lightest chemical element in the periodic table?"
      },
      "7": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "Dynamo", "2": "Dynamite", "3": "Steam engine", "4": "Telephone"},
        "questionText": "What invention is Alfred Nobel famous for creating?"
      },
      "8": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Alexander Graham Bell", "2": "Thomas Edison", "3": "Nikola Tesla", "4": "James Watt"},
        "questionText": "Who patented the Alternating Current (AC) induction motor?"
      },
      "9": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Charles Darwin", "2": "Gregor Mendel", "3": "Louis Pasteur", "4": "Jean-Baptiste Lamarck"},
        "questionText": "Who wrote 'On the Origin of Species' introducing evolution theory?"
      },
      "10": {
        "difficulty": "easy",
        "correctOptionKey": "4",
        "options": {"1": "Wilt", "2": "Kepler", "3": "Galileo", "4": "Copernicus"},
        "questionText": "Who proposed the heliocentric model placing the Sun at the center?"
      },
      "11": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "James Watson", "2": "Wilhelm Rontgen", "3": "Marie Curie", "4": "Ernest Rutherford"},
        "questionText": "Who discovered X-rays in 1895?"
      },
      "12": {
        "difficulty": "easy",
        "correctOptionKey": "3",
        "options": {"1": "Vaccination", "2": "Pasteurization", "3": "Penicillin", "4": "Anesthesia"},
        "questionText": "What breakthrough antibiotic did Alexander Fleming discover in 1928?"
      },
      "13": {
        "difficulty": "easy",
        "correctOptionKey": "1",
        "options": {"1": "Robert Hooke", "2": "Antonie van Leeuwenhoek", "3": "Louis Pasteur", "4": "Rudolf Virchow"},
        "questionText": "Who first observed and named 'cells' under a microscope?"
      },
      "14": {
        "difficulty": "easy",
        "correctOptionKey": "2",
        "options": {"1": "100,000", "2": "300,000", "3": "500,000", "4": "200,000"},
        "questionText": "What is the speed of light in kilometers per second?"
      },
      "15": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Diamond", "2": "Graphene", "3": "Lonsdaleite", "4": "Carbyne"},
        "questionText": "What is the hardest naturally occurring substance on Earth?"
      },
      "16": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "James Watt", "2": "George Stephenson", "3": "Robert Fulton", "4": "Eli Whitney"},
        "questionText": "Who improved the steam engine design, powering the Industrial Revolution?"
      },
      "17": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "Mitochondria", "2": "Nucleus", "3": "Ribosome", "4": "Chloroplast"},
        "questionText": "Which organelle in plant cells conducts photosynthesis?"
      },
      "18": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Iron", "2": "Copper", "3": "Silver", "4": "Gold"},
        "questionText": "What metal was first smelted by humans, marking the end of the Stone Age?"
      },
      "19": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Mars", "2": "Jupiter", "3": "Venus", "4": "Saturn"},
        "questionText": "Which planet is the brightest natural object in the night sky after the Moon?"
      },
      "20": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Alexander Graham Bell", "2": "Elisha Gray", "3": "Thomas Edison", "4": "Guglielmo Marconi"},
        "questionText": "Who invented and patented the first practical telephone?"
      },
      "21": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Gd", "2": "Go", "3": "Au", "4": "Ag"},
        "questionText": "What is the chemical symbol for Gold on the periodic table?"
      },
      "22": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "Louis Pasteur", "2": "Alexander Fleming", "3": "Jonas Salk", "4": "Edward Jenner"},
        "questionText": "Who is credited with the discovery of penicillin in 1928?"
      },
      "23": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "Oxygen", "2": "Carbon Dioxide", "3": "Argon", "4": "Nitrogen"},
        "questionText": "What is the most abundant gas in the Earth's atmosphere?"
      },
      "24": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "James Watt", "2": "Thomas Savery", "3": "Robert Fulton", "4": "George Stephenson"},
        "questionText": "Who developed the first modern steam engine that powered the Industrial Revolution?"
      },
      "25": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "150,000 km/s", "2": "200,000 km/s", "3": "300,000 km/s", "4": "400,000 km/s"},
        "questionText": "What is the speed of light in a vacuum?"
      },
      "26": {
        "difficulty": "medium",
        "correctOptionKey": "2",
        "options": {"1": "S", "2": "Na", "3": "So", "4": "Sd"},
        "questionText": "What is the chemical symbol for Sodium?"
      },
      "27": {
        "difficulty": "medium",
        "correctOptionKey": "4",
        "options": {"1": "Thomas Edison", "2": "Nikola Tesla", "3": "Michael Faraday", "4": "Benjamin Franklin"},
        "questionText": "Who is famous for inventing the lightning rod to protect buildings?"
      },
      "28": {
        "difficulty": "medium",
        "correctOptionKey": "1",
        "options": {"1": "Gamma rays", "2": "X-rays", "3": "Ultraviolet", "4": "Infrared"},
        "questionText": "What type of electromagnetic radiation has the shortest wavelength?"
      },
      "29": {
        "difficulty": "medium",
        "correctOptionKey": "3",
        "options": {"1": "Galileo Galilei", "2": "Nicolaus Copernicus", "3": "Johannes Kepler", "4": "Isaac Newton"},
        "questionText": "Who discovered the three laws of planetary motion in the 17th century?"
      },
      "30": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "H2O", "2": "NaCl", "3": "CO2", "4": "NaHCO3"},
        "questionText": "What is the chemical formula for common table salt?"
      },
      "31": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "Albert Sabin", "2": "Louis Pasteur", "3": "Edward Jenner", "4": "Jonas Salk"},
        "questionText": "Who developed the first successful polio vaccine in 1952?"
      },
      "32": {
        "difficulty": "hard",
        "correctOptionKey": "1",
        "options": {"1": "Hydrogen", "2": "Helium", "3": "Lithium", "4": "Oxygen"},
        "questionText": "What is the lightest chemical element in the universe?"
      },
      "33": {
        "difficulty": "hard",
        "correctOptionKey": "3",
        "options": {"1": "Celsius", "2": "Fahrenheit", "3": "Kelvin", "4": "Rankine"},
        "questionText": "Which temperature scale starts at absolute zero?"
      },
      "34": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "William Caxton", "2": "Johannes Gutenberg", "3": "Aldus Manutius", "4": "Bi Sheng"},
        "questionText": "Who is credited with inventing the movable type printing press in Europe?"
      },
      "35": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "Proton", "2": "Neutron", "3": "Positron", "4": "Electron"},
        "questionText": "What subatomic particle carries a negative charge?"
      },
      "36": {
        "difficulty": "hard",
        "correctOptionKey": "1",
        "options": {"1": "Antoine Lavoisier", "2": "John Dalton", "3": "Dmitri Mendeleev", "4": "Robert Boyle"},
        "questionText": "Who is widely recognized as the father of modern chemistry?"
      },
      "37": {
        "difficulty": "hard",
        "correctOptionKey": "3",
        "options": {"1": "Volt", "2": "Ampere", "3": "Ohm", "4": "Watt"},
        "questionText": "What is the SI unit of electrical resistance?"
      },
      "38": {
        "difficulty": "hard",
        "correctOptionKey": "2",
        "options": {"1": "Anders Celsius", "2": "Daniel Gabriel Fahrenheit", "3": "Lord Kelvin", "4": "Galileo Galilei"},
        "questionText": "Who invented the mercury-in-glass thermometer in 1714?"
      },
      "39": {
        "difficulty": "hard",
        "correctOptionKey": "4",
        "options": {"1": "I", "2": "Ir", "3": "In", "4": "Fe"},
        "questionText": "What is the chemical symbol for Iron on the periodic table?"
      }
    }
  }
};
