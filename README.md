# the_druids_of_edora

## Desenvolvimento

Use `make help` para consultar os comandos disponíveis. `make check` verifica a formatação, executa `flutter analyze` e roda os testes. `make run` inicia o app; use `DEVICE=<id>` para escolher um dispositivo.

## Release

O alvo `make release BRANCH=codex/minha-alteracao` chama `/Users/rudsonalves/.bin/release`. O script executa as verificações, gera a entrada do `CHANGELOG.md` a partir das alterações, pede revisão interativa do texto, cria a branch de release quando necessário, faz o commit e envia a branch para `origin`.

Execute-o em um terminal interativo. A branch informada deve ser nova ou a branch atual de uma release interrompida; `main` não é aceita. Para pular apenas os testes, use `make release BRANCH=codex/minha-alteracao RELEASE_FLAGS=--skip-tests`. O diretório temporário `.commit/` é ignorado pelo Git. O script também requer `codex`, `less`, `git` e o editor configurado em `RELEASE_EDITOR` (por padrão, `vim`).

# the_druids_of_edora
