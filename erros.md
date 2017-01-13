# Erros

## Dependências

### Problema

```
# apt-get install libcairo2-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have ...
```

### Solução

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
