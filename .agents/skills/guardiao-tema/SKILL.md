---
name: guardiao-tema
description: >-
  Diretrizes e referência oficial de estilo e cores do FlowTask baseadas em
  Development/lib/tema/cores.dart (CoresApp) e Development/lib/tema/tema_app.dart
  (TemaApp). Ative esta skill sempre que criar, revisar ou refatorar qualquer
  widget ou tela para garantir fidelidade 100% ao referencial de cores.
---

# Guardião de Estilo e Cores (`guardiao-tema`)

Esta skill assegura que todo componente visual (`Development/lib/widgets/`) e tela (`Development/lib/telas/`) do **FlowTask** utilize exclusivamente os tokens de cor e tema centralizados em:
- [`Development/lib/tema/cores.dart`](../../Development/lib/tema/cores.dart) (`CoresApp`)
- [`Development/lib/tema/tema_app.dart`](../../Development/lib/tema/tema_app.dart) (`TemaApp`)

## Tabela de Referência Rápida (`CoresApp`)

| Categoria | Token (`CoresApp.*`) | Hexadecimal | Uso Recomendado |
| :--- | :--- | :--- | :--- |
| **Identidade** | `CoresApp.principal` | `#6750C8` | Botões primários, ícones ativos, barras de progresso, dia selecionado |
| **Identidade** | `CoresApp.principalSuave` | `#EDE7FF` | Fundos de destaque (IndicadorProgresso, item de menu ativo, botão de ação rápida) |
| **Superfícies** | `CoresApp.fundo` | `#FAF8FF` | Fundo padrão de `Scaffold` e `AppBar` |
| **Superfícies** | `CoresApp.superficie` | `#FFFFFF` | Fundo de `Card`, `CampoTexto`, `Drawer` e containers brancos |
| **Superfícies** | `CoresApp.borda` | `#E2DEEC` | Bordas de cards, inputs, calendário e divisores (`Divider`) |
| **Textos** | `CoresApp.texto` | `#292735` | Títulos, textos principais e ícones de destaque escuro |
| **Textos** | `CoresApp.textoSecundario` | `#6F6B80` | Subtítulos, rótulos de campos, horários, legendas e dicas (`hintText`) |
| **Textos** | `CoresApp.sobrePrincipal` | `#FFFFFF` | Texto e ícones sobre fundo `CoresApp.principal` |
| **Prioridade** | `CoresApp.prioridadeBaixa` / `prioridadeBaixaFundo` | `#2D7050` / `#E7F3EC` | Badge e indicadores de prioridade baixa |
| **Prioridade** | `CoresApp.prioridadeMedia` / `prioridadeMediaFundo` | `#805900` / `#FFF3CD` | Badge e indicadores de prioridade média |
| **Prioridade** | `CoresApp.prioridadeAlta` / `prioridadeAltaFundo` | `#B3261E` / `#FCE8E6` | Badge e indicadores de prioridade alta |
| **Status** | `CoresApp.concluida` / `concluidaFundo` | `#2D7050` / `#E7F3EC` | Tarefas concluídas (ícone check, badge e card compacto verde) |
| **Status** | `CoresApp.pendente` / `pendenteFundo` | `#625D71` / `#F0EDF5` | Tarefas pendentes (borda do círculo vazio, texto e badge) |
| **Status** | `CoresApp.pausada` / `pausadaFundo` | `principal` / `principalSuave` | Tarefas pausadas / em foco |
| **Status** | `CoresApp.atrasada` / `atrasadaFundo` | `#B3261E` / `#FCE8E6` | Tarefas atrasadas e alertas de atraso |
| **Sistema** | `CoresApp.erro` | `#B3261E` | Erros de validação e feedback crítico |

## Procedimento de Auditoria / Padronização

1. **Proibição de Hexadecimais Soltos**: Nenhum arquivo fora de `Development/lib/tema/cores.dart` deve instanciar `Color(0xFF...)`.
2. **Importação Padrão**: Sempre importe `../tema/cores.dart` nas telas e widgets.
3. **Verificação Automática**: Após criar ou editar qualquer arquivo de UI, acione o subagente `guardiao-tema` (ou verifique diretamente) para garantir que nenhum `Color(0xFF...)` foi introduzido e que `flutter analyze` passa sem alertas.

