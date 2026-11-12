[Nomenclatura] Nós com nomes genéricos (node, dados, fazer, HTTP Request1/2)
nomenclatura,severidade:baixa
**Dimensão do checklist:** Nomenclatura

**Onde:** nós `node`, `HTTP Request1`, `dados`, `HTTP Request2`, `fazer`; campo `x` no nó `fazer`.

**Problema:** os nomes não dizem o que o nó faz. `node` é o gatilho, `fazer` não indica ação, `x` não indica significado. Dificulta manutenção e leitura do histórico de execuções.

**Sugestão (não aplicada):** adotar padrão do time, por exemplo `Gatilho manual`, `Buscar associados ativos`, `Registrar associado`, `Marcar conclusão`; campo `x` → `status_execucao`.

**Critério de aceite:** todos os nós e variáveis com nomes descritivos no padrão do time.
