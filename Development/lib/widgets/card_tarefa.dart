import 'package:flutter/material.dart';

/// Níveis de prioridade de uma tarefa no FlowTask.
enum PrioridadeTarefa {
  baixa,
  media,
  alta,
}

/// Estados de andamento de uma tarefa no FlowTask.
enum StatusTarefa {
  pendente,
  concluida,
  atrasada,
  pausada,
}

/// Cartão com os dados, badges de prioridade/status e ações de uma tarefa.
class CardTarefa extends StatelessWidget {
  final String titulo;
  final String horario;
  final String duracaoEstimada;
  final String? tempoUsado;
  final PrioridadeTarefa prioridade;
  final StatusTarefa status;
  final VoidCallback? onTap;
  final VoidCallback? onAlternarStatus;

  static const Color _corPrimaria = Color(0xFF5B4BDB);
  static const Color _corFundoPausada = Color(0xFFEDE9FE);
  static const Color _corBordaPausada = Color(0xFFC4B5FD);
  static const Color _corBordaPadrao = Color(0xFFE5E7EB);

  static const Color _corVerdeFundo = Color(0xFFE6F4EA);
  static const Color _corVerdeTexto = Color(0xFF2E6F40);

  static const Color _corAmareloFundo = Color(0xFFFEF3C7);
  static const Color _corAmareloTexto = Color(0xFF854D0E);

  static const Color _corVermelhoFundo = Color(0xFFFCE8E6);
  static const Color _corVermelhoTexto = Color(0xFFB91C1C);

  static const Color _corCinzaFundo = Color(0xFFF3F4F6);
  static const Color _corCinzaTexto = Color(0xFF4B5563);

  const CardTarefa({
    super.key,
    required this.titulo,
    required this.horario,
    required this.duracaoEstimada,
    this.tempoUsado,
    this.prioridade = PrioridadeTarefa.media,
    this.status = StatusTarefa.pendente,
    this.onTap,
    this.onAlternarStatus,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPausada = status == StatusTarefa.pausada;
    final bool isConcluida = status == StatusTarefa.concluida;

    return Material(
      color: isPausada ? _corFundoPausada : Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isPausada ? _corBordaPausada : _corBordaPadrao,
              width: 1.2,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Ícone lateral de status (check verde, pause roxo ou círculo vazio)
              GestureDetector(
                onTap: onAlternarStatus,
                child: _construirIconeStatus(),
              ),
              const SizedBox(width: 14),

              // Conteúdo principal do card
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Linha de horário + duração e tempo usado à direita
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$horario · $duracaoEstimada',
                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (tempoUsado != null && tempoUsado!.isNotEmpty)
                          Text(
                            tempoUsado!,
                            style: const TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Título da tarefa
                    Text(
                      titulo,
                      style: TextStyle(
                        color: isConcluida
                            ? const Color(0xFF6B7280)
                            : const Color(0xFF1F2937),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Badges de Prioridade e Status
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        _construirBadgePrioridade(),
                        _construirBadgeStatus(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirIconeStatus() {
    switch (status) {
      case StatusTarefa.concluida:
        return Container(
          width: 28,
          height: 28,
          decoration: const BoxDecoration(
            color: _corVerdeTexto,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check_rounded,
            color: Colors.white,
            size: 18,
          ),
        );
      case StatusTarefa.pausada:
        return Container(
          width: 28,
          height: 28,
          decoration: const BoxDecoration(
            color: _corPrimaria,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.pause_rounded,
            color: Colors.white,
            size: 18,
          ),
        );
      case StatusTarefa.pendente:
      case StatusTarefa.atrasada:
        return Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF9CA3AF),
              width: 1.8,
            ),
          ),
        );
    }
  }

  Widget _construirBadgePrioridade() {
    final String texto;
    final Color corFundo;
    final Color corTexto;

    switch (prioridade) {
      case PrioridadeTarefa.baixa:
        texto = 'Prioridade baixa';
        corFundo = _corVerdeFundo;
        corTexto = _corVerdeTexto;
      case PrioridadeTarefa.media:
        texto = 'Prioridade média';
        corFundo = _corAmareloFundo;
        corTexto = _corAmareloTexto;
      case PrioridadeTarefa.alta:
        texto = 'Prioridade alta';
        corFundo = _corVermelhoFundo;
        corTexto = _corVermelhoTexto;
    }

    return _Badge(
      texto: texto,
      corFundo: corFundo,
      corTexto: corTexto,
    );
  }

  Widget _construirBadgeStatus() {
    switch (status) {
      case StatusTarefa.concluida:
        return const _Badge(
          texto: 'Concluída',
          corFundo: _corVerdeFundo,
          corTexto: _corVerdeTexto,
        );
      case StatusTarefa.atrasada:
        return const _Badge(
          texto: 'Atrasada',
          corFundo: _corVermelhoFundo,
          corTexto: _corVermelhoTexto,
        );
      case StatusTarefa.pendente:
        return const _Badge(
          texto: 'Pendente',
          corFundo: _corCinzaFundo,
          corTexto: _corCinzaTexto,
        );
      case StatusTarefa.pausada:
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Text(
            'Pausada',
            style: TextStyle(
              color: _corPrimaria,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
    }
  }
}

class _Badge extends StatelessWidget {
  final String texto;
  final Color corFundo;
  final Color corTexto;

  const _Badge({
    required this.texto,
    required this.corFundo,
    required this.corTexto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: corFundo,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        texto,
        style: TextStyle(
          color: corTexto,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
