# Simulação CoE — Robô de associados (n8n)

Projeto universitário da disciplina **Automação Digital** (Aula 16): gerar o **PDD** de um fluxo n8n com
apoio de IA e aplicar a **revisão crítica** sobre o rascunho gerado.

> ⚠️ O fluxo é **propositalmente falho** e as credenciais que aparecem (`sk_live_…HARDCODED`,
> `Coop@2024!`, `10.0.0.9`) são **fictícias, de simulação**. Nunca publique segredos reais.

## Conteúdo

| Caminho | O que é |
|---|---|
| [`workflow/fluxo-original.json`](workflow/fluxo-original.json) | Fluxo n8n (importar em *Workflows → Import from file*) |
| [`docs/PDD.md`](docs/PDD.md) | PDD no formato do template: fato × `[A CONFIRMAR]`, suposições, perguntas ao demandante e revisão crítica |

## Para o revisor

1. Importe `workflow/fluxo-original.json` no n8n.
2. Leia o `docs/PDD.md` e confira se ele bate com o fluxo.
3. Aplique o **Checklist de revisão do CoE** ao fluxo e registre cada problema como uma **issue** neste repositório.
4. Não corrija o fluxo: primeiro encontre e documente.
