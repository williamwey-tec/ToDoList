# Diretrizes de Agentes do Projeto (FlowTask - ToDoList)

## Documentação Incremental de Sprint (`documentador-sprint`)
- O projeto conta com uma rotina de documentação incremental da sprint atual localizada em `docs/sprint_atual.md` e detalhada na skill `.agents/skills/documentador-sprint/SKILL.md`.
- Sempre que concluir uma tarefa de desenvolvimento relevante (nova funcionalidade, tela, integração, correção de bug ou alteração de configuração) ou quando solicitado pelo usuário, acione o subagente `documentador-sprint` (definindo-o via `define_subagent` se necessário na sessão) para atualizar incrementalmente o arquivo `docs/sprint_atual.md`.

