class ServerException implements Exception {
  final String message;
  ServerException({required this.message});
}

class LoginValidationError implements Exception {
  final String message;
  final String errorCode;

  LoginValidationError({required this.message, required this.errorCode});

  @override
  String toString() {
    return 'LogicValidationError: $message (Error Code: $errorCode)';
  }

  static String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'E4001':
        return 'Authentication mode already used (phone / mail)';
      case 'E4002':
        return 'Authentication credentials not found';
      case 'E4003':
        return 'Password does not match';
      case 'E4004':
        return 'Username already claimed';
      case 'E4005':
        return 'Profile already exists for user';
      default:
        return 'Unknown Logic Validation Error';
    }
  }
}

class ArrayValidationError implements Exception {
  final String message;
  final String errorCode;
  final int? errorIndex;

  ArrayValidationError(
      {required this.message, required this.errorCode, this.errorIndex});

  @override
  String toString() {
    return 'ArrayValidationError: $message (Error Code: $errorCode${errorIndex != null ? ', Index: $errorIndex' : ''})';
  }

  static String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'E3001':
        return 'Empty array';
      case 'E3002':
        return 'Minimum length of array not met';
      case 'E3003':
        return 'Maximum length of array exceeded';
      case 'E3004':
        return 'Array length does not meet the min-max criteria';
      case 'E0005':
        return 'Array elements are invalid';
      default:
        return 'Unknown Array Validation Error';
    }
  }
}

class NumberValidationError implements Exception {
  final String message;
  final String errorCode;

  NumberValidationError({required this.message, required this.errorCode});

  @override
  String toString() {
    return 'NumberValidationError: $message (Error Code: $errorCode)';
  }

  static String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'E2001':
        return '0 entered for a non-zero field';
      case 'E2002':
        return '0 or negative entered for a positive field';
      case 'E2003':
        return '0 or positive entered for a negative field';
      case 'E2004':
        return 'Negative entered for a 0 or positive field';
      case 'E2005':
        return 'Positive entered for a 0 or negative field';
      case 'E2006':
        return 'Min value not met';
      case 'E2007':
        return 'Max value exceeded';
      case 'E2008':
        return 'Min-Max value not met';
      default:
        return 'Unknown Number Validation Error';
    }
  }
}

class StringValidationError implements Exception {
  final String message;
  final String errorCode;
  final int? expectedLength;
  final int? minLength;
  final int? maxLength;

  StringValidationError({
    required this.message,
    required this.errorCode,
    this.expectedLength,
    this.minLength,
    this.maxLength,
  });

  @override
  String toString() {
    return 'StringValidationError: $message (Error Code: $errorCode)';
  }

  static String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'E1001':
        return 'Empty string passed where content expected';
      case 'E1002':
        return 'Exact string length not met';
      case 'E1003':
        return 'Minimum length not met';
      case 'E1004':
        return 'Maximum length of string exceeded';
      case 'E1005':
        return 'Min-Max length of string not met';
      case 'E1006':
        return 'Invalid Email Address';
      case 'E1007':
        return 'Invalid URL';
      case 'E1008':
        return 'Invalid Date Format';
      case 'E1009':
        return 'Invalid Phone Number Format';
      case 'E1010':
        return 'General Regular Expression';
      default:
        return 'Unknown String Validation Error';
    }
  }
}

class IncorrectDataTypeOrUndefinedError implements Exception {
  final String message;
  final String errorCode;
  final String? expectedType;
  final List<String>? allowedValues;
  final List<String>? disallowedValues;

  IncorrectDataTypeOrUndefinedError({
    required this.message,
    required this.errorCode,
    this.expectedType,
    this.allowedValues,
    this.disallowedValues,
  });

  @override
  String toString() {
    return 'IncorrectDataTypeOrUndefinedError: $message (Error Code: $errorCode)';
  }

  static String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'E0001':
        return 'Invalid Data Type';
      case 'E0002':
        return 'Extra parameter not part of expected request';
      case 'E0003':
        return 'Undefined / Null';
      case 'E0004':
        return 'Received value not in a set of allowed values';
      case 'E0005':
        return 'Received value is in a set of disallowed values';
      default:
        return 'Unknown Incorrect Data Type or Undefined Error';
    }
  }
}

class EntityError implements Exception {
  final String message;
  final String errorCode;

  EntityError({required this.message, required this.errorCode});

  @override
  String toString() {
    return 'EntityError: $message (Error Code: $errorCode)';
  }

  static String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'E9001':
        return 'Invalid session ID';
      case 'E9002':
        return 'Invalid verification token';
      case 'E9003':
        return 'Object key does not exist (GET / DELETE)';
      case 'E9004':
        return 'Object already exists (PUT)';
      case 'E9005':
        return 'Object content type / size is invalid';
      case 'E9006':
        return 'Request Does Not Exist';
      case 'E9007':
        return 'Page Profile ID is invalid';
      case 'E9008':
        return 'Personal Profile ID is invalid';
      case 'E9009':
        return 'Skill ID is invalid';
      case 'E9010':
        return 'Industry ID is invalid';
      case 'E9011':
        return 'Education ID is invalid';
      case 'E9012':
        return 'Experience ID is invalid';
      case 'E9013':
        return 'Project ID is invalid';
      default:
        return 'Unknown Error';
    }
  }
}

class ApiResponseError implements Exception {
  final String responseStatus;
  final String message;
  final List<InvalidParam>? invalidParams;
  final List<String>? requiredScopes;

  ApiResponseError({
    required this.responseStatus,
    this.message = '',
    this.invalidParams,
    this.requiredScopes,
  });
  

  @override
  String toString() {
    return 'ApiResponseError: (Response Status: ${getErrorMessage(responseStatus)}';
  }

  static String getErrorMessage(String responseStatus) {
    switch (responseStatus) {
      case 'SUCCESS':
        return 'Operation successful';
      case 'ERR_INVALID_PARAMS':
        return 'One or more parameters are invalid';
      case 'ERR_RESTRICTED_ENDPOINT':
        return 'Attempting login with already authenticated user';
      case 'ERR_UNAUTHENTICATED':
        return 'The user/app is not authenticated correctly';
      case 'ERR_UNAUTHORIZED':
        return 'The user/app does not have the necessary permissions or scopes';
      case 'ERR_UNVERIFIED':
        return 'The user has not verified their account';
      case 'ERR_NOT_FOUND':
        return 'The requested resource was not found';
      case 'ERR_INTERNAL_ERROR':
        return 'The server encountered an internal error';
      case 'ERR_RATE_LIMIT':
        return 'The user/app has exceeded the rate limit for the given operation';
      default:
        return 'Unknown Response Status';
    }
  }
}

class InvalidParam {
  final String paramName;
  final String paramType;
  final String errorCode;

  InvalidParam({
    required this.paramName,
    required this.paramType,
    required this.errorCode,
  });

  @override
  String toString() {
    return 'InvalidParam: $paramName (Type: $paramType, Error Code: $errorCode)';
  }
}
