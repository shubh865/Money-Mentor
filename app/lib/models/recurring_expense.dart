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
      currentExpenses: map['current_expenses'] != null
          ? List<CurrentExpense>.from(
              map['current_expenses'].map((x) => CurrentExpense.fromMap(x)))
          : [],
      age: map['age'],
      retirementAge: map['retirement_age'],
      currentMonthlyExpense: map['current_monthly_expense'],
      currentHealthConditions: map['current_health_conditions'] != null
          ? List<CurrentHealthCondition>.from(map['current_health_conditions']
              .map((x) => CurrentHealthCondition.fromMap(x)))
          : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_expenses':
          currentExpenses?.map((x) => x.toMap())?.toList() ?? [],
      'age': age,
      'retirement_age': retirementAge,
      'current_monthly_expense': currentMonthlyExpense,
      'current_health_conditions':
          currentHealthConditions?.map((x) => x.toMap())?.toList() ?? [],
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
    String category;
    if (name?.toLowerCase() == 'grocery') {
      category = 'food_and_beverages';
    } else if (name?.toLowerCase().startsWith('gas') == true ||
        name?.toLowerCase().startsWith('electricity') == true) {
      category = 'fuel_and_light';
    } else {
      category = 'inflation_rate';
    }

    return {
      'name': name?.toLowerCase(),
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
      diseaseName: map['disease_name'],
      experiencingFrom: map['experiencing_from'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'disease_name': diseaseName,
      'experiencing_from': experiencingFrom,
    };
  }
}
