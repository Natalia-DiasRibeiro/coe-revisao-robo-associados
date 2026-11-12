[Credenciais] Usuário, senha e string de conexão do banco em texto puro no nó `dados`
seguranca,credenciais,severidade:critica
**Dimensão do checklist:** Credenciais

**Onde:** nó `dados` (Set): `db_user`, `db_password`, `conn`.

**Problema:** senha de banco escrita no fluxo, repetida dentro da string de conexão (`Server=10.0.0.9;...;Password=...`). Como o nó propaga os campos para os seguintes, o segredo também é enviado para `HTTP Request2` e gravado nos dados de cada execução. Além disso o banco nem é usado pelo fluxo (ver issue de estrutura).

**Sugestão (não aplicada):** remover o nó; se o banco for necessário, usar *Credentials* do n8n com usuário de menor privilégio; **trocar a senha** por considerá-la exposta.

**Critério de aceite:** nenhuma senha no fluxo ou nas execuções; senha antiga trocada.
