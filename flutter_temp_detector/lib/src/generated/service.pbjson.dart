///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'last_name', '3': 3, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 5, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'admin', '3': 6, '4': 1, '5': 8, '10': 'admin'},
  ],
};

const Temperature$json = const {
  '1': 'Temperature',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 3, '10': 'userId'},
    const {'1': 'date', '3': 2, '4': 1, '5': 9, '10': 'date'},
    const {'1': 'value', '3': 3, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'from', '3': 5, '4': 1, '5': 9, '10': 'from'},
    const {'1': 'to', '3': 4, '4': 1, '5': 9, '10': 'to'},
  ],
};

const GetUsers$json = const {
  '1': 'GetUsers',
  '2': const [
    const {'1': 'user', '3': 1, '4': 3, '5': 11, '6': '.proto.User', '10': 'user'},
  ],
};

const GetTemperatures$json = const {
  '1': 'GetTemperatures',
  '2': const [
    const {'1': 'temperatures', '3': 1, '4': 3, '5': 11, '6': '.proto.Temperature', '10': 'temperatures'},
  ],
};

const ServerResponse$json = const {
  '1': 'ServerResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
    const {'1': 'error', '3': 3, '4': 1, '5': 9, '10': 'error'},
  ],
};

