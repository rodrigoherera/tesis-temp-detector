
import 'package:flutter_temp_detector/Home/repository/temperature_repository.dart';
import 'package:flutter_temp_detector/src/generated/service.pb.dart';
import 'package:rxdart/rxdart.dart';

class TemperatureBloc {
  final TemperatureRepository _repository = TemperatureRepository();
  final BehaviorSubject<List<Temperature>> _subject = BehaviorSubject<List<Temperature>>();

  getTemperature(Temperature temperature) async {
    GetTemperatures response = await _repository.getTemperature(temperature);
    _subject.sink.add(response.temperatures);
  }
  
  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<Temperature>> get subject => _subject;

}

final temperatureBloc = TemperatureBloc();