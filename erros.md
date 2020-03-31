# Erros


## Lua

Ele compilou mas não aparadeceu os gráficos no `make check` e o seguinte erro apareceu:

```
make[3]: Leaving directory '/home/dxt/Downloads/gnuplot-5.2.8/src'
make[2]: Leaving directory '/home/dxt/Downloads/gnuplot-5.2.8/src'
make[1]: Leaving directory '/home/dxt/Downloads/gnuplot-5.2.8/src'
Making check in docs
make[1]: Entering directory '/home/dxt/Downloads/gnuplot-5.2.8/docs'
lua ../term/lua/gnuplot-tikz.lua termhelp > gnuplot-tikz.help
/bin/bash: lua: command not found
Makefile:898: recipe for target 'gnuplot-tikz.help' failed
make[1]: *** [gnuplot-tikz.help] Error 127
make[1]: Leaving directory '/home/dxt/Downloads/gnuplot-5.2.8/docs'
Makefile:417: recipe for target 'check-recursive' failed
make: *** [check-recursive] Error 1
```

Uma vez tive um problema para instalar a versão mais recente do Lua. Se você tiver com esse problema tente instalar as versões mais antigas ou as mais novas que aparecem em sua lista (apt search liblua) do ```apt``` . Lembre-se de fazer corentamente os links sibólicos:


No meu caso a solução foi fazer o seguinte, primeiro remover os links simbólicos:

```
sudo rm /usr/lib/liblua.so
sudo rm /usr/lib/pkgconfig/lua.pc
```

Segundo, remover o lua que foi instalado e intalar a versão anterior:

```
sudo apt remove liblua5.3-dev
sudo apt instal liblua5.2-dev
```

Criar novos links simbólicos:

```
sudo ln -s /usr/lib/x86_64-linux-gnu/pkgconfig/lua5.2.pc /usr/lib/pkgconfig/lua.pc
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so /usr/lib/liblua.so
```

Agora é só rodar o `configure`, `make` e `make check`. Aparecendo os gráficos é só instalar!

## libcairo2-dev

```
# apt-get install libcairo2-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have ...
```

Old! Esse problema era para o Debian

```
# apt-get -t jessie-backports install libcairo2-dev
```

Para que funcione esta solução, você deve ter o repositório *backports*. Para adicionar este acrescente
a seguinte linha no arquivo `/etc/apt/sources.list`:

```
sudo echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list
```

e atualize com o comando

```
# apt-get update
```
