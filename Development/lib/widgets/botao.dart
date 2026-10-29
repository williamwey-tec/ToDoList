import 'package:flutter/material.dart';

/// Variações visuais do botão reutilizável do FlowTask.
enum TipoBotao {
  /// Fundo roxo (#5B4BDB) e texto branco (ex.: "+ Adicionar tarefa", "Iniciar").
  primario,

  /// Fundo cinza suave (#F3F4F6) e texto cinza escuro (ex.: "Pausar").
  secundario,

  /// Fundo branco com borda sutil e texto roxo (ex.: "Concluir tarefa").
  contorno,
}

/// Botão reutilizável do aplicativo seguindo o Design System do FlowTask.
class Botao extends StatelessWidget {
  final String texto;
  final VoidCallback? onPressed;
  final IconData? icone;
  final TipoBotao tipo;
  final bool larguraTotal;

  static const Color _corPrimaria = Color(0xFF5B4BDB);
  static const Color _corSecundariaFundo = Color(0xFFF3F4F6);
  static const Color _corSecundariaTexto = Color(0xFF4B5563);
  static const Color _corBordaContorno = Color(0xFFE5E7EB);

  const Botao({
    super.key,
    required this.texto,
    this.onPressed,
    this.icone,
    this.tipo = TipoBotao.primario,
    this.larguraTotal = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color corFundo;
    final Color corTexto;
    final BorderSide borda;

    switch (tipo) {
      case TipoBotao.primario:
        corFundo = _corPrimaria;
        corTexto = Colors.white;
        borda = BorderSide.none;
      case TipoBotao.secundario:
        corFundo = _corSecundariaFundo;
        corTexto = _corSecundariaTexto;
        borda = BorderSide.none;
      case TipoBotao.contorno:
        corFundo = Colors.white;
        corTexto = _corPrimaria;
        borda = const BorderSide(color: _corBordaContorno, width: 1.2);
    }

    final estilo = ElevatedButton.styleFrom(
      backgroundColor: corFundo,
      foregroundColor: corTexto,
      elevation: 0,
      shadowColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: borda,
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );

    final Widget botao = icone != null
        ? ElevatedButton.icon(
            onPressed: onPressed,
            style: estilo,
            icon: Icon(icone, size: 22, color: corTexto),
            label: Text(texto),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: estilo,
            child: Text(texto),
          );

    if (larguraTotal) {
      return SizedBox(
        width: double.infinity,
        child: botao,
      );
    }

    return botao;
  }
}
