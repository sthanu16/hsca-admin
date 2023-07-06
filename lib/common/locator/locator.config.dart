// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../api/repository/base/auth/auth_repo.dart' as _i4;
import '../constant/app_utils.dart' as _i3;
import '../constant/loader_dialog.dart' as _i5;
import '../custom_widget/navigation_service.dart' as _i6;
import '../custom_widget/toast_service.dart'
    as _i7;
import '../router/router.gr.dart'; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AppUtils>(() => _i3.AppUtils());
  gh.lazySingleton<_i4.AuthRepository>(() => _i4.AuthRepository());
  gh.lazySingleton<_i5.DialogService>(() => _i5.DialogService(get<AppRouter>()));
  gh.lazySingleton<_i6.NavigationService>(
      () => _i6.NavigationService(get<AppRouter>()));
  gh.lazySingleton<_i7.ToastService>(() => _i7.ToastService());
  return get;
}
