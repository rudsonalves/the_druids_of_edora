# the_druids_of_edora

## Desenvolvimento

Use `make help` para consultar os comandos disponíveis. `make check` verifica a formatação, executa `flutter analyze` e roda os testes. `make run` inicia o app; use `DEVICE=<id>` para escolher um dispositivo.

## AAB para o Google Play

Configure `android/key.properties` com a chave de upload do aplicativo. O arquivo é ignorado pelo Git. Use um caminho absoluto para o arquivo da chave ou um caminho relativo ao diretório `android/`.

```properties
storeFile=/caminho/para/upload.jks
storePassword=SENHA_DO_ARQUIVO
keyAlias=ALIAS_DA_CHAVE
keyPassword=SENHA_DA_CHAVE
```

Execute `make build-aab` para gerar o bundle de release assinado em `build/app/outputs/bundle/release/app-release.aab`. O nome e o código da versão vêm do campo `version` do `pubspec.yaml`.

## Release

O alvo `make release BRANCH=codex/minha-alteracao` chama `/Users/rudsonalves/.bin/release`. O script executa as verificações, gera a entrada do `CHANGELOG.md` a partir das alterações, pede revisão interativa do texto, cria a branch de release quando necessário, faz o commit e envia a branch para `origin`.

Execute-o em um terminal interativo. A branch informada deve ser nova ou a branch atual de uma release interrompida; `main` não é aceita. Para pular apenas os testes, use `make release BRANCH=codex/minha-alteracao RELEASE_FLAGS=--skip-tests`. O diretório temporário `.commit/` é ignorado pelo Git. O script também requer `codex`, `less`, `git` e o editor configurado em `RELEASE_EDITOR` (por padrão, `vim`).

# the_druids_of_edora

## Licença

O código original deste projeto é licenciado sob a GNU General Public License, versão 3 (GPL-3.0-only). Consulte o texto integral em [LICENSE](LICENSE).

Manuais, imagens e outros materiais de terceiros mantêm os direitos e termos de seus respectivos titulares. As dependências mantêm suas próprias licenças.
