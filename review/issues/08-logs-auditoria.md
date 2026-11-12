[Logs e auditoria] O fluxo não deixa trilha de execução
auditoria,severidade:media
**Dimensão do checklist:** Logs e auditoria

**Onde:** fluxo inteiro; nó `fazer` (`x = ok`).

**Problema:** não há registro de o quê foi processado, quando e com qual resultado (quantos associados lidos, quantos registros criados, quantos falharam). `x = ok` é gravado mesmo sem verificar a resposta do POST, então pode indicar sucesso falso.

**Sugestão (não aplicada):** log por execução (id, data/hora, totais, falhas) em local definido, sem dados pessoais; `ok` só depois de validar a resposta.

**Critério de aceite:** é possível responder "o que rodou, quando e com que resultado" sem abrir o n8n.
