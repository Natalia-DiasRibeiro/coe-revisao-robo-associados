[Erro de negócio] Nenhuma validação de dados antes do POST
validacao,severidade:alta
**Dimensão do checklist:** Erro de negócio

**Onde:** `HTTP Request2`, parâmetros `={{ $json.nome }}` e `={{ $json.valor }}`.

**Problema:** o fluxo assume que todo associado tem `nome` e `valor` válidos. Campo ausente, vazio ou valor negativo/zero é enviado assim mesmo ou derruba a execução, e não existe registro do item problemático nem desvio dele.

**Sugestão (não aplicada):** nó de validação (IF/Filter) antes do POST; itens inválidos vão para um ramo que registra o motivo e segue com o restante do lote.

**Critério de aceite:** dado inválido é validado, registrado e pulado, sem derrubar o lote.
