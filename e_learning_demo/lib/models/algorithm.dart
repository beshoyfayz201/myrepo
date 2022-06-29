import 'package:e_learning_demo/models/exam_model.dart';
import 'package:e_learning_demo/models/question.dart';
import 'package:e_learning_demo/models/topic.dart';

class Algorithm {
  Algorithm(
      {required this.title,
      required this.last, //inform the last step in algorithm
      required this.intro,
      required this.stops, //where to start exam
      required this.topics, //sub topics inside our main algorithm
      required this.mainNotes,
      required this.quests,
      required this.path,
      required this.examModel

      //notes inside expansion panels
      });
  final String path;
  final String title;
  final String intro;
  final List<Topic> topics;
  final List<Topic> mainNotes;
  final List<int> stops;
  final List<Question> quests;
  int last;
  ExamModel examModel;

  Map<String, dynamic> getMap() {
    return {
      "title": this.title,
      "intro": this.intro,
    };
  }
}

Algorithm naiveAlgorithm = Algorithm(
    title: "Naive Algorithm",
    path: "assets/rivs/na.riv",
    last: 7,
    intro:
        "Naive algorithm for Pattern Searching Given a text txt[0..n-1] and a pattern pat[0..m-1], write a function search(char pat[], char txt[]) that prints all occurrences of pat[] in txt[]. You may assume that n > m.",
    stops: [3, 5, 6],
    topics: [
      const Topic(
          subtitle: "Example",
          txt:
              "Input: txt[] = THIS IS A TEST TEXT\npat[] = \"TEST\"\nOutput: Pattern found at index 10\nInput: txt[] = \"AATAACAAGAATAATA\"\npat[] = \"AATA\"\nOutput: Pattern found at index 0\nPattern found at index 9\nPattern found at index 12"),
      const Topic(
          subtitle: "Code analysis",
          txt:
              "Algorithm NaiveStringMatch(S,P,n,m)begin\n\n for k= 1 to n − m + 1  do\n if P = S[k, k + m − 1] then \n output(k) end for \nend\n Analysis. The if statement in the algorithm takes (up to) m atomic comparisons of the form P[i]? = S[k+i−1] to perform. The for loop repeats n−m+ 1 times. Therefore the running time of this algorithm is O((n − m + 1) · m) =O(nm − m2 + m) = O(nm). Note, that is m =n2, then O(nm) = O(n2), so the in the worst-case, the na¨ıve algorithm is quadratic in the length of the inputstring S.")
    ],
    mainNotes: [
      const Topic(
          subtitle: "the best case :",
          txt:
              "The best case occurs when the first character of the pattern is not present in text at all.The number of comparisons in best case is O(n)."),
      const Topic(
          subtitle: "the worst case :",
          txt:
              "The worst case is when both, pattern and string have the same form ( P = am and T= an ) because it is a must to check m characters n-m+1 times. This leads to worst-case running time O((n-m+1)m) and this is tight upper bound.")
    ],
    quests: [
      Question(
          q: "which pattern matches this reigon <ATG>",
          answers: ["TAC", "AGC", "ATG"],
          ansIndex: 2,
          why: "in matching we simple compare each charcter with its opposite"),
      // Question(

      Question(
          q: "is this reigon  \"CCG\"  matches \"GCG\"?",
          answers: ["true", "false"],
          ansIndex: 1,
          why: "look carefully to the animation"),

      Question(
          q: "if the sequence=ATCCATCC\nand the pattern=CCA then where is the matching index",
          answers: ["0", "5", "2"],
          ansIndex: 2,
          why: "we count the index incrementally then when we found a match the answer would be the first character of the reigon that matches the pattern"),

      // Question(
      //     q: "Which of the following is a sub string of \"ATGGGCGCG\"  ?",
      //     answers: ["ATC", "CGC", "AGT"],
      //     ansIndex: 1),
    ],
    examModel: naiveExam);
Algorithm huffman = Algorithm(
    title: "Huffman Algorithm ",
    path: "assets/rivs/hm.riv",
    last: 17,
    intro:
        "Huffman coding is a lossless data compression algorithm. The idea is to assign variable-length codes to input characters, lengths of the assigned codes are based on the frequencies of corresponding characters. The most frequent character gets the smallest code and the least frequent character gets the largest code.\nThe variable-length codes assigned to input characters are Prefix Codes, means the codes (bit sequences) are assigned in such a way that the code assigned to one character is not the prefix of code assigned to any other character. This is how Huffman Coding makes sure that there is no ambiguity when decoding the generated bitstream.\n\n    why huffman algorithm was created and when its used??\nthe problem of finding the most efficient binary code using a frequency-sorted binary tree and quickly proved this method the most efficient.\nThey are used for transmitting fax and text.\nThey are used by conventional compression formats like PKZIP, GZIP, etc.\nIt is useful in cases where there is a series of frequently occurring characters.\n after reading this if you are intersted to learn the algorithm you can follow the steps",
    stops: [3, 4, 6, 10, 11, 16],
    topics: [
      const Topic(
          subtitle: "Steps to build Huffman Tree",
          txt:
              "Input is an array of unique characters along with their frequency of occurrences and output is Huffman Tree.\n\n 1-Create a leaf node for each unique character and build a min heap of all leaf nodes (Min Heap is used as a priority queue. The value of frequency field is used to compare two nodes in min heap. Initially, the least frequent character is at root)\n\n 2-Extract two nodes with the minimum frequency from the min heap.\n\n 3-Create a new internal node with a frequency equal to the sum of the two nodes frequencies. Make the first extracted node as its left child and the other extracted node as its right child. Add this node to the min heap.\n\n  4-Repeat steps#2 and #3 until the heap contains only one node. The remaining node is the root node and the tree is complete.\n\nnow watch and learn:"),
      const Topic(subtitle: " ", txt: " ")
    ],
    mainNotes: [
      const Topic(
          subtitle: "important defination",
          txt:
              "1- Huffman run-length encoding: is blocking happen when the probability of a symbol exceeds 2^−1=0.5, making the upper limit of inefficiency unbounded\n\n2-according to Alex Vinokur's when the distribution of frequencies follows the Fibonacci numbers."),
      const Topic(
          subtitle: "Huffman Coding Complexity",
          txt:
              "The time complexity for encoding each unique character based on its frequency is O(nlog n).\nExtracting minimum frequency from the priority queue takes place 2*(n-1) times and its complexity is O(log n). Thus the overall complexity is O(nlog n).\n")
    ],
    quests: [
      Question(
          q: "how many C in the sequence?\n\nGTTCTGCTACCTTTTGCGCGCGCGCGAAC",
          answers: ["10", "5", "9"],
          ansIndex: 0,
          why: "just count the number of C character in the string"),
      Question(
          q: "now tell me how many A in the sequence?\n\nGTTCTGCTACCTTTTGCGCGCGCGCGAAC",
          answers: ["2", "3", "4"],
          ansIndex: 1,
          why: "just count the number of A character in the string"),
      Question(
          q: "can you order this results in descending order\n[G=8,T=8,C=10,A=3]",
          answers: ["GTAC", "CTGA", "AGTC"],
          ansIndex: 1,
          why: "just count the number of A character in the string"),
      Question(
          q: "tell me which one will take 0 and 1?",
          answers: ["AG->0\nT->1", "AG->1\nT->0", "AG->0\nT->0"],
          ansIndex: 1,
          why: "always remember the biger one takes 1 and the smaller takes 0"),
      Question(
          q: "if AGT=19 & C=10 ,what would be the result of  AGTC ",
          answers: ["30", "9", "29"],
          ansIndex: 2,
          why: "we just sum the smaller node with the rest each time"),
      Question(
          q: "follow the A path then tell me if the answer is 110",
          answers: ["true", "false"],
          ansIndex: 0,
          why:
              "remeber that we go from top to down nodes gathering the zeros and ones"),
    ],
    examModel: huffmanExam);

Algorithm kmpAlgorithm = Algorithm(
    title: "KMP Algorithm",
    path: "assets/rivs/kmp.riv",
    last: 2,
    intro:
        "a linear time algorithm for the string matching problem\nGiven a text txt[0..n-1] and a pattern pat[0..m-1], write a function search(char pat[], char txt[]) that prints all occurrences of pat[] in txt[]. You may assume that n > m.",
    stops: [],
    topics: [
      const Topic(
          subtitle: "Example",
          txt:
              "Input: txt[] = THIS IS A TEST TEXT\npat[] = \"TEST\"\nOutput: Pattern found at index 10\nInput: txt[] = \"AATAACAAGAATAATA\"\npat[] = \"AATA\"\nOutput: Pattern found at index 0\nPattern found at index 9\nPattern found at index 12"),
      const Topic(
          subtitle: "Preprocessing Algorithm",
          txt:
              "In the preprocessing part, we calculate values in lps[]. To do that, we keep track of the length of the longest prefix suffix value (we use len variable for this purpose) for the previous index. We initialize lps[0] and len as 0. If pat[len] and pat[i] match, we increment len by 1 and assign the incremented value to lps[i]. If pat[i] and pat[len] do not match and len is not 0, we update len to lps[len-1].")
    ],
    mainNotes: [
      const Topic(
          subtitle: "the best case :",
          txt:
              "The best case occurs when the string you are looking for is located just at the beginning of your text string. "),
      const Topic(
          subtitle: "the worst case :",
          txt:
              "the worst case Knuth-Morris-Pratt algorithm occurs when we have to examine all the characters in the text and pattern at least once.")
    ],
    quests: [
      Question(
          q: "what is the index of the match patern in the text",
          answers: ["4", "1", "3"],
          ansIndex: 2,
          why:
              "we count the index incrementally then when we found a match the answer would be the first character of the reigon that matches the pattern")
    ],
    examModel: naiveExam);

Algorithm suffixArrayAlgorithm = Algorithm(
    title: "Suffix Array",
    path: "assets/rivs/suffix.riv",
    last: 16,
    intro:
        "A suffix array is a sorted array of all suffixes of a given string. The definition is similar to Suffix Tree which is compressed trie of all suffixes of the given text. Any suffix tree based algorithm can be replaced with an algorithm that uses a suffix array enhanced with additional information and solves the same problem in the same time complexity A suffix array can be constructed from Suffix tree by doing a DFS traversal of the suffix tree. In fact Suffix array and suffix tree both can be constructed from each other in linear time. \n\nAdvantages of suffix arrays over suffix trees include improved space requirements, simpler linear time construction algorithms (e.g., compared to Ukkonen’s algorithm) and improved cache locality",
    stops: [5, 7, 13],
    topics: [
      const Topic(
          subtitle: "Example",
          txt:
              "Let the given string be \"banana\". \n\n0 banana                          5 a\n\n1 anana     Sort the Suffixes     3 ana\n\n2 nana      ---------------->     1 anana \n\n3 ana        alphabetically       0 banana  \n\n4 na                              4 na   \n\n5 a                               2 nana\n\nSo the suffix array for \"banana\" is {5, 3, 1, 0, 4, 2}"),
      const Topic(
          subtitle: "Search a pattern using the built Suffix Array",
          txt:
              "To search a pattern in a text, we preprocess the text and build a suffix array of the text. Since we have a sorted array of all suffixes, Binary Search can be used to search. Following is the search function. Note that the function doesn’t report all occurrences of pattern, it only report one of them.")
    ],
    mainNotes: [
      const Topic(
          subtitle: "Algorithm Complexty :",
          txt:
              "Time Complexity: O(mlogn) \n\nAuxiliary Space: O(m+n)\n\n There are more efficient algorithms to search pattern once the suffix array is built. In fact there is a O(m) suffix array based algorithm to search a pattern. We will soon be discussing efficient algorithm for search."),
      const Topic(
          subtitle: "Applications of Suffix Array:",
          txt:
              "Array Suffix array is an extremely useful data structure, it can be used for a wide range of problems. Following are some famous problems where Suffix array can be used. \n\n1) Pattern Searching \n\n2) Finding the longest repeated substring \n\n3) Finding the longest common substring \n\n4) Finding the longest palindrome in a string")
    ],
    quests: [
      Question(
          q: "what is fourth suffix of <GCATCGC>",
          answers: ["ATCGC", "TCGC", "CGC"],
          ansIndex: 2,
          why:
              "remeber that suffix is substring at the end of string of charcters"),
      Question(
          q: "what is sixth suffix of <GCATCGC>",
          answers: ["TCGC", "CGC", "GC"],
          ansIndex: 2,
          why:
              "remeber that suffix is substring at the end of string of charcters"),
      Question(
          q: "what is the following suffix ?",
          answers: ["CGC", "TCGC", "GC"],
          ansIndex: 0,
          why: "we sort the suffixes alphabetically !")
    ],
    examModel: suffixExamModel);
List? allData;
