class User {
  List<CurrentExpense>? currentExpenses;
  int? age;
  int? retirementAge;
  int? currentMonthlyExpense;
  List<CurrentHealthCondition>? currentHealthConditions;

  User({
    this.currentExpenses,
    this.age,
    this.retirementAge,
    this.currentMonthlyExpense,
    this.currentHealthConditions,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      currentExpenses: map['currentExpenses'] != null
          ? List<CurrentExpense>.from(
              map['currentExpenses'].map((x) => CurrentExpense.fromMap(x)))
          : [],
      age: map['age'],
      retirementAge: map['retirementAge'],
      currentMonthlyExpense: map['currentMonthlyExpense'],
      currentHealthConditions: map['currentHealthConditions'] != null
          ? List<CurrentHealthCondition>.from(map['currentHealthConditions']
              .map((x) => CurrentHealthCondition.fromMap(x)))
          : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currentExpenses': currentExpenses?.map((x) => x.toMap()).toList() ?? [],
      'age': age,
      'retirementAge': retirementAge,
      'currentMonthlyExpense': currentMonthlyExpense,
      'currentHealthConditions':
          currentHealthConditions?.map((x) => x.toMap()).toList() ?? [],
    };
  }
}

class CurrentExpense {
  String? name;
  int? expense;
  String? category;

  CurrentExpense({
    this.name,
    this.expense,
    this.category,
  });

  factory CurrentExpense.fromMap(Map<String, dynamic> map) {
    return CurrentExpense(
      name: map['name'],
      expense: map['expense'],
      category: map['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'expense': expense,
      'category': category,
    };
  }
}

class CurrentHealthCondition {
  String? diseaseName;
  String? experiencingFrom;

  CurrentHealthCondition({
    this.diseaseName,
    this.experiencingFrom,
  });

  factory CurrentHealthCondition.fromMap(Map<String, dynamic> map) {
    return CurrentHealthCondition(
      diseaseName: map['diseaseName'],
      experiencingFrom: map['experiencingFrom'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'diseaseName': diseaseName,
      'experiencingFrom': experiencingFrom,
    };
  }
}
