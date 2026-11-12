[Erro de sistema] Chamadas HTTP sem retry, timeout ou tratamento de falha
resiliencia,severidade:alta
**Dimensão do checklist:** Erro de sistema

**Onde:** `HTTP Request1` e `HTTP Request2` (`options: {}`); `settings` do fluxo.

**Problema:** nenhuma chamada tem *Retry On Fail*, limite de tentativas, timeout ou `onError`. Não há fluxo de erro (`errorWorkflow`) nas `settings`. Uma falha transitória (503, timeout) derruba a execução sem aviso a ninguém.

**Sugestão (não aplicada):** habilitar retry com limite (ex.: 3 tentativas com espera), definir timeout, configurar Error Workflow que notifique o dono.

**Critério de aceite:** falha transitória é retentada com limite; falha definitiva gera alerta.
