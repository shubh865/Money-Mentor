class ResponseData {
  bool error;
  Data data;

  ResponseData({required this.error, required this.data});

  factory ResponseData.fromMap(Map<String, dynamic> map) {
    return ResponseData(
      error: map['error'],
      data: Data.fromMap(map['data']),
    );
  }
}

class Data {
  num currentMonthlyExpense;
  num futureMonthlyExpenseStart;
  num futureMonthlyExpenseEnd;
  num totalCorpus;
  List<FutureExpense> futureExpenses;
  List<PredictCorpusCurrentHealthCondition> currentHealthConditions;
  List<FutureDisease> futureDiseases;
  num totalHealthCorpus;
  num finalCorpus;

  Data({
    required this.currentMonthlyExpense,
    required this.futureMonthlyExpenseStart,
    required this.futureMonthlyExpenseEnd,
    required this.totalCorpus,
    required this.futureExpenses,
    required this.currentHealthConditions,
    required this.futureDiseases,
    required this.totalHealthCorpus,
    required this.finalCorpus,
  });

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      currentMonthlyExpense: map['current_monthly_expense'],
      futureMonthlyExpenseStart: map['future_monthly_expense_start'],
      futureMonthlyExpenseEnd: map['future_monthly_expense_end'],
      totalCorpus: map['total_corpus'],
      futureExpenses: List<FutureExpense>.from(
          map['future_expenses'].map((x) => FutureExpense.fromMap(x))),
      currentHealthConditions: List<PredictCorpusCurrentHealthCondition>.from(
          map['current_health_conditions']
              .map((x) => PredictCorpusCurrentHealthCondition.fromMap(x))),
      futureDiseases: List<FutureDisease>.from(
          map['future_diseases'].map((x) => FutureDisease.fromMap(x))),
      totalHealthCorpus: map['toatl_health_corpus'],
      finalCorpus: map['final_corpus'],
    );
  }
}

class FutureExpense {
  String name;
  num currentExpense;
  num inflationRate;
  num futureExpenseStart;
  num categoryTotal;
  num futureExpenseEnd;

  FutureExpense({
    required this.name,
    required this.currentExpense,
    required this.inflationRate,
    required this.futureExpenseStart,
    required this.categoryTotal,
    required this.futureExpenseEnd,
  });

  factory FutureExpense.fromMap(Map<String, dynamic> map) {
    return FutureExpense(
      name: map['name'],
      currentExpense: map['current_expense'],
      inflationRate: map['inflation_rate'],
      futureExpenseStart: map['future_expense_start'],
      categoryTotal: map['category_total'],
      futureExpenseEnd: map['future_expense_end'],
    );
  }
}

class FutureDisease {
  String diseaseName;
  String surgeryName;
  num cost;
  num inflationConsideredCost;
  num healthInflationRate;

  FutureDisease({
    required this.diseaseName,
    required this.surgeryName,
    required this.cost,
    required this.inflationConsideredCost,
    required this.healthInflationRate,
  });

  factory FutureDisease.fromMap(Map<String, dynamic> map) {
    return FutureDisease(
      diseaseName: map['disease name'],
      surgeryName: map['surgery name'],
      cost: map['cost'],
      inflationConsideredCost: map['inflation_considered_cost'],
      healthInflationRate: map['health_inflation_rate'],
    );
  }
}

class PredictCorpusCurrentHealthCondition {
  String diseaseName;
  String experiencingFrom;

  PredictCorpusCurrentHealthCondition({
    required this.diseaseName,
    required this.experiencingFrom,
  });

  factory PredictCorpusCurrentHealthCondition.fromMap(Map<String, dynamic> map) {
    return PredictCorpusCurrentHealthCondition(
      diseaseName: map['disease_name'],
      experiencingFrom: map['experiencing_from'],
    );
  }
}
