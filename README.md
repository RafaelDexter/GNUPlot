# GNUPlot

***

![graph1](http://www.gnuplot.info/figs/front2.png) ![graph2](http://www.gnuplot.info/figs/gaussians.png)

O melhor utilitário de representação gráfica para Linux

Site oficial: [GNUPlot](http://www.gnuplot.info/)

                    08/10/2023  
Ultima atualização: 16/07/2024

# Instalação simples

```
sudo apt install gnuplot
```

Caso queria gráficos com o terminal ```tikz```, então siga a Instalação avançada.

# Instalação avançada

```
versão: 5.4.9

Distro utilizada: Ubuntu 24.04 LTS
```

## Dependências

Os pacotes necessários são:

+ automake
+ checkinstall
+ libx11-dev
+ libxt-dev
+ libgd-dev
+ libreadline-dev
+ liblua5.4-dev
+ libcairo2-dev
+ libpango1.0-dev
+ libwxgtk3.2-dev
+ libcanberra-gtk-dev
+ libcerf-dev
+ lua5.4
+ texlive-full (Eu prefiro instalar tudo!)

você pode copiar e colar no seu terminal a seguinte linha:

```
sudo apt install automake checkinstall libx11-dev libxt-dev libgd-dev libreadline-dev liblua5.4-dev libcairo2-dev \
libpango1.0-dev libwxgtk3.2-dev libcanberra-gtk-dev libcerf-dev lua5.4
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
sudo ln -s /usr/lib/x86_64-linux-gnu/pkgconfig/lua5.4.pc /usr/lib/pkgconfig/lua.pc
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.4.so /usr/lib/liblua.so
```

## Configuração final

Agora (ou antes, tanto faz  :stuck_out_tongue:) você deve fazer o *download* do código do programa:

### Download

Versão [5.4.9](http://sourceforge.net/projects/gnuplot/files/)

Ou vá você mesmo no site do GnuPlot: http://www.gnuplot.info caso desconfiar do meu link!

### Instalando

Abra um terminal e vá até onde o *download* foi salvo. Para descompactar você pode utilizar o seguinte comando:

```
tar -xzvf gnuplot-5.4.9.tar.gz
```

Como configurar (configure):

```
cd gnuplot-5.4.9
~/gnuplot-5.4.9 $ ./configure --with-lua=yes --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
--with-cairo
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
~/gnuplot-5.4.9 $ ./configure --with-lua=yes --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
--with-cairo --with-qt=no > log.txt
```

ou, com o terminal QT, 

```
~/gnuplot-5.4.9 $ ./configure --with-lua=yes --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
--with-cairo --with-qt=qt4 > log.txt
```

 :bangbang: O importante é achar o caminho correto para o diretório **gnuplot**
dentro do diretório **LaTeX**

Agora basta compilar, para isso executamos o comando `make` :

```
~/gnuplot-5.4.9 $ make
```

Neste ponto acontecem muitos erros! 

Você pocde "checar" se a compilação está correta rodando o seguinte comando:

```
~/gnuplot-5.4.9 $ make check
```

Se estiver tudo certo, aparecerá vários gráficos na tela.

Por fim, você deve entrar como super-usuário :smoking: e:

```
~/gnuplot-5.4.9 $ sudo make install
```
ou já no modo de superusuário:
```
~/gnuplot-5.4.9 # make install
```

Pronto, está instalado, agora vamos testar.

# Teste

## Visual

```
~/gnuplot-5.4.9 $ gnuplot
```

A seguinte mensagem deve aparecer:

```
	G N U P L O T
	Version 5.4 patchlevel 9    last modified 2023-09-04

	Copyright (C) 1986-1993, 1998, 2004, 2007-2023
	Thomas Williams, Colin Kelley and many others

	gnuplot home:     http://www.gnuplot.info
	faq, bugs, etc:   type "help FAQ"
	immediate help:   type "help"  (plot window: hit 'h')

Terminal type is now 'wxt'
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
~/gnuplot-5.4.9 $ pdflatex nome.tex && evince nome.pdf
```

Se tudo der certo, um gráfico idêntico ao anterior aparecerá, porém este será
no formato `.pdf` .

:alien:
