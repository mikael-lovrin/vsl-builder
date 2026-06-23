# VSL Builder

Skill do Claude Code que conduz o processo completo de criação de uma VSL de alta conversão, em 5 fases: Briefing de Mercado, Voz do Cliente, Arquitetura do Produto, Plausibilidade e Escrita Bloco a Bloco.

## Antes de começar

Você precisa ter o Claude Code já instalado na máquina.

## Passo 1 — Baixar

Baixe este repositório (botão "Code > Download ZIP" no GitHub, ou `git clone`).

## Passo 2 — Descompactar

Extraia o zip baixado. Vai aparecer uma pasta `vsl-builder` (ou `vsl-builder-main`).

## Passo 3 — Instalar

Entre na pasta e dê dois cliques em `Install.bat`. Ele copia a skill para `%USERPROFILE%\.claude\skills\vsl-builder`, disponível em qualquer projeto.

## Passo 4 — Criar uma pasta dedicada para cada VSL

Antes de usar a skill, crie uma pasta vazia só para essa VSL (ex.: `vsls/produto-x/`) e abra o terminal dentro dela. Não rode a skill direto na pasta do `vsl-builder` ou em uma pasta com outros projetos sensíveis.

Por quê: a skill salva todos os documentos da VSL (`briefing-mercado.md`, `voz-do-cliente.md`, etc.) no diretório onde o Claude Code foi aberto. Uma pasta isolada por VSL evita misturar documentos de projetos diferentes e deixa mais seguro liberar permissões amplas (próximo passo), já que o Claude Code só vai conseguir ler/escrever dentro daquela pasta.

## Passo 5 — Abrir o Claude Code na pasta e rodar com permissões liberadas

Dentro do terminal já aberto na pasta da VSL:

```
claude --dangerously-skip-permissions
```

Isso evita que o Claude Code pare a cada leitura/escrita de arquivo ou busca na web para pedir autorização — a skill faz isso o tempo todo (lê e salva os documentos de cada fase, pesquisa preços e provas na web). Sem o flag, você acaba aprovando manualmente quase toda ação, mesmo sendo sempre a mesma (ler/escrever `.md` no diretório do projeto).

Use esse flag apenas em uma pasta dedicada e isolada (Passo 4) — nunca na raiz do seu usuário ou numa pasta com arquivos sensíveis, porque o flag remove a proteção de confirmação para qualquer ação de arquivo/terminal naquela sessão.

## Passo 6 — Usar

1. Digite `/vsl-builder`.
2. Responda as perguntas do onboarding: cenário (VSLs de concorrentes / do zero / trocar mecanismo), modo de execução (com aprovação a cada etapa ou autônomo, sem pausas) e mercado-alvo (país/idioma de venda).

O agente conduz as 5 fases sozinho, salvando os documentos de cada etapa (`mercado-alvo.md`, `briefing-mercado.md`, `voz-do-cliente.md`, `briefing-produto.md`, `municao-vsl.md`, `roteiro-vsl.md`) no diretório do projeto.

- No **modo com aprovação**, ele pausa em cada ponto de decisão e espera sua resposta.
- No **modo autônomo**, ele só pausa se faltar uma informação que só você pode dar (dados reais do produto, preço, etc.) — fora isso, decide sozinho e avisa o progresso ao final de cada fase.

## Abandonar e retomar entre sessões

A skill mantém um `progress.md` na pasta do projeto com a última fase concluída, o arquivo gerado e o modo de execução escolhido. Você pode fechar o Claude Code no meio do processo sem perder nada: na próxima vez que abrir `/vsl-builder` na mesma pasta, ele lê o `progress.md` e oferece continuar de onde parou, sem repetir as perguntas de onboarding.

## Estrutura

```
vsl-builder/
  Install.bat
  skills/
    vsl-builder/
      SKILL.md                          orquestrador: onboarding + ordem das fases
      prompts/
        fase1-briefing-mercado.md        análise de VSLs de concorrentes
        fase1-criar-do-zero.md          pesquisa de nicho sem VSL de concorrente
        fase2-voz-do-cliente.md         pesquisa de audiência
        fase3-arquitetura-do-produto.md mecanismo, nome do mecanismo, promessa (+ modo "trocar mecanismo")
        fase4-plausibilidade.md         provas verificáveis
        fase5-escrita-bloco-a-bloco.md  roteiro completo, bloco a bloco
```
