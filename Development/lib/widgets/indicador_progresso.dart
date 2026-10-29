import 'package:flutter/material.dart';

/// Indicador do progresso diário de tarefas concluídas e horas planejadas vs. realizadas.
class IndicadorProgresso extends StatelessWidget {
  final int tarefasConcluidas;
  final int totalTarefas;
  final String tempoPlanejado;
  final String tempoRealizado;

  static const Color _corFundoCard = Color(0xFFEDE9FE);
  static const Color _corPrimaria = Color(0xFF5B4BDB);
  static const Color _corTrilhaBarra = Color(0xFFD5CEFA);
  static const Color _corTextoPrincipal = Color(0xFF1F2937);
  static const Color _corTextoSecundario = Color(0xFF6B7280);

  const IndicadorProgresso({
    super.key,
    required this.tarefasConcluidas,
    required this.totalTarefas,
    required this.tempoPlanejado,
    required this.tempoRealizado,
  });

  @override
  Widget build(BuildContext context) {
    final double progresso = totalTarefas > 0
        ? (tarefasConcluidas / totalTarefas).clamp(0.0, 1.0)
        : 0.0;
    final int percentual = (progresso * 100).round();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _corFundoCard,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Linha superior: contagem de tarefas e percentual
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$tarefasConcluidas de $totalTarefas tarefas concluídas',
                style: const TextStyle(
                  color: _corTextoPrincipal,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '$percentual%',
                style: const TextStyle(
                  color: _corPrimaria,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Barra de progresso horizontal
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progresso,
              minHeight: 8,
              backgroundColor: _corTrilhaBarra,
              valueColor: const AlwaysStoppedAnimation<Color>(_corPrimaria),
            ),
          ),
          const SizedBox(height: 16),

          // Linha inferior: tempo planejado e tempo realizado
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Planejado',
                      style: TextStyle(
                        color: _corTextoSecundario,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tempoPlanejado,
                      style: const TextStyle(
                        color: _corTextoPrincipal,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Realizado',
                      style: TextStyle(
                        color: _corTextoSecundario,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tempoRealizado,
                      style: const TextStyle(
                        color: _corPrimaria,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
