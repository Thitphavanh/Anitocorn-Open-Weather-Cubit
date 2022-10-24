import 'package:anitocorn_open_weather_cubit/cubits/temp_settings/temp_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('SETTING'),
      ),
      body: ListTile(
        title: Text('ຫົວໜ່ວຍ ອຸນຫະພູມ'),
        subtitle: Text('ອຸນຫະພູມ/ຟາເຣນໄຮ (ຄ່າເລີ່ມຕົ້ນ: ອຸນຫະພູມ )'),
        trailing: Switch(
          value: context.watch<TempSettingsCubit>().state.tempUnit ==
              TempUnit.celsius,
          onChanged: (_) {
            context.read<TempSettingsCubit>().toggleTempUnit();
          },
        ),
      ),
    );
  }
}
