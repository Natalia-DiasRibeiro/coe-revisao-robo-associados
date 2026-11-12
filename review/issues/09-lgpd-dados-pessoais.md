[Dados e LGPD] Dados pessoais trafegam e ficam salvos sem minimização nem política de retenção
lgpd,seguranca,severidade:alta
**Dimensão do checklist:** Dados e LGPD

**Onde:** `HTTP Request1` (resposta com associados), `dados`/`fazer` (`includeOtherFields: true`), `HTTP Request2` (envia `nome`).

**Problema:** `nome` do associado é dado pessoal. Com `includeOtherFields` ligado, **todos** os campos devolvidos pela API (possivelmente CPF, contato etc.) seguem pelo fluxo e ficam gravados no histórico de execuções do n8n, sem minimização, base legal ou prazo de retenção definidos.

**Sugestão (não aplicada):** propagar só os campos necessários; configurar para não salvar dados de execução bem-sucedida (ou reduzir a retenção); nunca logar CPF.

**Critério de aceite:** só dados estritamente necessários trafegam; retenção definida e documentada.
