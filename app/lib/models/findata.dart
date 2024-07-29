class Modules {
  final String title;
  final String description;
  final String module;
  final String translate;

  Modules({
    required this.title,
    required this.description,
    required this.module,
    required this.translate,
  });

  static final List<Modules> modules = [
    Modules(
      title: "Introduction to Stock Market",
      description: "The stock market can play a pivotal role in ensuring your financial security. In this module, you will learn how to get started in the stock market, its fundamentals, how it functions, and the various intermediaries that appertain it.",
      module: "View Module",
      translate: "Translate हिंदी"
    ),
    Modules(
      title: "Technical Analysis",
      description: "Technical Analysis (TA) helps in developing a point of view. In this module, we will discover the complex attributes, various patterns, indicators, and theories of TA that will help you as a trader to find upright trading opportunities in the market..",
      module: "View Module",
      translate: "Translate हिंदी"
    ),
    Modules(
      title: "Fundamental Analysis",
      description: "The Fundamental Analysis (FA) module explores Equity research by reading financial statements and annual reports, calculating and analyzing Financial Ratios, and evaluating the intrinsic value of a stock to find long-term investing opportunities.",
      module: "View Module",
      translate: "Translate हिंदी"
    ),
    Modules(
      title: "Futures Trading",
      description: "Futures Trading is a segment of the derivatives market. This module covers the various intricacies involved in undergoing a futures trade, including margins, leverages, pricing, etc. It also discusses the use of derivatives for hedging purposes..",
      module: "View Module",
      translate: "Translate हिंदी"
    ),
    Modules(
      title: "Options Theory for Professional Trading",
      description: "Options Trading is a segment of the derivatives segment. Options contracts grant the buyer the right to buy/sell the underlying without a compulsory obligation. This module discusses options contracts, pricing, and their profit and loss payoffs.",
      module: "View Module",
      translate: "Translate हिंदी"
    ),
  ];
}
