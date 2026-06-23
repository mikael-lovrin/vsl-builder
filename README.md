# VSL Builder

Skill do Claude Code que conduz o processo completo de criação de uma VSL de alta conversão, em 5 fases: Bíblia do Nicho, Voz do Cliente, Arquitetura do Produto, Plausibilidade e Escrita Bloco a Bloco.

## Antes de começar

Você precisa ter o Claude Code já instalado na máquina.

## Passo 1 — Baixar

Baixe este repositório (botão "Code > Download ZIP" no GitHub, ou `git clone`).

## Passo 2 — Descompactar

Extraia o zip baixado. Vai aparecer uma pasta `vsl-builder` (ou `vsl-builder-main`).

## Passo 3 — Instalar

Entre na pasta e dê dois cliques em `Install.bat`. Ele copia a skill para `%USERPROFILE%\.claude\skills\vsl-builder`, disponível em qualquer projeto.

## Passo 4 — Usar

1. Abra o Claude Code.
2. Digite `/vsl-builder`.
3. Responda a pergunta inicial: você tem VSLs de concorrentes para analisar, vai criar do zero, ou já tem uma Bíblia do Nicho validada e só quer trocar o mecanismo?

O agente conduz as 5 fases sozinho, salvando os documentos de cada etapa (`biblia-do-nicho.md`, `voz-do-cliente.md`, `briefing-produto.md`, `municao-vsl.md`, `roteiro-vsl.md`) no diretório do projeto, e só pausa quando precisa de uma decisão ou informação sua.

## Estrutura

```
vsl-builder/
  Install.bat
  skills/
    vsl-builder/
      SKILL.md                          orquestrador: onboarding + ordem das fases
      prompts/
        fase1-biblia-do-nicho.md        análise de VSLs de concorrentes
        fase1-criar-do-zero.md          pesquisa de nicho sem VSL de concorrente
        fase2-voz-do-cliente.md         pesquisa de audiência
        fase3-arquitetura-do-produto.md mecanismo, nome chiclete, promessa (+ modo "trocar mecanismo")
        fase4-plausibilidade.md         provas verificáveis
        fase5-escrita-bloco-a-bloco.md  roteiro completo, bloco a bloco
```
