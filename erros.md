# Erros

## Dependências

**Lua**
Uma vez tive um problema para instalar a versão mais recente do Lua. Se você tiver com esse problema tente instalar as versões mais antigas ou as mais novas que aparecem em sua lista (apt search liblua) do ```apt``` . Lembre-se de fazer corentamente os links sibólicos:

```
sudo ln -s /usr/lib/x86_64-linux-gnu/pkgconfig/lua5.X.pc /usr/lib/pkgconfig/lua.pc
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.X.so /usr/lib/liblua.so
```

### Problema

```
# apt-get install libcairo2-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have ...
```

### Solução

Old! Esse problema era para o Debian

```
# apt-get -t jessie-backports install libcairo2-dev
```

Para que funcione esta solução, você deve ter o repositório *backports*. Para adicionar este acrescente
a seguinte linha no arquivo `/etc/apt/sources.list`:

```
deb http://ftp.debian.org/debian jessie-backports main
```

e atualize com o comando

```
# apt-get update
```
