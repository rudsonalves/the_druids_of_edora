SHELL := /bin/bash
.DEFAULT_GOAL := help

FLUTTER ?= flutter
RELEASE ?= /Users/rudsonalves/.bin/release
BRANCH ?=
RELEASE_FLAGS ?=
DEVICE ?=
ARGS ?=

.PHONY: help get format format-check analyze test check run devices build-apk build-aab status gitlog release

help: ## Exibe os comandos disponíveis
	@awk 'BEGIN {FS = ":.*##"; printf "\nComandos:\n"} /^[a-zA-Z0-9_.-]+:.*##/ { printf "  %-16s %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

get: ## Instala as dependências Flutter
	@$(FLUTTER) pub get

format: ## Formata os arquivos Dart de lib e test
	@dart format lib test

format-check: ## Verifica a formatação sem alterar arquivos
	@dart format --output=none --set-exit-if-changed lib test

analyze: ## Executa a análise estática
	@$(FLUTTER) analyze

test: ## Executa os testes
	@$(FLUTTER) test

check: format-check analyze test ## Verifica formatação, análise e testes

devices: ## Lista os dispositivos disponíveis
	@$(FLUTTER) devices

run: ## Executa o app (DEVICE=id opcional; ARGS="..." opcional)
	@$(FLUTTER) run $(if $(DEVICE),-d "$(DEVICE)") $(ARGS)

build-apk: ## Gera um APK de depuração
	@$(FLUTTER) build apk --debug

build-aab: ## Gera o AAB de release assinado para o Google Play
	@test -s android/key.properties || { echo "Configure android/key.properties com a chave de upload antes de gerar o AAB." >&2; exit 2; }
	@$(FLUTTER) build appbundle --release

status: ## Exibe o estado do repositório
	@git status --short

gitlog: ## Exibe o histórico resumido
	@git log --oneline -10

release: ## Gera CHANGELOG, commit e push (BRANCH=nome; RELEASE_FLAGS="--skip-tests")
	@test -n "$(BRANCH)" || { echo "Informe BRANCH=nome-da-branch" >&2; exit 2; }
	@"$(RELEASE)" $(RELEASE_FLAGS) "$(BRANCH)"
