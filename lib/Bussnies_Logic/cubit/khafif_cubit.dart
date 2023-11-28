import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'khafif_state.dart';

class KhafifCubit extends Cubit<KhafifState> {
  KhafifCubit() : super(KhafifInitial());
}
