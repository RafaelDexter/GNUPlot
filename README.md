# GNUPlot

***

![graph1](http://www.gnuplot.info/figs/front2.png) ![graph2](http://www.gnuplot.info/figs/gaussians.png)

O melhor utilitário de representação gráfica para Linux

Site oficial: [GNUPlot](http://www.gnuplot.info/)

# Instalação simples

```
# apt-get -f install gnuplot5
```

Caso queria gráficos com qualidade vetorial, então siga a Instalação avançada.

# Instalação avançada

## Dependências

Os pacotes necessários são:

+ automake
+ checkinstall
+ libx11-dev
+ libxt-dev
+ libgd2-xpm-dev
+ liblua5.3-dev
+ libcairo2-dev
+ libpango1.0-dev
+ libreadline6-dev
+ libwxgtk3.0-dev
+ libcanberra-gtk-dev
+ libcerf-dev

você pode copiar e colar no seu terminal a seguinte linha:

```
# apt-get -f install automake checkinstall libx11-dev libxt-dev libgd2-xpm-dev \
liblua5.3-dev libcairo2-dev libpango1.0-dev libreadline6-dev libwxgtk3.0-dev libcanberra-gtk-dev libcerf-dev
```
:exclamation: Mas atenção, pode acontecer que você já tenha algum desses pacotes e seu Linux ignore a instalação de outros pacaotes. Caso isso aconteça, instale separadamente pacote por pacote. :sweat_smile:

:bangbang: Pode ocorrer o seguinte erro:

```
# apt-get install libcairo2-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have ...
```

[Solução](erros.md)



## Configurações preliminares

Após ter instalado **todas** as depêndencias necessárias, é preciso criar dois *links* simbólicos. Acredito (:thought_balloon:) que para a maioria dos sistemas Linux o diretório não muda, estão basta copiar as seguintes linhas:

```
# ln -s /usr/lib/x86_64-linux-gnu/pkgconfig/lua5.2.pc /usr/lib/pkgconfig/lua.pc
# ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so /usr/lib/liblua.so
```
## Configuração final

Agora (ou antes, tanto faz  :stuck_out_tongue:) você deve fazer o *download* do código do programa:

### Download

Versão [5.0.5](http://sourceforge.net/projects/gnuplot/files/)

### Instalando

Abra um terminal e vá até onde o *download* foi salvo. Para descompactar você pode utilizar o seguinte comando:

```
$ tar -xzvf gnuplot-5.0.5.tar.gz
```

Configure:

```
$ cd gnuplot-5.0.5
~/gnuplot-5.0.5$ ./configure --with-lua=yes --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
--with-wx-single-threaded --with-cairo > log.txt
```
Se você estiver se perguntando "por que tem `> log.txt` ?" Este último parâmetro quer dizer que vou "jogar" toda a saída do `./configure` para o arquivo `log.txt`. Talvez você já sabia disso, mas o que você não sabe é que com esse parâmetro podemos identificar melhor as bibliotecas que estão faltando! Por exemplo:

```
configure: WARNING:
Package requirements (Qt5Core Qt5Gui Qt5Network Qt5Svg Qt5PrintSupport) were not met:

No package 'Qt5Core' found
No package 'Qt5Gui' found
No package 'Qt5Network' found
No package 'Qt5Svg' found
No package 'Qt5PrintSupport' found
```

Seria um pouco difícil de achar o erros sem o `> log.txt`, pois esta mensagem
estaria junto com todas as outras do `./configure`. Se este erro aparecer para
você, então configure de outro modo:

```
~/gnuplot-5.0.5$ ./configure --with-lua=yes --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
--with-wx-single-threaded --with-cairo --with-qt=no > log.txt
```

ou

```
~/gnuplot-5.0.5$ ./configure --with-lua=yes --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
--with-wx-single-threaded --with-cairo --with-qt=qt4 > log.txt
```

 :bangbang: O importante é achar o caminho correto para o diretório **gnuplot**
dentro do diretório **latex**

***

Para quem quiser se aventurar e utilizar um outro compilador que não seja o gcc,
fique a vontade :sunglasses:

Particularmente, gosto de utilizar os compiladores da Intel. A minha configuração
ficou assim:

```
~/gnuplot-5.0.5$./configure --with-lua=yes --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
--with-wx-single-threaded --with-cairo --with-qt=no CXX=icpc CXXCPP='icpc -E' \
CPPFLAGS='-g -O3 -I/opt/intel/compilers_and_libraries_2016.2.181/linux/compiler/include/intel64 -I/opt/intel/compilers_and_libraries_2016.2.181/linux/compiler/include/' \
CXXFLAGS='-g -O3 -I/opt/intel/compilers_and_libraries_2016.2.181/linux/compiler/include/intel64 -I/opt/intel/compilers_and_libraries_2016.2.181/linux/compiler/include/' \
CFLAGS='-g -O3 -I/opt/intel/compilers_and_libraries_2016.2.181/linux/compiler/include/intel64 -I/opt/intel/compilers_and_libraries_2016.2.181/linux/compiler/include/' \
CC=icc CPP='icc -E' > log.txt
```

***

Agora basta compilar, para isso executamos o comando `make` :

```
~/gnuplot-5.0.5$ make
```

Neste ponto acontecem muitos erros! Uma mensagem de erro que aparece mas não
impede do GNUPlot funcionar é esta:

```
make[2]: Entering directory '/home/dexter/Downloads/gnuplot-5.0.3/docs'
lua ../term/lua/gnuplot-tikz.lua termhelp > gnuplot-tikz.help
/bin/bash: lua: command not found
Makefile:904: recipe for target 'gnuplot-tikz.help' failed
make[2]: *** [gnuplot-tikz.help] Error 127
make[2]: Leaving directory '/home/dexter/Downloads/gnuplot-5.0.3/docs'
Makefile:418: recipe for target 'all-recursive' failed
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory '/home/dexter/Downloads/gnuplot-5.0.3'
Makefile:356: recipe for target 'all' failed
make: *** [all] Error 2
```

Você pocde "checar" se a compilação está correta rodando o seguinte comando:

```
root@dexter:~/gnuplot-5.0.5$ make check
```

Se estiver tudo certo, aparecerá vários gráficos na tela.

Por fim, você deve entrar como super-usuário :smoking: e:

```
~/gnuplot-5.0.5# make install
```

Pronto, está instalado, agora vamos testar.

# Teste

## Visual

```
~/gnuplot-5.0.3$ gnuplot
```

A seguinte mensagem deve aparecer:

```
	G N U P L O T
	Version 5.0 patchlevel 3    last modified 2016-02-21 

	Copyright (C) 1986-1993, 1998, 2004, 2007-2016
	Thomas Williams, Colin Kelley and many others

	gnuplot home:     http://www.gnuplot.info
	faq, bugs, etc:   type "help FAQ"
	immediate help:   type "help"  (plot window: hit 'h')

Terminal type set to 'qt'
gnuplot>
```

Para um teste rápido, digite `test` e um gráfico deve aparecer

![test-graph](https://github.com/RafaelDexter/GNUPlot/blob/master/img/test.png)

## TiKZ

Siga a sequência de comandos

1

```
Terminal type set to 'qt'
gnuplot> set term tikz fulldoc
Terminal type set to 'tikz'
Options are 'latex nopreamble color standalone nogparrows notikzarrows nogppoints
picenvironment nooriginreset bitmap rgbimage noclip notightboundingbox noexternalimages '
```

2

```
gnuplot> set output "nome.tex"
```

3

```
gnuplot> test
```

4

```
gnuplot> q
```

5

```
~/gnuplot-5.0.5$ pdflatex nome.tex && evince nome.pdf
```

Se tudo der certo, um gráfico idêntico ao anterior aparecerá, porém este será
no formato `.pdf` .

:alien:
