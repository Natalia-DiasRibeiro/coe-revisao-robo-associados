[Credenciais] Chave de API em texto puro na URL do HTTP Request1
seguranca,credenciais,severidade:critica
**Dimensão do checklist:** Credenciais

**Onde:** nó `HTTP Request1`, parâmetro `url`: `...?status=ativo&apikey=sk_live_...HARDCODED`.

**Problema:** segredo escrito no fluxo, e ainda **na query string**, que aparece em logs de servidor, proxies e histórico de execuções. O prefixo `sk_live_` indica chave de **produção**. Quem exportar/versionar o JSON expõe a chave.

**Sugestão (não aplicada):** mover para *Credentials* do n8n (header de autenticação, não query string); **rotacionar** a chave atual por considerá-la vazada; usar menor privilégio (somente leitura de associados).

**Critério de aceite:** nenhum segredo no JSON do fluxo; chave antiga revogada.
