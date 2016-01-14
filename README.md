GNUPlot
=======

[!image](http://www.gnuplot.info/figs/front2.png)

O melhor utilitário de representação gráfica para Linux

Site oficial: [GNUPlot](http://www.gnuplot.info/)

# Instalação simples

```sh
apt-get -f install gnuplot5
```

Caso queria gráficos com qualidade vetorial, então siga a Instalação avançada

# Instalação avançada

## Dependências

Os pacotes necessários são:

+ automake
+ checkinstall
+ libx11-dev
+ libxt-dev
+ libgd2-xpm-dev
+ liblua5.2-dev
+ libcairo2-dev
+ libpango1.0-dev
+ libreadline6-dev
+ libwxgtk3.0-dev

você pode copiar e colar no seu terminal a seguinte linha:

```sh
apt-get -f install automake checkinstall libx11-dev libxt-dev libgd2-xpm-dev  liblua5.2-dev \
libcairo2-dev libpango1.0-dev libreadline6-dev libwxgtk3.0-dev
```
Mas atênção, pode acontecer que você já tenha algum desses pacotes e seu Linix ignore a instalação de outros pacaotes.
Caso isso aconteça, instale separadamente pacote por pacote. :sweat_smile:

## Configurações preliminares

Após ter instalado **todas** as depêndencias necessárias, é preciso criar dois *links* simbólicos. Acredito (:thought_balloon:) que para a maioria dos sistemas Linux o diretório não muda, estão basta copiar as seguintes linhas:

```sh
ln -s /usr/lib/x86_64-linux-gnu/pkgconfig/lua5.2.pc  /usr/lib/pkgconfig/lua.pc
ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so  /usr/lib/liblua.so
```
## Configuração final

Agora você deve fazer o *download* do código do programa:

### Download
Versão [5.0.2](http://sourceforge.net/projects/gnuplot/files/gnuplot/)

### Instalação

Abra um terminal e vá até onde o *download* foi salvo. Para descompactar você pode utilizar o seguinte comando:

```sh
~/Downloads$ tar zxvf gnuplot-5.0.2.tar.gz
```

### Simples

```sh
./configure --with-lua=yes --with-texdir=/usr/share/texmf/tex/latex/gnuplot
make
make install
```

### Recomendada

```sh
./configure --with-readline=gnu --with-lua=yes --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
--with-wx-single-threaded --with-cairo
make
make install
```
