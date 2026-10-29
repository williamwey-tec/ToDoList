# Diretrizes de Agentes do Projeto (FlowTask - ToDoList)

## 1. Guardião de Estilo e Cores (`guardiao-tema`)
- O projeto possui uma centralização oficial de paleta de cores e tema visual em `Development/lib/tema/cores.dart` (`CoresApp`) e `Development/lib/tema/tema_app.dart` (`TemaApp`), documentada na skill `.agents/skills/guardiao-tema/SKILL.md`.
- **Regra Obrigatória de UI**: Toda nova tela (`Development/lib/telas/`) ou componente (`Development/lib/widgets/`) criado ou modificado **DEVE** importar e utilizar exclusivamente as constantes de `CoresApp` e os estilos de `TemaApp`. É estritamente proibido usar cores hardcoded (`Color(0xFF...)`) fora de `cores.dart`.
- Sempre que criar ou alterar elementos visuais, utilize ou acione o subagente `guardiao-tema` (definindo-o via `define_subagent` se necessário na sessão) para auditar e padronizar as referências de cores e tema.

## 2. Documentação Incremental de Sprint (`documentador-sprint`)
- O projeto conta com uma rotina de documentação incremental da sprint atual localizada em `docs/sprint_atual.md` e detalhada na skill `.agents/skills/documentador-sprint/SKILL.md`.
- Sempre que concluir uma tarefa de desenvolvimento relevante (nova funcionalidade, tela, integração, correção de bug ou alteração de configuração) ou quando solicitado pelo usuário, acione o subagente `documentador-sprint` (definindo-o via `define_subagent` se necessário na sessão) para atualizar incrementalmente o arquivo `docs/sprint_atual.md`.
