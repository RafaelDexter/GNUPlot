# GNUPlot
O melhor utilitário de representação gráfica para Linux

Site oficial: [GNUPlot](http://www.gnuplot.info/)

# Instalação simples

```sh
apt-get -f install gnuplot5
```


# Instalação avançada

## Download
Versão [5.0.1](http://sourceforge.net/projects/gnuplot/files/gnuplot/)

## Dependências
```sh
apt-get -f install automake checkinstall libx11-dev libxt-dev libgd2-xpm-dev  liblua5.2-dev \
libcairo2-dev libpango1.0-dev libreadline6-dev libwxgtk3.0-dev
```
## Configurações preliminares
```sh
ln -s /usr/lib/x86_64-linux-gnu/pkgconfig/lua5.2.pc  /usr/lib/pkgconfig/lua.pc
ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so  /usr/lib/liblua.so
```
## Configuração final

### Simples

### Recomendada

```sh
./configure --with-readline=gnu --with-lua=yes --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
--with-wx-single-threaded --with-cairo
make
make install
```
