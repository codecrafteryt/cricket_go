
import 'package:cricket_go/utils/extensions/extentions.dart';
import 'package:cricket_go/utils/values/my_color.dart';
import 'package:cricket_go/view/facts/fact6_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/values/style.dart' show kSize14DarkW400Text;
import '../widgets/custom_appbar.dart';

class Fact5Screen extends StatelessWidget {
  Fact5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CustomAppBar(
                  title: 'Cricket\nGo!',
                ),
                20.sbh,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 378.w,
                    height: 363.h,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.53),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: const Color.fromRGBO(103, 118, 86, 1),
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left Arrow
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: // Left Arrow (flipped right arrow)
                            Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(3.1416),
                              child: Image.asset(
                                'assets/images/rarrow.png',
                                width: 40.w,
                                height: 40.h,
                              ),
                            ),
                          ),

                          // Center Image
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Image.asset(
                                'assets/images/fact5.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          // Right Arrow
                          GestureDetector(
                            onTap: () {
                              Get.to(() => Fact6Screen());
                            },
                            child: Image.asset(
                              'assets/images/rarrow.png',
                              width: 40.w,
                              height: 40.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                10.sbh,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 378.w,
                    height: 363.h,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.53),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: const Color.fromRGBO(103, 118, 86, 1),
                        width: 2,
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Gambling films will definitely keep you in suspense from the beginning to the end credits. The main characters often find themselves in seemingly hopeless situations and bet everything on their winnings. Often, Hollywood directors take real stories as the basis for their films. Therefore viewers can enjoy a dynamic drama or comedy following the characters in life. So, why do real events casino films are of special interest? The reason is on the surface! They offer realistic plots and intense gambling scenes. Besides, we adore the luxury atmosphere and opportunities that seem limitless. Moreover, a real human's life is often at stake here. Let's get acquainted with the best casino films to feel their special atmosphere! American Hustle (2013) Directed By David O. Russell In the story, a professional fraudster named Irving Rosenfeld, along with his lover, is forced to work with the FBI. Emotional agent Richard Di Maso, played by Bradley Cooper, entangles them in the dangerous world of the mafia. Now, their life takes on new colors. They face the most famous bandits, corrupt politicians, and professional agents. Do you want to get bright emotions without encountering dangers? Gamblorium experts will help you choose the best online casino and give you some working tips for real money games. The main team's author, Nodar Giorgadze, says that even when using the best strategies, it is important to approach the game responsibly and not perceive gambling as an income source. So, American Hustle will offer you top examples of manipulation, the temptation of big money, luxury, and much more. To get rich, the characters constantly practice unexpected and risky things in the casino. Critics praised the cast and called it impeccable. They also noted that this film clearly shows one of the most dynamic directions of David Russell. The Man Who Broke the Bank at Monte Carlo (1935) Directed By Stephen Roberts In 1935, the 20th Century Fox film studio became interested in the story of Joseph Jagger and made a romantic comedy starring Colin Clive, Ronald Colman, and Joan Bennett. This is one of the first Hollywood films about casinos and roulette. Joseph Jagger worked as an engineer at a cotton mill in Halifax and visited casinos in his free time. In 1873, Joseph realized that the combination of numbers appearing on a roulette wheel was not random. Therefore, the man came up with an interesting plan, following which he can win. He had 6 assistants who wrote down these numbers. In 1975, Jagger became fantastically rich. He went down in history as one of the first to beat roulette. Casino (1995) Directed By Martin Scorsese Martin Scorsese's dramatic thriller tells the story of the first bookmaker in Las Vegas, Frank Rosenthal, and Chicago mafioso Anthony Spilotro. Like most directors, Scorsese mixed fact and fiction. This film depicts Rosenthal's connections to the underworld through his childhood friend Spilotro. The duo ran four illegal and unlicensed casinos in the 1970s and endured trials of love, murder, revenge, marriage, and adultery. It's also a stunning tale of how the mafia eventually lost control of the money bank. So if for some reason you haven't watched Casino yet, do it now! You will be amazed by the criminal origin story of Las Vegas. Moreover, you will definitely be pleased with the fantastic cast - Sharon Stone, Robert De Niro, Joe Pesci and James Woods. Molly's Game (2017) Directed By Aaron Sorkin Molly's Games is a film about one brave and pragmatic girl. Molly Bloom managed to organize the largest underground poker club in California. The most famous world celebrities became clients of the establishment, including actors Leonardo DiCaprio, Macaulay Culkin, and Ben Affleck. The film is based on the real-life story of Molly Bloom, known as Poker Princess. It all starts with her failing to qualify for the Winter Olympics. She was a professional skier. After the absurd accident, she moves to Los Angeles, where she begins to take part in organizing poker tournaments for very rich people. As a result, she registered her company - Molly Bloom Inc. The screenwriter described a unique heroine who was engaged in an illegal business, but at the same time, she tried to remain honest in a very deceitful world. Maverick (1994) Directed By Richard Donner The main character, starred by Mel Gibson, is an avid gambler and a clever swindler from the Wild West who needs to get the money to participate in a major poker championship. So, classic Western adventures await him. Maverick is a remake of the TV series of the same name, which aired from 1957 to 1962. This is one of many attempts to restart a successful series on the big screen. The film with Gibson collected a decent box office, good reviews, and received an Oscar nomination for Best Costumes. 21 (2008) Directed By Robert Luketic Experienced players know that 21 is the maximum number of blackjack points. This is one of the most popular games in the world, and its winners are either random lucky ones or those who know mathematics well and can count cards. 21 is inspired by a true story, and the amazing cast with Kate Bosworth and Kevin Spacey makes it even more interesting. The film is based on Ben Mezrich's popular science book - Bringing Down the House: The Inside Story of Six M.I.T. Students Who Took Vegas for Millions. The plot centers on a group of students who frequently visit the casino and show extraordinary mathematical abilities using the technique of counting cards in blackjack. Are These Movies Worth Your Attention? Sure, they are! These films show us casino luxury and masterful card tricks! Meanwhile, their characters compete for money, power, and their life. Thus, choose a classic card drama or a movie full of crime intrigues - look into the gambling world and feel the adrenaline with every card deal.",
                        style: kSize14DarkW400Text.copyWith(
                          fontSize: 12,
                          color: MyColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
