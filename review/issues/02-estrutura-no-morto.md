[Estrutura] Nó `dados` não é usado e `fazer` não tem função; includeOtherFields propaga tudo
estrutura,severidade:media
**Dimensão do checklist:** Estrutura

**Onde:** nós `dados` e `fazer`.

**Problema:**
- `dados` cria `db_user`, `db_password` e `conn`, mas nenhum nó posterior usa banco de dados. É código morto que ainda carrega segredos.
- `fazer` só grava `x = "ok"`, sem efeito de negócio.
- Ambos usam `includeOtherFields: true`, então tudo (inclusive segredos e dados pessoais) segue adiante pelo fluxo.

**Sugestão (não aplicada):** remover `dados`; trocar `fazer` por um passo real de resumo/log; desligar `includeOtherFields` quando não for necessário.

**Critério de aceite:** nenhum nó sem função; apenas os campos necessários são propagados.
