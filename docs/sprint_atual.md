# 📋 Relatório Incremental da Sprint Atual — FlowTask (ToDoList)

> **Projeto:** FlowTask (`to_do_list`)  
> **Disciplina:** Laboratório de Engenharia de Software (5º Ciclo — FATEC)  
> **Última Atualização:** 28/10/2026  
> **Branch Principal:** `main`  
> **Status Geral da Sprint:** 🟡 Em Andamento (Fundação Arquitetural, Prototipação UI/UX, Configurações de Plataformas, Tema Oficial, Widgets e Telas Iniciais Concluídas)

---

## 1. Visão Geral da Sprint Atual

Esta sprint tem como foco estabelecer a **fundação arquitetural e visual** do aplicativo mobile **FlowTask**, um gerenciador de tarefas diárias com suporte a planejamento por calendário, modo de foco (cronômetro/Pomodoro) e lembretes via notificações locais no Android.

Até o momento, a equipe estruturou o repositório separando os artefatos de **Design (`Design/`)** e **Desenvolvimento (`Development/`)**, configurou as dependências essenciais do ecossistema Flutter (persistência SQLite, calendário interativo, internacionalização, notificações locais e suporte web), declarou as permissões nativas do Android, definiu a centralização de tema e cores em `CoresApp` e `TemaApp`, construiu os 4 componentes visuais reutilizáveis, a navegação com menu expansivo lateral (`Drawer`) e a tela de calendário interativo.

---

## 2. Objetivos da Sprint

- [x] Definir e consolidar os protótipos visuais das telas e componentes reutilizáveis do **FlowTask** (`Design/`).
- [x] Inicializar o projeto Flutter e organizar a estrutura de diretórios do repositório (`Design/` e `Development/`).
- [x] Configurar pacotes externos de banco de dados (`sqflite`), calendário (`table_calendar`), notificações locais (`flutter_local_notifications`, `timezone`) e formatação (`intl`).
- [x] Configurar permissões nativas no `AndroidManifest.xml` para notificações, alarmes exatos, vibração e inicialização no boot.
- [x] Criar a arquitetura base em camadas (`model`, `services`, `control`, `widgets`, `telas`) e configurar o ponto de entrada em `main.dart` apontando para o widget `Menu`.
- [x] Estruturar a rotina de documentação incremental de sprint via agente (`AGENTS.md` e `.agents/skills/documentador-sprint/SKILL.md`).
- [x] Centralizar a paleta de cores e tema do FlowTask em [`CoresApp`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/tema/cores.dart) e [`TemaApp`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/tema/tema_app.dart) e instituir o agente Guardião de Tema ([`.agents/skills/guardiao-tema/SKILL.md`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/.agents/skills/guardiao-tema/SKILL.md)).
- [x] Implementar a navegação principal em [`Menu`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/telas/menu.dart) com menu expansivo lateral (`Drawer`), `AppBar` customizada e alternância de telas via `IndexedStack`.
- [x] Desenvolver os componentes visuais reutilizáveis ([`Botao`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/widgets/botao.dart), [`CampoTexto`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/widgets/campo_texto.dart), [`CardTarefa`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/widgets/card_tarefa.dart), [`IndicadorProgresso`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/widgets/indicador_progresso.dart)) seguindo o guia de estilo do FlowTask e padronizados com `CoresApp`.
- [x] Implementar a tela de Calendário ([`TelaCalendario`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/telas/tela_calendario.dart)) com calendário mensal interativo (`table_calendar`), marcadores de tarefas por dia e listagem segmentada entre tarefas ativas e concluídas.
- [ ] Implementar a persistência SQLite (`BancoService`) e os modelos de dados (`Tarefa`, `Configuracoes`).
- [ ] Implementar as regras de negócio nos controladores (`ControlTarefa`, `ControlFoco`) e serviços auxiliares (`NotificacaoService`, `ConfiguracoesService`).
- [ ] Construir as interfaces definitivas das demais telas (`TelaHoje`, `TelaFoco`, `TelaTarefa`, `TelaNotificacoes`, `TelaPerfil`).

---

## 3. Mapeamento do Progresso Atual por Camada

### 3.1. Design & Prototipação (`Design/`)
Protótipos de alta fidelidade adicionados ao repositório para guiar a implementação das telas e componentes:

| Artefato de Design | Descrição / Referência Visual | Status |
| :--- | :--- | :---: |
| [`Design/FlowTask · Componentes reutilizáveis.jpg`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Design/FlowTask%20%C2%B7%20Componentes%20reutiliz%C3%A1veis.jpg) | Guia de Design System e componentes reutilizáveis (botões, inputs, cards e indicadores) | ✅ Concluído |
| [`Design/Hoje.jpg`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Design/Hoje.jpg) | Tela principal com resumo do progresso diário e lista de tarefas do dia | ✅ Concluído |
| [`Design/Nova tarefa.jpg`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Design/Nova%20tarefa.jpg) | Formulário de criação e edição de tarefas | ✅ Concluído |
| [`Design/Calendário.jpg`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Design/Calend%C3%A1rio.jpg) | Visualização mensal/semanal e filtragem de tarefas por data selecionada | ✅ Concluído |
| [`Design/Modo Foco.jpg`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Design/Modo%20Foco.jpg) | Tela de cronômetro focado na execução de uma tarefa ativa | ✅ Concluído |
| [`Design/Notificações.jpg`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Design/Notifica%C3%A7%C3%B5es.jpg) | Tela de preferências de lembretes e alertas do aplicativo | ✅ Concluído |
| [`Design/Notificação Android.jpg`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Design/Notifica%C3%A7%C3%A3o%20Android.jpg) | Mockup da notificação push local exibida pelo sistema Android | ✅ Concluído |

---

### 3.2. Modelos de Domínio (`Development/lib/model/`)
Classes responsáveis pela representação estrutural dos dados na aplicação:

| Arquivo | Classe | Responsabilidade | Status |
| :--- | :--- | :--- | :---: |
| [`Development/lib/model/tarefa.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/model/tarefa.dart) | `Tarefa` | Modelo dos dados de uma tarefa (atributos, serialização SQLite `toMap`/`fromMap`). | 🚧 Esqueleto criado (`TODO`) |
| [`Development/lib/model/configuracoes.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/model/configuracoes.dart) | `Configuracoes` | Modelo das preferências locais do usuário (notificações, parâmetros de foco, etc.). | 🚧 Esqueleto criado (`TODO`) |

---

### 3.3. Serviços e Persistência (`Development/lib/services/`)
Camada de integração com recursos de infraestrutura local (banco de dados SQLite, armazenamento de preferências e notificações do sistema):

| Arquivo | Classe | Responsabilidade | Status |
| :--- | :--- | :--- | :---: |
| [`Development/lib/services/banco_service.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/services/banco_service.dart) | `BancoService` | Acesso ao banco SQLite (`sqflite`) e persistência CRUD dos dados. | 🚧 Esqueleto criado (`TODO`) |
| [`Development/lib/services/configuracoes_service.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/services/configuracoes_service.dart) | `ConfiguracoesService` | Leitura e gravação das preferências locais do usuário. | 🚧 Esqueleto criado (`TODO`) |
| [`Development/lib/services/notificacao_service.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/services/notificacao_service.dart) | `NotificacaoService` | Inicialização, agendamento (`timezone`) e cancelamento de notificações locais (`flutter_local_notifications`). | 🚧 Esqueleto criado (`TODO`) |

---

### 3.4. Controladores e Regras de Negócio (`Development/lib/control/`)
Camada responsável por orquestrar o estado e coordenar a comunicação entre a UI e os serviços:

| Arquivo | Classe | Responsabilidade | Status |
| :--- | :--- | :--- | :---: |
| [`Development/lib/control/control_tarefa.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/control/control_tarefa.dart) | `ControlTarefa` | Coordenação das operações CRUD, filtros por data, cálculo de progresso e regras das tarefas. | 🚧 Esqueleto criado (`TODO`) |
| [`Development/lib/control/control_foco.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/control/control_foco.dart) | `ControlFoco` | Controle da execução, pausa e conclusão do cronômetro do Modo Foco. | 🚧 Esqueleto criado (`TODO`) |

---

### 3.5. Tema e Identidade Visual (`Development/lib/tema/`)
Camada oficial de Design Tokens (cores semânticas, superfícies, tipografia e tema Material 3) do **FlowTask**:

| Arquivo | Classe | Responsabilidade | Status |
| :--- | :--- | :--- | :---: |
| [`Development/lib/tema/cores.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/tema/cores.dart) | `CoresApp` | Constantes oficiais da paleta de cores do FlowTask (fundos, superfícies, bordas, textos, roxo principal, estados de prioridades e situações das tarefas). | ✅ Concluído |
| [`Development/lib/tema/tema_app.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/tema/tema_app.dart) | `TemaApp` | Configuração centralizada do `ThemeData` (`TemaApp.claro`), incluindo `ColorScheme`, `TextTheme`, `AppBarTheme`, `CardThemeData`, `InputDecorationTheme`, `ElevatedButtonThemeData`, `NavigationBarThemeData` e `ProgressIndicatorThemeData`. | ✅ Concluído |

---

### 3.6. Widgets Reutilizáveis (`Development/lib/widgets/`)
Componentes visuais modulares padronizados com `CoresApp` e `TemaApp`:

| Arquivo | Widget | Responsabilidade | Status |
| :--- | :--- | :--- | :---: |
| [`Development/lib/widgets/botao.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/widgets/botao.dart) | `Botao` (`TipoBotao`) | Botão reutilizável em formato pílula com variantes `primario` (`CoresApp.principal`), `secundario` (`CoresApp.pendenteFundo`) e `contorno` (`CoresApp.borda`), suporte a ícone opcional e controle de largura (`larguraTotal`). | ✅ Concluído |
| [`Development/lib/widgets/campo_texto.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/widgets/campo_texto.dart) | `CampoTexto` | Campo de formulário com container arredondado (`CoresApp.superficie`), rótulo superior interno, suporte a `TextEditingController`, múltiplas linhas, modo `somenteLeitura` com `onTap` e `iconeSufixo`. | ✅ Concluído |
| [`Development/lib/widgets/card_tarefa.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/widgets/card_tarefa.dart) | `CardTarefa` (`PrioridadeTarefa`, `StatusTarefa`) | Cartão de tarefa com exibição de horário, duração estimada, tempo usado, título, botão interativo de status e badges semânticos coloridos mapeados para `CoresApp`. | ✅ Concluído |
| [`Development/lib/widgets/indicador_progresso.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/widgets/indicador_progresso.dart) | `IndicadorProgresso` | Card lilás (`CoresApp.principalSuave`) de resumo do dia com contagem de tarefas concluídas, cálculo automático de percentual, barra `LinearProgressIndicator` estilizada e comparativo de tempo `Planejado` vs. `Realizado`. | ✅ Concluído |

---

### 3.7. Telas e Navegação (`Development/lib/main.dart` & `Development/lib/telas/`)
Estrutura de navegação e telas principais da aplicação:

| Arquivo | Widget | Responsabilidade | Status |
| :--- | :--- | :--- | :---: |
| [`Development/lib/main.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/main.dart) | `MyApp` | Inicializa o `MaterialApp` com `title: 'FlowTask'`, `theme: TemaApp.claro` e define `Menu` como tela inicial (`home`). | ✅ Configurado |
| [`Development/lib/telas/menu.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/telas/menu.dart) | `Menu` | Navegação principal (`StatefulWidget`) com menu expansivo lateral (`Drawer`) acionado pelo ícone de 3 riscos (`Icons.menu_rounded`), atalho de notificações na `AppBar`, botão rápido "Adicionar tarefa" (`TelaTarefa`) e alternância via `IndexedStack` entre `TelaHoje`, `TelaCalendario`, `TelaFoco`, `TelaNotificacoes` e `TelaPerfil`. | ✅ Concluído |
| [`Development/lib/telas/tela_hoje.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/telas/tela_hoje.dart) | `TelaHoje` | Visão do planejamento diário, lista de tarefas do dia e progresso. | 🚧 Esqueleto (`StatelessWidget`) |
| [`Development/lib/telas/tela_calendario.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/telas/tela_calendario.dart) | `TelaCalendario` | Calendário mensal interativo (`TableCalendar`), marcadores de dias com tarefas, resumo de contadores por status, listagem de tarefas ativas com `CardTarefa` e seção de tarefas concluídas com soma de minutos realizados. | ✅ Concluído |
| [`Development/lib/telas/tela_foco.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/telas/tela_foco.dart) | `TelaFoco` | Cronômetro e acompanhamento da tarefa em execução. | 🚧 Esqueleto (`StatelessWidget`) |
| [`Development/lib/telas/tela_tarefa.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/telas/tela_tarefa.dart) | `TelaTarefa` | Formulário de criação e edição de tarefas. | 🚧 Esqueleto (`StatelessWidget`) |
| [`Development/lib/telas/tela_notificacoes.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/telas/tela_notificacoes.dart) | `TelaNotificacoes` | Configuração de preferências de lembretes e notificações. | 🚧 Esqueleto (`StatelessWidget`) |
| [`Development/lib/telas/tela_perfil.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/telas/tela_perfil.dart) | `TelaPerfil` | Perfil local do usuário e acesso às configurações gerais. | 🚧 Esqueleto (`StatelessWidget`) |

---

### 3.8. Configuração de Dependências, Linter e Plataformas (Android & Web)
- **Dependências (`Development/pubspec.yaml`):**
  - `flutter_local_notifications: ^22.3.1` — Disparo e agendamento de notificações locais.
  - `flutter_web_plugins: sdk: flutter` — Resolução do `web_plugin_registrant.dart` exigido pelo `flutter_local_notifications_web` ao compilar para navegador.
  - `table_calendar: ^3.3.0` — Componente de calendário para a `TelaCalendario`.
  - `timezone: ^0.11.1` — Suporte a fuso horário para agendamentos precisos.
  - `intl: ^0.20.3` — Formatação de datas, horas e localização.
  - `sqflite: ^2.4.4+1` e `path: ^1.9.1` — Banco de dados relacional local SQLite e resolução de diretórios.
- **Permissões Android (`Development/android/app/src/main/AndroidManifest.xml`):**
  - `android.permission.POST_NOTIFICATIONS`
  - `android.permission.SCHEDULE_EXACT_ALARM`
  - `android.permission.USE_EXACT_ALARM`
  - `android.permission.RECEIVE_BOOT_COMPLETED`
  - `android.permission.VIBRATE`
- **Suporte à Plataforma Web (`Development/web/`):**
  - Gerado com `flutter create --platforms=web .` (`index.html`, `manifest.json`, `favicon.png` e ícones PWA), permitindo executar e inspecionar a interface do aplicativo diretamente via navegador (`flutter run -d chrome` / `edge`).
- **Análise Estática (`Development/analysis_options.yaml`):**
  - Configurado `analyzer.exclude` para ignorar `build/**` e `android/**` durante verificações do `flutter analyze`.

---

## 4. Status das Funcionalidades

### ✅ Concluídas
1. **Prototipação UI/UX Completa:** 7 telas/pranchas de design exportadas em `Design/`.
2. **Setup e Organização do Repositório:** Separação em `Design/` e `Development/`.
3. **Adição de Dependências Core:** Pacotes de notificações, banco SQLite, calendário e internacionalização configurados no `pubspec.yaml`.
4. **Permissões Nativas Android:** Declaração completa de permissões de alarme exato, boot, vibração e notificações no `AndroidManifest.xml`.
5. **Scaffolding Arquitetural:** Criação de todas as pastas e classes-base (`model`, `services`, `control`, `widgets`, `telas`) e vinculação do `main.dart` ao componente `Menu`.
6. **Navegação Principal (`Menu` com `Drawer` Expansivo):** Implementação completa de [`Development/lib/telas/menu.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/telas/menu.dart) utilizando `Drawer` lateral acionado pelo ícone de 3 riscos (`Icons.menu_rounded`), botão rápido "Adicionar tarefa" e `IndexedStack` preservando o estado das 5 abas principais.
7. **Design System e Widgets Reutilizáveis (`Development/lib/widgets/`):** Implementação completa dos 4 componentes visuais padronizados (`Botao`, `CampoTexto`, `CardTarefa` e `IndicadorProgresso`) seguindo a prancha `Design/FlowTask · Componentes reutilizáveis.jpg`.
8. **Habilitação da Plataforma Web (`Development/web/`):** Inclusão do target Web no projeto Flutter para facilitar execução e testes rápidos de interface no navegador (`Chrome`/`Edge`).
9. **Tela de Calendário (`Development/lib/telas/tela_calendario.dart`):** Implementação completa de `TelaCalendario` com `TableCalendar`, indicadores de dias com tarefas, resumo diário dinâmico, listagem de tarefas ativas via `CardTarefa` e seção de tarefas concluídas com totalização de tempo realizado.
10. **Tema Oficial Centralizado (`CoresApp` & `TemaApp`) e Guardião de Tema (`guardiao-tema`):** Integração de `Development/lib/tema/cores.dart` e `Development/lib/tema/tema_app.dart` (commit `5f0c378` de João Cuba), criação da skill `.agents/skills/guardiao-tema/SKILL.md` e refatoração 100% padronizada de todos os widgets e telas para eliminar cores hardcoded.

### 🚧 Em Andamento / Ajustes Locais (Working Tree)
- [x] Incorporar `origin/primeiro-menu` na `main` preservando o tema e o ponto de entrada locais.
- [x] Resolver as dependências após a integração.
- [x] Refatorar menu, widgets e tela de calendário para consumir `TemaApp` e `CoresApp`.
- **Tema Centralizado (`Development/lib/tema/`), Navegação Principal (`menu.dart`), Tela de Calendário (`tela_calendario.dart`), Widgets (`Development/lib/widgets/`) e Target Web (`Development/web/`):** Unificados com `CoresApp`/`TemaApp` e validados com `flutter analyze` sem nenhum alerta.
- **Automação de Governança via Agentes (`AGENTS.md`, `documentador-sprint` e `guardiao-tema`):**
  - Diretrizes ativas garantindo padronização de cores e documentação incremental contínua.

### 📌 Próximos Passos (Backlog Imediato da Sprint)
1. **Modelagem e Banco de Dados:** Implementar os campos e métodos de serialização em `Tarefa` e `Configuracoes`, além da criação das tabelas SQLite em `BancoService`.
2. **Fluxo de Tarefas (`ControlTarefa`, `TelaHoje`, `TelaTarefa`):** Construir as telas `TelaHoje` e `TelaTarefa` utilizando `CoresApp`/`TemaApp` e os widgets (`IndicadorProgresso`, `CardTarefa`, `CampoTexto`, `Botao`), integrando ao `ControlTarefa` / SQLite.
3. **Modo Foco, Notificações e Perfil:** Implementar temporizador em `ControlFoco`/`TelaFoco`, configurações de lembretes em `TelaNotificacoes`/`NotificacaoService` e `TelaPerfil`.

---

## 5. Registro Incremental (Changelog da Sprint)

### 📅 28/10/2026 (Incremento #7) — Integração do Tema Centralizado (`CoresApp` / `TemaApp`) e Auditoria do Guardião de Tema
- **Arquivos integrados e criados:**
  - [`Development/lib/tema/cores.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/tema/cores.dart) (`CoresApp`) e [`Development/lib/tema/tema_app.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/tema/tema_app.dart) (`TemaApp.claro`), oriundos do commit `5f0c378` (*João Cuba*: `feat: centraliza cores e aplica tema visual do FlowTask`), além da atualização de [`Development/lib/main.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/main.dart).
  - Criação da skill [`.agents/skills/guardiao-tema/SKILL.md`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/.agents/skills/guardiao-tema/SKILL.md) e atualização de [`AGENTS.md`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/AGENTS.md) instituindo o subagente `guardiao-tema`.
- **Refatoração completa de fidelidade visual:**
  - Todos os 4 widgets (`botao.dart`, `campo_texto.dart`, `indicador_progresso.dart`, `card_tarefa.dart`) e as 2 telas implementadas (`menu.dart`, `tela_calendario.dart`) foram auditados e refatorados pelo `guardiao-tema` para consumir exclusivamente `CoresApp` e `TemaApp`, eliminando 100% das cores hardcoded (`Color(0xFF...)`) fora de `cores.dart`.

### 📅 28/10/2026 (Incremento #6) — Implementação da Tela de Calendário (`tela_calendario.dart`)
- **Componente implementado:** [`Development/lib/telas/tela_calendario.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/telas/tela_calendario.dart) (`TelaCalendario` convertida para `StatefulWidget` seguindo `Design/Calendário.jpg`).
- **Detalhes técnicos da entrega:**
  - Cabeçalho com título **"Calendário"**, subtítulo *"Um dia de cada vez"* e botão circular `+` (`CoresApp.principalSuave` / `CoresApp.principal`) que abre `TelaTarefa`.
  - Card de calendário mensal interativo utilizando `TableCalendar` (`package:table_calendar/table_calendar.dart`), com cabeçalho de mês/ano formatado em Português (`Outubro de 2026`), semana iniciando na segunda-feira (`S T Q Q S S D`), círculo roxo (`CoresApp.principal`) para o dia selecionado, marcadores de ponto sob os dias com tarefas e legenda inferior.
  - Resumo dinâmico do dia selecionado (ex.: *"Quinta, 8 de outubro"* e contadores de concluídas, pendentes, pausadas e atrasadas).
  - Listagem de tarefas ativas do dia utilizando o componente reutilizável `CardTarefa` com alternância interativa de conclusão (`onAlternarStatus`).
  - Seção **"Concluídas"** com cálculo dinâmico do total de minutos realizados e cards compactos verdes (`CoresApp.concluidaFundo` e `CoresApp.concluida`) fiéis ao protótipo.

### 📅 28/10/2026 (Incremento #5) — Correção de Dependência SDK para Build Web (`pubspec.yaml`)
- **Arquivo ajustado:** [`Development/pubspec.yaml`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/pubspec.yaml).
- **Detalhes técnicos da correção:**
  - Adicionado `flutter_web_plugins: sdk: flutter` em `dependencies` para resolver o erro `Error: Couldn't resolve the package 'flutter_web_plugins'` disparado pelo registrador automático (`web_plugin_registrant.dart`) do plugin `flutter_local_notifications_web`.
  - Compilação Web (`flutter build web`) validada com sucesso sem erros.

### 📅 28/10/2026 (Incremento #4) — Habilitação de Suporte à Plataforma Web (`Development/web/`)
- **Configuração adicionada:** Diretório [`Development/web/`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/web/index.html) (`index.html`, `manifest.json`, `favicon.png` e ícones em `icons/`).
- **Detalhes técnicos da entrega:**
  - Executado `flutter create --platforms=web .` dentro de `Development/` para habilitar a compilação e visualização rápida do **FlowTask** via navegador (`flutter run -d chrome`).

### 📅 28/10/2026 (Incremento #3) — Implementação dos Widgets Reutilizáveis (`Development/lib/widgets/`)
- **Componentes implementados:**
  - [`Development/lib/widgets/botao.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/widgets/botao.dart): Widget `Botao` e enum `TipoBotao` (`primario`, `secundario`, `contorno`), com formato pílula (`borderRadius: 28`), suporte a ícone opcional e controle de expansão horizontal (`larguraTotal`).
  - [`Development/lib/widgets/campo_texto.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/widgets/campo_texto.dart): Widget `CampoTexto` com container arredondado e borda sutil (`CoresApp.borda`), rótulo superior interno, suporte a `TextEditingController`, múltiplas linhas, modo `somenteLeitura` com `onTap` para seletores e `iconeSufixo`.
  - [`Development/lib/widgets/indicador_progresso.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/widgets/indicador_progresso.dart): Widget `IndicadorProgresso` em card lilás (`CoresApp.principalSuave`) com subtítulo de tarefas concluídas, cálculo automático de porcentagem (`0%` a `100%`), barra de progresso arredondada (`CoresApp.principal`) e comparativo de tempo `Planejado` vs. `Realizado`.
  - [`Development/lib/widgets/card_tarefa.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/widgets/card_tarefa.dart): Widget `CardTarefa` com enums `PrioridadeTarefa` (`baixa`, `media`, `alta`) e `StatusTarefa` (`pendente`, `concluida`, `atrasada`, `pausada`), exibindo metadados de horário/duração, botão circular de conclusão rápida e badges semânticos coloridos conforme o Design System do FlowTask.

### 📅 28/10/2026 (Incremento #2) — Implementação do Menu Principal Expansivo (`menu.dart`)
- **Componente implementado:** [`Development/lib/telas/menu.dart`](file:///c:/Users/willi/Desktop/FATEC/Quinto%20Ciclo/LB%20Eng%20Software/Projeto%20P2/ToDoList/Development/lib/telas/menu.dart) (`Menu` convertido para `StatefulWidget`).
- **Detalhes técnicos da entrega:**
  - `AppBar` superior com botão de menu hambúrguer de 3 riscos (`Icons.menu_rounded`) no canto superior esquerdo para abertura do `Drawer`, título dinâmico conforme a seção ativa e botão circular de acesso rápido à aba de **Notificações** no canto superior direito.
  - `Drawer` lateral estilizado com bordas arredondadas, cabeçalho institucional do **FlowTask** (ícone `Icons.bolt_rounded` e subtítulo *"Planejamento e Foco"*) utilizando a paleta oficial (`CoresApp.principal` e `CoresApp.principalSuave`).
  - Botão de ação rápida **"Adicionar tarefa"** (`FilledButton.icon`) dentro do menu expansivo, realizando `Navigator.push` direto para `TelaTarefa`.
  - Lista de navegação lateral com destaque visual do item ativo e corpo principal gerenciado por `IndexedStack` alternando entre `TelaHoje`, `TelaCalendario`, `TelaFoco`, `TelaNotificacoes` e `TelaPerfil`.

### 📅 28/10/2026 (Incremento #1) — Inicialização do Repositório, Fundação Arquitetural e Configurações Nativas
- **Commits de 28/10/2026:**
  - `405cc87` (*willaim*): Merge da branch `main` unificando a estrutura de pacotes/pastas com as configurações de manifesto Android.
  - `07f31da` (*willaim*): `feat: initialize Flutter project with Android manifest and configuration files` — Adição das permissões `SCHEDULE_EXACT_ALARM`, `USE_EXACT_ALARM`, `RECEIVE_BOOT_COMPLETED` e `VIBRATE` no `AndroidManifest.xml` e exclusão de `build/**` e `android/**` no `analysis_options.yaml`.
  - `05be72e` (*João Cuba*): `chore: cria estrutura inicial do FlowTask e define menu de entrada` — Criação dos esqueletos de classes em `lib/control/`, `lib/model/`, `lib/services/`, `lib/telas/` e `lib/widgets/`, além da simplificação do `lib/main.dart` para inicializar a tela `Menu`.

### 📅 07/10/2026 — Criação do Projeto e Protótipos
- **Commits de 07/10/2026:**
  - `f7af367` (*João Cuba*): Merge da PR `#1` (`feature/dependencias-atualizada`).
  - `8e22606` (*william wey*): `feat: adicionei as dependencias de permissões` — Inclusão dos pacotes `flutter_local_notifications`, `table_calendar`, `timezone`, `intl`, `sqflite` e `path` no `pubspec.yaml`, além da permissão `POST_NOTIFICATIONS` no `AndroidManifest.xml`.
  - `e7ca98a` (*João Cuba*): `chore: organiza projeto e adiciona design do FlowTask` — Reorganização do código Flutter para a subpasta `Development/` e inclusão dos 7 arquivos de protótipo na pasta `Design/`.
  - `4de29b8` (*william wey*): `feat: estrutura inicil do projeto` — Criação do projeto base Flutter (`to_do_list`).
