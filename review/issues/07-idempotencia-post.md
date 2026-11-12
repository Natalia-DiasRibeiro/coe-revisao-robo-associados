[Idempotência] POST de /registros sem chave de idempotência
idempotencia,severidade:alta
**Dimensão do checklist:** Idempotência

**Onde:** nó `HTTP Request2` (POST `/registros`).

**Problema:** o POST cria um registro por associado, sem chave de idempotência nem checagem de existência. Reexecutar o fluxo (manual, retry ou falha no meio do lote) **duplica registros**. Como há um POST por item, uma falha parcial deixa o lote em estado desconhecido.

**Sugestão (não aplicada):** enviar `Idempotency-Key` (ex.: id do associado + período) se a API aceitar, ou consultar antes de criar; registrar quais itens já foram processados.

**Critério de aceite:** rodar duas vezes seguidas não gera registros duplicados.
