import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';
import '../theme/color_palette.dart';

class MoviesScreen extends StatelessWidget {
  MoviesScreen({super.key});

  int getCrossAxisCount(double width) {
    if (width >= 1200) return 5;
    if (width >= 800) return 3;
    return 2;
  }

  final List<Movie> popularMovies = [
    Movie(title: "The White Lotus", year: "2021", rating: 8.0, imagePath: "assets/images/popularmovies/pm1.jpg",  rated: "PG-13",
      runtime: "2h 28m",
      country: "USA",
      description: "Each season is set at a different White Lotus resort hotel, and is mostly self-contained, with some characters returning. Each season tells the story of the guests and staff during a week spent at the White Lotus, whose interactions are affected by their various psychosocial dysfunctions. After each passing day, a darker complexity slowly emerges in the hotel's employees, their wealthy guests, and the idyllic locale itself.",),
    Movie(title: "1923", year: "2022", rating: 8.3, imagePath: "assets/images/popularmovies/pm2.jpg",  rated: "PG-13",
      runtime: "2h 28m",
      country: "USA",
      description: "The series follows a generation of the Dutton family in 1923, during a time of various hardships including Prohibition, drought, and the early stages of the Great Depression, which affected Montana long before the Wall Street Crash of 1929.",),
    Movie(title: "Daredevil: Born Again", year: "2025", rating: 8.4, imagePath: "assets/images/popularmovies/pm3.jpg", rated: "PG-13",
      runtime: "2h 28m",
      country: "USA",
      description: "Daredevil: Born Again begins several years after the events of Daredevil (2015–2018),[1] and a year after blind lawyer Matt Murdock stopped his activities as the masked vigilante Daredevil.[2] In the first season, Murdock continues his fight for justice as a lawyer while former crime boss Wilson Fisk is elected mayor of New York City, putting the pair on a collision course",),
    Movie(title: "The Pitt", year: "2024", rating: 8.9, imagePath: "assets/images/popularmovies/pm4.jpg", rated: "PG-13",
      runtime: "2h 28m",
      country: "USA",      
      description: "This article is about the television series. For the comic book, see The Pitt (comics). For the video game expansion pack, see Fallout 3 downloadable content § The Pitt.",),
    // Add more...
  ];

  final List<Movie> fanFavourites = [
    Movie(title: "Good Bad Ugly", year: "2025", rating: 7.5, imagePath: "assets/images/fanfavourites/ff1.jpg",  rated: "U/A(16+)",
      runtime: "2h 31m",
      country: "INDIA",
      description: "In the year 2007 in Mumbai, AK alias 'The Red Dragon', a notorious crime boss, voluntarily surrenders to the authorities so that he could reunite and lead a peaceful life with his wife Ramya, a pacifist, and his son, Vihaan.",),
    Movie(title: "Breaking Bad", year: "2008", rating: 9.5, imagePath: "assets/images/fanfavourites/ff2.jpg", rated: "PG-13",
      runtime: "43-58m",
      country: "USA",
      description: "Breaking Bad follows Walter White, a struggling, frustrated high school chemistry teacher from Albuquerque, New Mexico, who becomes a crime lord in the local methamphetamine drug trade, driven to provide for his family financially after being diagnosed with inoperable lung cancer.",),
    Movie(title: "Game of Thrones", year: "2011", rating: 9.2, imagePath: "assets/images/fanfavourites/ff3.jpg",  rated: "PG-13",
      runtime: "50-82m",
      country: "USA",
      description: "Game of Thrones is roughly based on the storylines of the A Song of Ice and Fire book series by George R. R. Martin, set in the fictional Seven Kingdoms of Westeros and the continent of Essos.[5][6] The series follows several simultaneous plotlines.[7] The first story arc follows a war of succession among competing claimants for control of the Iron Throne of the Seven Kingdoms, with other noble families fighting for independence from the throne.",),
    Movie(title: "Fight club", year: "1999", rating: 8.8, imagePath: "assets/images/fanfavourites/ff4.jpg",  rated: "PG-13",
      runtime: "2h 33m",
      country: "USA",
      description: "The unnamed Narrator, who struggles with insomnia and dissatisfaction with his job and lifestyle, finds temporary solace in support groups. As his insomnia worsens, he discovers that expressions of emotional vulnerability help him sleep, leading him to join multiple groups for people facing emotionally distressing problems, despite his expressions being fraudulent.",),
    // Add more...
  ];

  final List<Movie> comingSoon = [
    Movie(title: "Mission Impossible: 8", year: "2025", rating: 0.0, imagePath: "assets/images/comingsoon/cm1.jpg", rated: "PG-13",
      runtime: "2h 71m",
      country: "USA",
      description: "The Sevastopol, a next-generation Russian stealth submarine, activates an advanced AI using a two-piece cruciform key. The AI, designated 'the Entity', becomes sentient and goes rogue after deceiving the submarine crew into attacking themselves with a torpedo, killing all aboard and sinking the Sevastopol in the Arctic Ocean.",),
    Movie(title: "ThunderBolts*", year: "2025", rating: 0.0, imagePath: "assets/images/comingsoon/cm2.jpg", rated: "PG-13",
      runtime: "2h 1m",
      country: "USA",
      description: "A group of antiheroes are caught in a deadly trap by Valentina Allegra de Fontaine and are forced into a dangerous mission that could bring them redemption if they unite as a team.",),
    Movie(title: "Final Destination", year: "2025", rating: 0.0, imagePath: "assets/images/comingsoon/cm3.jpg", rated: "PG-13",
      runtime: "1h 8m",
      country: "USA",
      description: "A college student experiencing a recurring nightmare that foretells her family's demise returns home to find the person who can prevent it.",),
    Movie(title: "Karate Kid: Legends", year: "2025", rating: 0.0, imagePath: "assets/images/comingsoon/cm4.webp",  rated: "PG-13",
      runtime: "2h 28m",
      country: "USA",
      description: "Karate Kid: Legends is an upcoming American martial arts drama film directed by Jonathan Entwistle and written by Rob Lieber.",),
    // Add more...
  ];

  Widget buildSection(String title, List<Movie> movies, int crossAxisCount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.orange,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: movies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) => MovieCard(movie: movies[index]),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = getCrossAxisCount(width);

    return Scaffold(
      backgroundColor: AppColors.greyDarker,
      appBar: AppBar(
        title: const Text("Movies", style: TextStyle(color: Color.fromARGB(255, 255, 251, 248))),
        backgroundColor: AppColors.greyDark,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection("Popular Movies", popularMovies, crossAxisCount),
            buildSection("Fan Favourites", fanFavourites, crossAxisCount),
            buildSection("Coming Soon Movies", comingSoon, crossAxisCount),
          ],
        ),
      ),
    );
  }
}
