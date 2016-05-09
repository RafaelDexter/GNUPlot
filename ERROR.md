Tentarei aqui ajudar com alguns erros na instalação do [GNUPlot](https://github.com/RafaelDexter/GNUPlot/wiki/GNUPlot).

# Índice
+ [Dependências](https://github.com/RafaelDexter/GNUPlot/wiki/ERROR#depend%C3%AAncias)
+ [Configurações preliminares](https://github.com/RafaelDexter/GNUPlot/wiki/ERROR#configura%C3%A7%C3%B5es-preliminares)
+ [Configuração final](https://github.com/RafaelDexter/GNUPlot/wiki/ERROR#configura%C3%A7%C3%A3o-final)
  + [Make](https://github.com/RafaelDexter/GNUPlot/wiki/ERROR#make)

## Dependências
Nada... :swimmer:

## Configurações preliminares
Nada... :swimmer:

## Configuração final

### Make
Provavelmente o **GNUPlot** não encontrou o diretório:

```
/usr/share/texmf/tex/latex/gnuplot
```

Verifique o diretório! Pode ser também que não tenha o pacote `gnuplot-tex`  :package:
tente instalá-lo.

 :black_square_button: **Makefile:911: recipe for target 'term.o' failed**

Adicione no `./configure` mais isso `LUA_CFLAGS=-I/usr/include/lua5.2`

 :black_square_button: **Makefile:983: recipe for target 'qtterminal/qt_term.o' failed**

????Adicione no `./configure` mais isso `QT_CFLAGS=-I/usr/include/qt4/QtCore`

```
/usr/bin/ld: wxterminal/wxt_gui.o: undefined reference to symbol 'XInitThreads'
//usr/lib/x86_64-linux-gnu/libX11.so.6: error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status
Makefile:787: recipe for target 'gnuplot' failed
```