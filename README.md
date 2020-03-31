# GNUPlot

***

![graph1](http://www.gnuplot.info/figs/front2.png) ![graph2](http://www.gnuplot.info/figs/gaussians.png)

O melhor utilitário de representação gráfica para Linux

Site oficial: [GNUPlot](http://www.gnuplot.info/)

Ultima atualização: 31/03/2020

# Instalação simples

```
sudo apt install gnuplot
```

Caso queria gráficos com o terminal ```tikz```, então siga a Instalação avançada.

# Instalação avançada

```
versão: 5.2.8

Distro utilizada: Ubuntu 18.04.04 LTS
```

## Dependências

Os pacotes necessários são:

+ automake
+ checkinstall
+ libx11-dev
+ libxt-dev
+ libgd-dev
+ liblua5.3-dev
+ libcairo2-dev
+ libpango1.0-dev
+ libreadline-dev
+ libwxgtk3.0-dev
+ libcanberra-gtk-dev
+ libcerf-dev
+ texlive-full (Eu prefiro instalar tudo!)

você pode copiar e colar no seu terminal a seguinte linha:

```
sudo apt install automake checkinstall libx11-dev libxt-dev libgd-dev liblua5.3-dev libcairo2-dev \
libpango1.0-dev libreadline-dev libwxgtk3.0-dev libcanberra-gtk-dev libcerf-dev
```

Prefiro fazer nessa ordem e depois intalar o LaTeX completo:

```
sudo apt install texlive-full
```

:exclamation: Mas atenção, pode acontecer que você já tenha algum desses pacotes e seu Linux ignore a instalação de outros pacaotes. Caso isso aconteça, instale separadamente pacote por pacote. :sweat_smile:

:bangbang: Pode ocorrer o seguinte erro:

```
# apt install libcairo2-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have ...
```

[Solução](./erros.md)



## Configurações preliminares

Após ter instalado **todas** as depêndencias necessárias, é preciso criar dois *links* simbólicos. Acredito (:thought_balloon:) que para a maioria dos sistemas Linux o diretório não muda, então basta copiar as seguintes linhas:

```
sudo ln -s /usr/lib/x86_64-linux-gnu/pkgconfig/lua5.3.pc /usr/lib/pkgconfig/lua.pc
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.3.so /usr/lib/liblua.so
```

## Configuração final

Agora (ou antes, tanto faz  :stuck_out_tongue:) você deve fazer o *download* do código do programa:

### Download

Versão [5.2.8](http://sourceforge.net/projects/gnuplot/files/)

Ou vá você mesmo no site do GnuPlot: http://www.gnuplot.info caso desconfiar do meu link!

### Instalando

Abra um terminal e vá até onde o *download* foi salvo. Para descompactar você pode utilizar o seguinte comando:

```
tar -xzvf gnuplot-5.2.8.tar.gz
```

Como configurar (configure):

```
cd gnuplot-5.2.8
~/gnuplot-5.2.8 $ ./configure --with-lua=yes --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
--with-cairo > log.txt
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

Seria um pouco difícil de achar os erros sem o `> log.txt`, pois esta mensagem
estaria junto com todas as outras do `./configure`. Se este erro aparecer para
você, então configure de outro modo:

```
~/gnuplot-5.2.8 $ ./configure --with-lua=yes --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
--with-cairo --with-qt=no > log.txt
```

ou

```
~/gnuplot-5.2.8 $ ./configure --with-lua=yes --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
--with-cairo --with-qt=qt4 > log.txt
```

 :bangbang: O importante é achar o caminho correto para o diretório **gnuplot**
dentro do diretório **LaTeX**

***

Para quem quiser se aventurar e utilizar um outro compilador que não seja o gcc,
fique a vontade :sunglasses:

Particularmente, gosto de utilizar os compiladores da Intel. A minha configuração
ficou assim:

```
INTEL="/opt/intel/compilers_and_libraries_2018.1.163/linux" ; export INTEL
./configure --with-readline=gnu --with-lua=yes --with-cairo --with-qt=no \
--with-tutorial --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
CC="icc -O3 -xHost" CPP="icc -EP" CXX="icpc -O3 -xHost" CXXCPP="icpc -EP" \
CPPFLAGS="-g -I$INTEL/compiler/include/intel64 -I$INTEL/compiler/include/" \
CXXFLAGS="-g -I$INTEL/compiler/include/intel64 -I$INTEL/compiler/include/" \
LDFLAGS="-Wl,--start-group $INTEL/mkl/lib/intel64/libmkl_intel_lp64.a \
$INTEL/mkl/lib/intel64/libmkl_sequential.a $INTEL/mkl/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm -ldl" \
CFLAGS="-g -I$INTEL/compiler/include/intel64 -I$INTEL/compiler/include/" > log.txt
```

***

Agora basta compilar, para isso executamos o comando `make` :

```
~/gnuplot-5.2.8 $ make
```

Neste ponto acontecem muitos erros! As mensagens de erro que aparecem mas não
impedem do GNUPlot funcionar são estas:

```
make[2]: Entering directory '/home/dexter/Downloads/gnuplot-5.2.8/docs'
lua ../term/lua/gnuplot-tikz.lua termhelp > gnuplot-tikz.help
/bin/bash: lua: command not found
Makefile:904: recipe for target 'gnuplot-tikz.help' failed
make[2]: *** [gnuplot-tikz.help] Error 127
make[2]: Leaving directory '/home/dexter/Downloads/gnuplot-5.2.2/docs'
Makefile:418: recipe for target 'all-recursive' failed
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory '/home/dexter/Downloads/gnuplot-5.2.2'
Makefile:356: recipe for target 'all' failed
make: *** [all] Error 2
```

Você pocde "checar" se a compilação está correta rodando o seguinte comando:

```
~/gnuplot-5.2.8 $ make check
```

Se estiver tudo certo, aparecerá vários gráficos na tela.

Por fim, você deve entrar como super-usuário :smoking: e:

```
~/gnuplot-5.2.8 $ sudo make install
```
ou já no modo de superusuário:
```
~/gnuplot-5.2.8 # make install
```

Pronto, está instalado, agora vamos testar.

# Teste

## Visual

```
~/gnuplot-5.2.8 $ gnuplot
```

A seguinte mensagem deve aparecer:

```
	G N U P L O T
	Version 5.2 patchlevel 8    last modified 2019-11-15 

	Copyright (C) 1986-1993, 1998, 2004, 2007-2019
	Thomas Williams, Colin Kelley and many others

	gnuplot home:     http://www.gnuplot.info
	faq, bugs, etc:   type "help FAQ"
	immediate help:   type "help"  (plot window: hit 'h')

Terminal type set to 'wxt'
gnuplot>
```

Para um teste rápido, digite `test` e um gráfico deve aparecer

![test-graph](https://github.com/RafaelDexter/GNUPlot/blob/master/img/test.png)

## TiKZ

Siga a sequência de comandos

1

```
gnuplot> set term tikz fulldoc
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
~/gnuplot-5.2.8 $ pdflatex nome.tex && evince nome.pdf
```

Se tudo der certo, um gráfico idêntico ao anterior aparecerá, porém este será
no formato `.pdf` .

:alien:
