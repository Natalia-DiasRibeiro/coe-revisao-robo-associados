# PDD — Process Definition Document

> Rascunho gerado a partir do fluxo `workflow/fluxo-original.json` seguindo o prompt da Aula 16 e o
> `Template_PDD`. **Regra do documento:** o que está no fluxo é **FATO**; o resto é
> **[A CONFIRMAR]**. Campo que o fluxo não permite preencher = *não identificável no fluxo*.

## 1. Identificação

| Campo | Valor |
|---|---|
| Nome do processo | **[A CONFIRMAR]** — provável: "Registro de dados de associados ativos da cooperativa". O fluxo se chama "Simulacao CoE - Fluxo para revisao" |
| Área demandante | Não identificável no fluxo. **[A CONFIRMAR]** — o domínio `exemplo-cooperativa.com` sugere uma cooperativa, mas não a área |
| Autor do PDD | *(preencher: nome de quem levantou)* |
| Data / versão | 11/11/2026 · v0.1 |
| Prioridade | Não identificável no fluxo |
| Status | Rascunho |

## 2. Objetivo e justificativa

- **Fato:** o fluxo consulta associados com `status=ativo` em uma API e, para cada resultado, envia um
  POST de "registro" com `associado` e `valor` a outra rota da mesma API.
- **[A CONFIRMAR]:** qual é o propósito de negócio do "registro" (cobrança? lançamento? conciliação?).
  O fluxo não diz o que é `valor`, nem por que é gravado por associado.
- **[A CONFIRMAR]:** a dor atual (retrabalho manual? atraso? erro?). Não há nada no fluxo sobre isso.

## 3. Processo atual (AS IS) — passo a passo

O fluxo **não descreve o processo manual**; só o robô. O AS IS humano é **não identificável no fluxo**
e precisa ser levantado com o demandante. O que o robô faz hoje (comportamento técnico, não processo):

1. Execução iniciada **manualmente** (gatilho manual).
2. Consulta a lista de associados ativos na API.
3. Para cada associado devolvido, envia um registro (nome + valor) para a API.
4. Marca `x = ok` ao final (sem efeito de negócio).

> Observação: os passos 2 e 3 são **nós técnicos**. A regra de negócio por trás deles não está no fluxo.

## 4. Regras de negócio

| Regra | Origem |
|---|---|
| Só associados com status **ativo** são considerados | **Fato** (filtro `status=ativo` na consulta) |
| Um registro é criado por associado, contendo nome e valor | **Fato** (corpo do POST) |
| Origem do `valor`, limites, prazos, condições de elegibilidade | **[A CONFIRMAR]** — não aparecem no fluxo |
| O que fazer com associado sem `nome` ou sem `valor` | **[A CONFIRMAR]** — o fluxo não valida |

Nenhuma regra além das duas primeiras está evidenciada. Não foram inventadas outras.

## 5. Exceções e tratamento

**Fato:** o fluxo **não trata nenhuma exceção** — sem retry, sem timeout, sem validação, sem ramo de erro,
sem fluxo de erro configurado.

Exceções que o processo **precisa definir** com o demandante (todas **[A CONFIRMAR]**):

- **Sistema:** API fora do ar ou lenta; credencial expirada; limite de requisições (rate limit).
- **Negócio:** associado sem nome ou valor; valor negativo/zero; associado duplicado na lista.
- **Reexecução:** o que acontece se o fluxo rodar duas vezes — o fluxo hoje criaria registros duplicados.

## 6. Sistemas, dados e LGPD

| Item | Conteúdo |
|---|---|
| Sistemas envolvidos | **Fato:** API `api.exemplo-cooperativa.com` (rotas `/associados` e `/registros`). Existe um nó que monta string de conexão com banco `coop` em `10.0.0.9`, mas **nenhum nó usa esse banco** — papel **[A CONFIRMAR]** |
| Entradas | **Fato:** lista de associados ativos (campos usados: `nome`, `valor`). Demais campos **não identificáveis** |
| Saídas | **Fato:** registros criados via POST. Resposta/retorno final: não identificável |
| Dados pessoais | **Fato:** `nome` do associado. **[A CONFIRMAR]:** a resposta da API pode trazer CPF, endereço etc. — como `includeOtherFields` está ativo, tudo trafega adiante e fica nos dados de execução do n8n |
| Proteção (LGPD) | **[A CONFIRMAR]** base legal, minimização e retenção. Hoje: dados pessoais ficam no histórico de execuções do n8n sem política definida |

⚠️ **Ponto crítico (não é regra de negócio, é risco):** o fluxo contém **credenciais em texto puro**
(chave de API na URL, usuário e senha de banco). Ver `review/` — achados 1 e 2.

## 7. Volume e frequência

- Volume: **não identificável no fluxo**. (O número de POSTs = número de associados ativos devolvidos.)
- Frequência: **não identificável.** Fato: o gatilho é manual, ou seja, hoje não há agendamento.
- Janela: não identificável no fluxo.

## 8. Benefício esperado

Não identificável no fluxo. Nenhum número (horas, erros evitados, ROI) pode ser afirmado sem dados do
demandante. **[A CONFIRMAR]:** tempo manual atual por execução, volume mensal, custo de erro.

## 9. Critérios de aceitação (Definition of Done)

- [ ] O robô cobre o caminho feliz **e** as exceções listadas na seção 5.
- [ ] Credenciais no cofre do n8n, nada escrito no fluxo.
- [ ] Logs e trilha de auditoria da execução (o que, quando, resultado), sem CPF/dados sensíveis.
- [ ] Reexecução não duplica registros (idempotência).
- [ ] PDD e SDD entregues e revisados pelo CoE; dono/sustentação definido.
- [ ] Aprovado no `review/checklist-revisao-coe.md` em **todos** os itens.

## 10. Riscos e dependências

- **Segredos expostos** em fluxo versionado (chave `sk_live_…`, senha de banco): risco de vazamento — rotacionar.
- **Duplicidade de registros** em reexecução ou falha parcial (POST sem chave de idempotência).
- **Violação de LGPD** por dados pessoais em execuções/logs sem política de retenção.
- **Sem dono** definido para sustentação.
- Dependência: disponibilidade e contrato (campos, autenticação, limites) da API da cooperativa.

---

## Suposições feitas pela IA (para validar)

1. O domínio é uma cooperativa e "associado" é pessoa física (afeta LGPD).
2. O `valor` é monetário.
3. O "registro" é um lançamento por associado.
4. O banco `coop` em `10.0.0.9` é resquício de teste ou de etapa futura.
5. Cada associado devolvido vira um item e, portanto, um POST separado (comportamento padrão do n8n).

## Perguntas para o demandante

1. Qual é o processo manual de hoje e quem o executa? Quantas vezes por mês e em quanto tempo?
2. O que é o `valor` e de onde ele vem? Existem limites, prazos ou condições de elegibilidade?
3. O que deve acontecer com associado sem nome/valor ou com valor inválido?
4. Pode rodar duas vezes no mesmo período? Como evitar duplicidade? A API aceita chave de idempotência?
5. Quais campos pessoais a API `/associados` devolve? Há base legal e prazo de retenção definidos?
6. Para que serve a conexão com o banco `coop`? Ainda é necessária?
7. Qual a periodicidade e a janela de execução desejadas (hoje é manual)?
8. Quem será o dono do robô e quem dá suporte?

---

## Revisão crítica (checklist da Aula 16)

| Pergunta | Resultado |
|---|---|
| A IA inventou regra de negócio que não está no fluxo? | Não. Só 2 regras marcadas como fato; o resto é [A CONFIRMAR] |
| Deduziu volume, frequência ou prazo sem marcar? | Não. Tudo "não identificável no fluxo" |
| Confundiu passo técnico com regra de negócio? | Cuidado: seção 3 lista passos técnicos e avisa que não são o AS IS |
| O PDD descreve o negócio ou só narra os nós? | **Limitação:** o fluxo só permite narrar nós; o negócio depende das respostas do demandante |
| Identificou dados pessoais/LGPD? | Sim: `nome` (fato) + campos possíveis da resposta (a confirmar) |
| O que está como fato realmente está no fluxo? | Sim, cada fato aponta para um nó/parâmetro |
