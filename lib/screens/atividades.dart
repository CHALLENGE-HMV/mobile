import 'package:flutter/material.dart';
import 'package:minha_saude/models/activity.dart';
import 'package:minha_saude/widgets/app_header.dart';
import 'package:minha_saude/widgets/bullet_item.dart';
import 'package:minha_saude/widgets/leading_logo.dart';
import 'package:minha_saude/widgets/meus_pontos.dart';
import 'package:minha_saude/widgets/text_with_under_line.dart';

import '../repositories/activity_repository.dart';
import '../services/activity_service.dart';

class AtividadesPage extends StatefulWidget {
  @override
  State<AtividadesPage> createState() => _AtividadesPageState();
}

class _AtividadesPageState extends State<AtividadesPage> {
  late Future<List<Activity>> _futureActivities;

  ActivityRepository _activityRepository =
      ApiActivityRepository(ApiActivityService());

  @override
  void initState() {
    super.initState();
    _futureActivities = _activityRepository.fetchActivities();
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
              TextWithUnderline(text: "Atividades"),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: FutureBuilder<List<Activity>>(
                  future: _futureActivities,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Activity activity = snapshot.data![index];
                            return _ItemAtividade(activity: activity);
                          });
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
              SizedBox(height: 190),
            ],
          ),
          MeusPontos()
        ],
      ),
    );
  }
}

class _ItemAtividade extends StatelessWidget {
  final Activity activity;

  const _ItemAtividade({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        BulletItem(text: '${activity.description}'),
      ],
    );
  }
}
