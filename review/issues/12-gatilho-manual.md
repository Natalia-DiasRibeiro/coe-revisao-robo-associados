[Estrutura] Gatilho exclusivamente manual
estrutura,severidade:baixa
**Dimensão do checklist:** Estrutura / Documentação

**Onde:** nó `node` (`manualTrigger`).

**Problema:** o robô só roda se alguém clicar. Frequência e janela de execução não estão definidas no fluxo nem no PDD, e uma execução esquecida ou duplicada manualmente agrava o risco de duplicidade (ver idempotência).

**Sugestão (não aplicada):** definir frequência/janela com o demandante; usar Schedule Trigger quando decidido.

**Critério de aceite:** frequência e janela definidas e refletidas no PDD e no fluxo.
