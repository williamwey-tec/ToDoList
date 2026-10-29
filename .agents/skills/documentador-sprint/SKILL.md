---
name: documentador-sprint
description: >-
  Fluxo e instruções para documentar de forma incremental o progresso do
  desenvolvimento em um arquivo Markdown da sprint atual (docs/sprint_atual.md).
  Ative esta skill sempre que o usuário pedir para atualizar a documentação da
  sprint, registrar progresso incremental ou ao concluir entregas de código.
---

# Documentador Incremental de Sprint

Esta skill define o padrão para criação e atualização incremental do documento da sprint atual em `docs/sprint_atual.md`.

## Como Utilizar

1. **Via Subagente Dedicado (`documentador-sprint`)**:
   - Caso o subagente `documentador-sprint` ainda não esteja definido na sessão atual, defina-o com `define_subagent` (`EnableWriteTools: true`).
   - Invoque-o com `invoke_subagent` passando o contexto do que acabou de ser desenvolvido ou pedindo uma varredura do estado atual do repositório.

2. **Estrutura do Documento (`docs/sprint_atual.md`)**:
   - **Cabeçalho da Sprint**: Nome do projeto (FlowTask), período/data de atualização e status geral.
   - **Resumo Executivo / Objetivos da Sprint**: Metas principais do ciclo atual.
   - **Progresso por Camada / Módulo**:
     - Design & Prototipação (`Design/`)
     - Modelos (`Development/lib/model/`)
     - Serviços e Persistência (`Development/lib/services/`)
     - Controle / Regra de Negócio (`Development/lib/control/`)
     - Componentes Visuais (`Development/lib/widgets/`)
     - Telas e Navegação (`Development/lib/telas/`)
     - Configurações Nativas / Android (`Development/android/`)
   - **Checklist de Funcionalidades (Entregues vs. Pendentes)**.
   - **Diário Incremental de Desenvolvimento (Changelog)**: Entradas cronológicas detalhando cada incremento realizado durante a sprint.

## Regra de Atualização Incremental
- **Nunca apague** o histórico de incrementos anteriores dentro da mesma sprint.
- Sempre adicione uma nova seção datada no **Diário Incremental de Desenvolvimento** e atualize os checkboxes/tabelas de progresso geral.

