[Erro de sistema] Sem paginação na consulta e sem controle de ritmo nos POSTs
resiliencia,severidade:media
**Dimensão do checklist:** Erro de sistema

**Onde:** `HTTP Request1` (GET sem paginação) e `HTTP Request2` (um POST por item).

**Problema:** se a API paginar, o fluxo lê só a primeira página e processa associados incompletos sem avisar. Com muitos associados, os POSTs em sequência rápida podem estourar rate limit da API.

**Sugestão (não aplicada):** configurar paginação; usar *Batching* com intervalo no `HTTP Request2`; confirmar limites com o dono da API.

**Critério de aceite:** todos os associados ativos são lidos; ritmo respeita o limite da API.
