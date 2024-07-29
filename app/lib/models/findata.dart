import 'package:bob_hacks/constants/image_constants.dart';

class Modules {
  final String title;
  final String description;
  final String module;
  final String translate;
  final String chapters;

  Modules({
    required this.title,
    required this.description,
    required this.module,
    required this.translate,
    required this.chapters,
  });

  static final List<Modules> modules = [
    Modules(
      chapters: "5 chapters",
      title: "Introduction to Stock Market",
      description: "The stock market can play a pivotal role in ensuring your financial security. In this module, you will learn how to get started in the stock market, its fundamentals, how it functions, and the various intermediaries that appertain it.",
      module: "View Module",
      translate: "Translate हिंदी",
    ),
    Modules(
      chapters: "4 chapters",
      title: "Technical Analysis",
      description: "Technical Analysis (TA) helps in developing a point of view. In this module, we will discover the complex attributes, various patterns, indicators, and theories of TA that will help you as a trader to find upright trading opportunities in the market..",
      module: "View Module",
      translate: "Translate हिंदी"
    ),
    Modules(
      chapters: "3 chapters",
      title: "Fundamental Analysis",
      description: "The Fundamental Analysis (FA) module explores Equity research by reading financial statements and annual reports, calculating and analyzing Financial Ratios, and evaluating the intrinsic value of a stock to find long-term investing opportunities.",
      module: "View Module",
      translate: "Translate हिंदी"
    ),
    Modules(
      chapters: "6 chapters",
      title: "Futures Trading",
      description: "Futures Trading is a segment of the derivatives market. This module covers the various intricacies involved in undergoing a futures trade, including margins, leverages, pricing, etc. It also discusses the use of derivatives for hedging purposes..",
      module: "View Module",
      translate: "Translate हिंदी"
    ),
    Modules(
      chapters: "4 chapters",
      title: "Options Theory for Professional Trading",
      description: "Options Trading is a segment of the derivatives segment. Options contracts grant the buyer the right to buy/sell the underlying without a compulsory obligation. This module discusses options contracts, pricing, and their profit and loss payoffs.",
      module: "View Module",
      translate: "Translate हिंदी"
    ),
  ];
}
