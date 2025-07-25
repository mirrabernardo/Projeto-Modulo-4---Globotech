# Projeto Modulo 4 - Globotech
Projeto Unificado - Fase 4: Sistema de análise de engajamento com persistência em banco de dados relacional.

## Como rodar o projeto localmente

Siga os passos abaixo para garantir que o projeto funcione corretamente em seu ambiente local:

### 1. Clonar o repositório

```bash
git clone https://github.com/mirrabernardo/Projeto-Modulo-4---Globotech
cd Projeto-Modulo-4---Globotech
```

### 2. Importar o schema no MySQL

- Acesse o MySQL Workbench.
- Crie um novo schema com o nome desejado.
- Execute o conteúdo do arquivo `schema_globotech.sql` para criar as tabelas necessárias.

### 3. Criar o arquivo `.env`

- Copie o arquivo `.env.example` e renomeie para `.env`.
- Edite os valores conforme as credenciais do seu ambiente local:

```
DB_HOST=localhost
DB_USER=seu_usuario
DB_PASSWORD=sua_senha
DB_NAME=nome_do_schema
```

### 4. Criar e ativar o ambiente virtual

```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate   # Windows
```

### 5. Instalar dependências

```bash
pip install -r requirements.txt
```
### 6. Carregar dados

Execute o arquivo `carga_dados.py` para popular o banco de dados criado localmente.

>### Arquivo `testes.py`
>Este arquivo foi criado para a realização de testes de consultas durante a fase de desenvolvimento do projeto. Ele está disponível para que qualquer pessoa que clone o repositório possa utilizá-lo como base para validar o projeto e experimentar consultas SQL.

---
### Estrutura do Repositório
*Essa deve ser a estrutura do repositório após seguir os passos acima.*

```mermaid
📁 Projeto-Modulo-4---Globotech
├── 📁 docs
│   ├── diagrama-entidade-relacionamento.jpg
│   ├── diagrama-mermaid-fase2.png
│   ├── interacoes_globo.csv
│   └── modelo-entidade-relacionamento.png
│
├── 📁 python
│   ├── __pycache__/
│   ├── carga_dados.py
│   ├── conexao_bd.py
│   ├── consultas.py
│   ├── modelo_conexao.py
│   └── testes.py
│
├── 📁 sql
│   ├── consulta_1.sql
│   ├── consulta_2.sql
│   ├── consulta_3.sql
│   └── schema_globotech.sql
│
├── 📁 venv
│   └── (ambiente virtual)
│
├── .env
├── .env.example
├── .gitignore
├── LICENSE
├── README.md
└── requirements.txt

```


## Divisão de tarefas e papéis

| **Integrante** | **Papel**                              | **Tarefas Previstas** |
|----------------|----------------------------------------|------------------------|
| **Mirra**      | Responsável técnica e organizacional   | - Modelagem de Dados (MER e DER) (etapa 1) <br> - Criação e Validação do schema.sql (etapa 2) <br> - Script para inserção de dados (etapa 3) <br> - Revisão final e integração (etapa 5) <br> - Criação dos slides da apresentação (etapa 6) |
| **Tales**      | Programador em par (condutor)          | - Inserção de dados (etapa 3) <br> - Teste de consistência (etapa 3) <br> - Implementação de consulta SQL (etapa 4) <br> - Suporte na validação final (etapa 5) |
| **Diego**      | Guia Técnico (co-piloto)               | - Inserção de dados (etapa 3) <br> - Validação da carga(etapa 3) <br> - Implementação de consulta SQL (etapa 4) <br> - Apoio à integração (etapa 5) |
| **André**      | Guia Técnico (co-piloto)               | - Implementação de consulta SQL (etapa 4) <br> - Validação do schema e testes (etapa 4) <br> - Apoio à integração (etapa 5) |
| **Marcelo**    | Programador em par (condutor)          | - Implementação de consulta SQL (etapa 4) <br> - Validação do schema (etapa 4) <br> - Apoio à integração (etapa 5) |

## Projetos Anteriores

🔗 [Projeto‑Modulo‑1 — Globotech](https://github.com/mirrabernardo/Projeto-Modulo-1---Globotech)  
**Fase 1 – Análise de Engajamento com Python Puro**  
Projeto desenvolvido com Python padrão, sem dependências externas. Implementa scripts para leitura, limpeza e validação de interações em CSV.

🔗 [Projeto‑Modulo‑2 — Globotech](https://github.com/mirrabernardo/Projeto-Modulo-2---Globotech)  
**Fase 2 – Evolução com Programação Orientada a Objetos (POO)**  
Refatoração do sistema usando POO com lógica de processamento orquestrada pela classe SistemaAnaliseEngajamento.

🔗 [Projeto‑Modulo‑3 — Globotech](https://github.com/mirrabernardo/Projeto-Modulo-3---Globotech)  
**Fase 3 – Estruturas de Dados: Fila e Árvore Binária (BST)**  
Implementação de ingestão via fila FIFO e gerenciamento de dados através de árvores binárias de busca (BST) para armazenar e buscar usuários e conteúdos de forma eficiente.


## Equipe do Projeto

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/mirrabernardo">
        <img src="https://github.com/user-attachments/assets/12e2f501-e8a0-41f6-9116-c99a9f579b24" width="96" height="96"><br>
        <strong>Mirra</strong>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/TalesHonorio">
        <img src="https://github.com/user-attachments/assets/e046c0c6-42bf-454f-b26e-43ce558048a3" width="96" height="96"><br>
        <strong>Tales</strong>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/Diego-Teixeira-dev">
        <img src="https://github.com/user-attachments/assets/8847641e-31a1-484e-b4f4-3163ce9bfc37" width="96" height="96"><br>
        <strong>Diego</strong>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/andrelassis">
        <img src="https://github.com/user-attachments/assets/782a64f3-7569-4063-bd26-6e1c0353ca19" width="96" height="96"><br>
        <strong>André</strong>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/MarceloZilotti">
        <img src="https://github.com/user-attachments/assets/761f722f-a11a-47f0-857b-67dc44f98c44" width="96" height="96"><br>
        <strong>Marcelo</strong>
      </a>
    </td>
  </tr>
</table>

