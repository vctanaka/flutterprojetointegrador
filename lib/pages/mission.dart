import 'package:flutter/material.dart';
import 'package:skin_saga/components/component_menu.dart';
import 'package:skin_saga/components/component_mission.dart';
import 'package:skin_saga/pages/history.dart';
import 'package:skin_saga/pages/home.dart';
import 'package:skin_saga/pages/points.dart';
import 'package:skin_saga/pages/quiz_start.dart';

class Mission extends StatelessWidget {
  int _currentIndex = 1;

  void _onItemTapped(int index, BuildContext context) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Mission()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Points()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => History()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      bottomNavigationBar: ComponentMenu(
        currentIndex: _currentIndex,
        onTap: (index) => _onItemTapped(index, context),
      ),
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            'Missões Diárias',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(26, 26, 26, 1),
            ),
          ),
          SizedBox(height: 15),
          ComponentMission(
            missionTitle: 'Lave o Rosto Adequadamente',
            missionDescription:
                'Lave seu rosto com um limpador suave e apropriado para o seu tipo de pele',
            missionDone: true,
          ),
          ComponentMission(
            missionTitle: 'Aplique Protetor Solar',
            missionDescription:
                'Use um protetor solar adequado para o seu tipo de pele antes de sair',
            missionDone: false,
          ),
          ComponentMission(
            missionTitle: 'Hidratação Matinal',
            missionDescription:
                'Aplique um hidratante específico para o seu tipo de pele pela manhã',
            missionDone: true,
          ),
          ComponentMission(
            missionTitle: 'Remova a Maquiagem Antes de Dormir',
            missionDescription:
                'Certifique-se de remover completamente a maquiagem antes de ir para a cama',
            missionDone: false,
          ),
        ],
      ),
    ));
  }
}
