import 'package:flutter_bloc/flutter_bloc.dart';

extension CubitExt<T> on Cubit<T> {
  Future<void> emitDelayed(T newState, {Duration? delay}) async {
    await Future.delayed(delay ?? Duration.zero);
    emit(newState);
  }
}
