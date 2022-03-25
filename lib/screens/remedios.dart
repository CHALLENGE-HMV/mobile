import 'package:flutter/material.dart';
import 'package:minha_saude/constants/app_constants.dart';
import 'package:minha_saude/models/medicine.dart';
import 'package:minha_saude/repositories/medicine_repository.dart';
import 'package:minha_saude/services/medicine_service.dart';
import 'package:minha_saude/widgets/app_header.dart';
import 'package:minha_saude/widgets/app_text.dart';
import 'package:minha_saude/widgets/bullet_item.dart';
import 'package:minha_saude/widgets/leading_logo.dart';
import 'package:minha_saude/widgets/meus_pontos.dart';
import 'package:minha_saude/widgets/text_with_under_line.dart';

import '../helpers/date_helper.dart';

class RemediosPage extends StatefulWidget {
  @override
  State<RemediosPage> createState() => _RemediosPageState();
}

class _RemediosPageState extends State<RemediosPage> {
  late Future<List<Medicine>> _futureMedicines;

  MedicineRepository _medicineRepository =
      ApiMedicineRepository(ApiMedicineService());

  @override
  void initState() {
    super.initState();
    _futureMedicines = _medicineRepository.fetchMedicines();
  }

  @override
  Widget build(BuildContext context) {
    return AppHeader(
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LeadingLogo(),
              TextWithUnderline(text: "Remédios"),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: FutureBuilder<List<Medicine>>(
                  future: _futureMedicines,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Medicine medicine = snapshot.data![index];
                            return _ItemRemedio(medicine: medicine);
                          });
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
              SizedBox(height: 180),
            ],
          ),
          MeusPontos()
        ],
      ),
    );
  }
}

class _ItemRemedio extends StatelessWidget {
  final Medicine medicine;

  const _ItemRemedio({Key? key, required this.medicine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        BulletItem(
            text:
                '${medicine.name} - ${medicine.qtdDose} dose(s) à cada ${medicine.interval} hora(s)'),
        SizedBox(
          height: 10,
        ),
        Center(
          child: AppText(
            text:
                'Próximo horário: ${DateHelper.parseDateTimeToString(medicine.getNextDose())}',
            color: AppColors.orange,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
