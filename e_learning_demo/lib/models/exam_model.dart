import 'package:e_learning_demo/models/question.dart';

class ExamModel {
  List<Question> quests;
  List<int>? score = List.generate(20, (i) => 4);
  ExamModel({required this.quests});
}
//

ExamModel naiveExam = ExamModel(quests: [
  Question(
    q: "If the length of the pattern is x and the length of the text is y, the maximum possible number of character comparisons performed by the naive exact matching algorithm is:",
    answers: ["x + y", "y - x + 1", "x(y - x + 1)"],
    ansIndex: 3,
    why: " ",
  ),
  Question(
    q: "If the length of the pattern is x and the length of the text is y, the minimum possible number of character comparisons performed by the naive exact matching algorithm is:",
    answers: ["y - x + 1", "x(y - x + 1)", "xy"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "seq = 'ACTTGGAACC', pattern = 'ACT' - Pattern found at index:",
    answers: ["0", "7", "5"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "What is the time complexity for string matching having string size m and main string length N using Naïve approach?",
    answers: ["O(m*n)", "O(log n)", "O(1)"],
    ansIndex: 0,
    why:
        "It checks for all characters in the main string. There will be no pre-processing phase is required.",
  ),
  Question(
    q: "The naive pattern searching algorithm is an in place algorithm.",
    answers: ["True", "False"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "text = 'ACTGGGAACCTTTAA' - pattern = 'TGGG' - Pattern found from index ___ to ___",
    answers: ["2:5", "1:4", "4:7"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "Naive algorithm try all possible alignments. for each, check whether it's an occurrence or not.",
    answers: ["True", "False"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "Disadvantages of Naïve String Matching which is that it is inefficient.",
    answers: ["True", "False"],
    ansIndex: 0,
    why:
        "This is because when it has found a position, it does not use it again to find the other position. It goes back to the starting point and looks for the pattern over again. And so, it does not use the information from the previous shift again.",
  ),
  Question(
    q: "Advantages of Naïve Pattern Search: ",
    answers: [
      "There are no pre-processing phases required in the naïve search approach, as its running time is equal to the matching time.",
      "The comparisons of the patterns with the strings can be done in any order.",
      "all of the above"
    ],
    ansIndex: 2,
    why: " ",
  ),
  Question(
    q: "Disadvantages of Naïve String Matching",
    answers: [
      "There is no extra operating space needed.",
      "The comparisons of the patterns with the strings can be done in any order.",
      "it is inefficient."
    ],
    ansIndex: 2,
    why:
        "This is because when it has found a position, it does not use it again to find the other position. It goes back to the starting point and looks for the pattern over again. And so, it does not use the information from the previous shift again.",
  ),
  Question(
    q: "How can we optimize naive string-matching algorithms?",
    answers: ["String database search", "Tries", "all of the above"],
    ansIndex: 2,
    why: " ",
  ),
  Question(
    q: "Which is the top features of the naive algorithm",
    answers: [
      "It is the simplest method among all to look for patterns in an input text.",
      "It finds the exact string matches",
      "all of the above"
    ],
    ansIndex: 2,
    why: " ",
  ),
  Question(
    q: "The best case occurs when: ",
    answers: [
      "the first character in the pattern text is nowhere in the input string.",
      "When all the characters in the pattern are the same as those in the input string",
      "none of the above"
    ],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "Worst Case of Naïve Pattern Search",
    answers: ["O(m*(n-m+1))", "O(1)", "O(n)"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "Best Case of Naïve Pattern Search",
    answers: ["O(n)", "O(1)", "none of the above"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "Naïve pattern searching is the simplest method among other pattern searching algorithms",
    answers: ["True", "False"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "This algorithm is helpful for smaller texts.",
    answers: ["True", "False"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "Main String: 'ABAAABCDBBABCDDEBCABC', pattern: 'ABC' - Pattern found at positions: ",
    answers: ["(4, 10, 18)", "(3, 9, 17)", "none of the above"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "Naive algorithm is an important class of string algorithms that try to find a place where one or several strings (also called patterns) are found within a larger string or text.",
    answers: ["True", "False"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "The naive approach to the string matching problem is walking through the source starting from the beginning and checking at each position if the resulting substring equals the query pattern.",
    answers: ["True", "False"],
    ansIndex: 0,
    why: " ",
  ),
]);

ExamModel huffmanExam = ExamModel(quests : [
  
  Question(
    q: "Which of the following is true about Huffman Coding?",
    answers: ["Huffman coding may become lossy in some cases", "In Huffman coding, no code is prefix of any other code.", "all of the above"],
    ansIndex: 1,
    why: " ",
  ),
  Question(
    q: "The characters a to h have the set of frequencies based on the first 8 Fibonacci numbers as follows:\n\na : 1, b : 1, c : 2, d : 3, e : 5, f : 8, g : 13, h : 21\n\nA Huffman code is used to represent the characters. What is the sequence of characters corresponding to the following code?\n\n110111100111010",
    answers: ["fdheg", "ecgdf", "dchfg"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: " A networking company uses a compression technique to encode the message before transmitting over the network. Suppose the message contains the following characters with their frequency:\n\na : 5, b : 9, c : 12, d : 13, e : 16, f : 45\n\nNote that each character in input message takes 1 byte.\n\nIf the compression technique used is Huffman Coding, how many bits will be saved in the message?",
    answers: ["224", " 800", "576"],
    ansIndex: 1,
    why: "",
  ),
  Question(
    q: "How many printable characters does the ASCII character set consists of?",
    answers: ["120", "128", "100"],
    ansIndex: 2,
    why: "Out of 128 characters in an ASCII set, roughly, only 100 characters are printable while the rest are non-printable. ",
  ),
  Question(
    q: "How many bits are needed for standard encoding if the size of the character set is X?",
    answers: ["log X", " X+1", "2X"],
    ansIndex: 0,
    why: " If the size of the character set is X, then [log X] bits are needed for representation in a standard encoding.",
  ),
  Question(
    q: "What is the running time of the Huffman encoding algorithm?",
    answers: ["O(C log C)", " O( N log C)", "O(log C)"],
    ansIndex: 0,
    why: "If we maintain the trees in a priority queue, ordered by weight, then the running time is given by O(C log C). ",
  ),
  Question(
    q: "In Huffman coding, data in a tree always occur?",
    answers: ["roots", "leaves", "left sub trees"],
    ansIndex: 1,
    why: "In Huffman encoding, data is always stored at the leaves of a tree inorder to compute the codeword effectively ",
  ),
  Question(
    q: "The type of encoding where no character code is the prefix of another character code is called?",
    answers: ["optimal encoding", "prefix encoding", "frequency encoding"],
    ansIndex: 1,
    why: "Even if the character codes are of different lengths, the encoding where no character code is the prefix of another character code is called prefix encoding. ",
  ),
  Question(
    q: "The variable-length codes assigned to input characters are ?",
    answers: ["suffix code", "prefix code", "affix code"],
    ansIndex: 1,
    why: " ",
  ),
  Question(
    q: "in Huffman coding The most frequent character gets the largest code and the least frequent character gets the smallest code.",
    answers: ["True", "False"],
    ansIndex: 1,
    why: " ",
  ),
  Question(
    q: "Huffman Coding makes sure that there is no ambiguity when decoding the generated bitstream.",
    answers: ["True", "False"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "Huffman algorithm was created and used for ?",
    answers: ["transmitting fax and text.", "used by conventional compression formats like PKZIP, GZIP, etc.", "all of the above"],
    ansIndex: 2,
    why: " ",
  ),
  Question(
    q: "Huffman coding is useful in cases where there is ?",
    answers: ["a pattern needs to be found in a text ", "a alot of pathes and we need to find the shortest one", "a series of frequently occurring characters"],
    ansIndex: 2,
    why: " ",
  ),
  Question(
    q: "what of these is not a part in Huffman coding",
    answers: ["Build a Huffman Tree from input characters.", "Build a Huffman list from input characters.", "Traverse the Huffman Tree and assign codes to characters."],
    ansIndex: 1,
    why: " ",
  ),
  Question(
    q: "Input is an ... of unique characters along with their frequency of occurrences and output is Huffman .... ",
    answers: ["list , tree", "array , list", "array , tree"],
    ansIndex: 2,
    why: " ",
  ),
  Question(
    q: "number of steps needed to build a huffman tree is ?",
    answers: ["5 steps", "4 steps", "3 steps"],
    ansIndex: 1,
    why: " ",
  ),
  Question(
    q: "the first step of building a huffman tree is Creating a leaf node for each unique character and build a min ... of all leaf nodes",
    answers: ["stack", "heap", "none of the above"],
    ansIndex: 1,
    why: " ",
  ),
  Question(
    q: "the second step of building a huffman tree is Extracting two nodes with the ... frequency from the min ...",
    answers: ["maximum , heap", "minimum ,stack", "minimum , heap"],
    ansIndex: 2,
    why: " ",
  ),
  Question(
    q: "Applications of Huffman Coding: ",
    answers: ["They are used for transmitting fax and text.", "They are used by conventional compression formats like PKZIP, GZIP, etc.", "all of the above"],
    ansIndex: 2,
    why: " ",
  ),
  Question(
    q: "Huffman Coding is useful in cases where there is a series of frequently occurring characters.",
    answers: ["True", "False"],
    ansIndex: 0,
    why: " ",
  ),
  
]);
ExamModel suffixExamModel=ExamModel(quests: [

  Question(
    q: "Which of the following is false?",
    answers: ["Suffix array is always sorted", "Suffix array is used in string matching problems", "Suffix array is always unsorted"],
    ansIndex: 2,
    why: "Suffix array is always sorted as it contains all the suffixes of a string in sorted order. Suffix arrays are used to solve problems related to string, like string matching problems.",
  ),
  Question(
    q: "Suffix array of the string “statistics” is ____________",
    answers: ["2 8 7 4 9 0 5 1 6 3", "2 7 4 9 8 0 5 1 6 3", "2 4 9 0 5 7 8 1 6 3"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "Suffix array can be created by performing __________ traversal of a suffix tree.",
    answers: ["breadth-first", "level order", "depth-first"],
    ansIndex: 2,
    why: "A suffix tree is a trie, which contains all the suffixes of the given string as their keys and positions in the string as their values. So, we can construct a suffix array by performing the depth-first traversal of a suffix tree.",
  ),
  Question(
    q: "Suffix array is space efficient and faster than the suffix tree.",
    answers: ["True", "False"],
    ansIndex: 1,
    why: "Suffix arrays are more space efficient than the suffix trees as they just store the original string and an array of integer. But working with suffix tree is faster than that of the suffix array.",
  ),
  Question(
    q: "If comparison based sorting algorithm is used construct the suffix array, then what will be time required to construct the suffix array?",
    answers: ["O(nlogn)", "O(n^2)", "O(n^2logn)"],
    ansIndex: 2,
    why: "On average comparison based sorting algorithms require O(nlogn) comparisons. But comparing a suffix takes O(n). So, overall time to construct the suffix array will be O(nlogn) * O(n) = O(n^2logn).",
  ),
  Question(
    q: "What will be the suffix array of the string “engineering”?",
    answers: ["5 0 6 1 4 9 1 7 0 2 3 8", "5 0 6 10 2 4 9 1 7 3 8", "5 0 6 10 2 3 8 4 9 1 7"],
    ansIndex: 2,
    why: "Correct choice is : 5 0 6 10 2 3 8 4 9 1 7.\nBecause the suffix array formed will be: 5 eering 0 engineering 6 ering 10 g 2 gineering 3 ineering 8 ing 4 neering 9 ng 1 ngineering 7 ring.",
  ),
  Question(
    q: "LCP array and ______ is used to construct suffix tree.",
    answers: ["Hash tree", "Hash trie", "Suffix array"],
    ansIndex: 2,
    why: "Suffix tree can be created using an LCP array and a suffix array. If we are given a string of length (n + 1) and its suffix array and LCP array, we can construct the suffix tree in linear time i.e in O(n) time.",
  ),
  Question(
    q: "Suffix array can be created in O(nlogn) time.",
    answers: ["True", "False"],
    ansIndex: 0,
    why: "Suffix array can be constructed in O(n^2logn) time using sorting algorithms but it is possible to build the suffix array in O(nlogn) time using prefix doubling.",
  ),
  Question(
    q: "What is the time required to locate the occurrences of a pattern P of length m in a string of length n using suffix array?",
    answers: ["O(nm)", "O(mnlogn)", "O(mlogn)"],
    ansIndex: 2,
    why: "Suffix arrays are used to find the occurrences of a pattern in a string. Pattern of length m will require m characters to compare, so using suffix array we can find occurrences of a pattern in the string of length n in O(mlogn) time.",
  ),
  Question(
    q: "Applications of Suffix Array: ",
    answers: ["Pattern Searching", "Finding the longest common substring", "all of the above"],
    ansIndex: 2,
    why: " ",
  ),
  Question(
    q: "A simple method to construct suffix array is to make an array of all suffixes and then sort the array",
    answers: ["Naive method", "Search a pattern", "none of the above"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "it is a lexicographically sorted array of suffixes of a string s. For example, let's consider a string s = abakan. A word abakan has 6 suffixes {abakan , bakan, akan, kan, an, n}",
    answers: ["Naive", "Suffix Array", "KMP"],
    ansIndex: 1,
    why: " ",
  ),
  Question(
    q: "Suffix arrays is a practical algorithm for finding maximal exact matches in large sequence datasets",
    answers: ["True", "False"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "Suffix array is invented by: ",
    answers: ["Manber & Myers", "John and Langley", "none of the above"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "_______ are suffix arrays with additional tables that reproduce the full functionality of suffix trees preserving the same time and memory complexity.",
    answers: ["Enhanced suffix arrays", "Suffix Trees", "all of the above"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "The suffix array for a subset of all suffixes of a string is called sparse suffix array",
    answers: ["True", "False"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "Finding the longest repeated substring An application of sorting to computational biology and plagiarism detection",
    answers: ["True", "False"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: " Suffix sorting: given a string, sort the suffixes of that string in ascending order. Resulting sorted list is called a _______",
    answers: ["suffix array", "suffix trees", "suffix tries"],
    ansIndex: 0,
    why: " ",
  ),
  Question(
    q: "Methods of Suffix Array: ",
    answers: ["Naive Method", "nLogn Algorithm", "all of the above"],
    ansIndex: 2,
    why: " ",
  ),
  Question(
    q: "Finding the longest palindrome in a string is one of Suffix array applications",
    answers: ["False", "True"],
    ansIndex: 1,
    why: " ",
  ),

]
 );