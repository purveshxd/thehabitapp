import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/models/habit.model.dart';

final habitDaysProvider = StateProvider<List<Days>>((ref) => []);
final isSelectedProvider = StateProvider((ref) => false);
