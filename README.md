# Simulação CoE — Robô de associados (n8n)

Exercício da Aula 16 (Automação Digital): gerar o **PDD** de um fluxo n8n com apoio de IA, aplicar a
**revisão crítica** e revisar o fluxo com o **checklist do CoE**.

> ⚠️ O fluxo é **propositalmente falho** e as credenciais que aparecem (`sk_live_…HARDCODED`,
> `Coop@2024!`, `10.0.0.9`) são **fictícias, de simulação**. Nunca publique segredos reais.

## Conteúdo

| Caminho | O que é |
|---|---|
| [`workflow/fluxo-original.json`](workflow/fluxo-original.json) | Fluxo n8n a revisar (importar em *Workflows → Import from file*) |
| [`docs/PDD.md`](docs/PDD.md) | PDD no formato do template; fato × `[A CONFIRMAR]`, suposições e perguntas |
| [`review/checklist-revisao-coe.md`](review/checklist-revisao-coe.md) | Checklist de 10 dimensões preenchido (veredito: reprovado) |
| [`review/issues/`](review/issues/) | Um achado por arquivo, prontos para virar issue |
| [`scripts/criar-issues.ps1`](scripts/criar-issues.ps1) | Cria as issues no GitHub via `gh` |

## Para o revisor

1. Importe `workflow/fluxo-original.json` no n8n.
2. Leia `docs/PDD.md` e confira se bate com o fluxo (a revisão crítica está no fim do arquivo).
3. Aplique o checklist e registre achados como **issues** neste repositório.
4. Não corrija o fluxo: primeiro encontre e documente.
