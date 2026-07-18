# GNUPlot 6.0.1 — Compilação no Ubuntu 24.04 LTS

> Guia de compilação do GNUPlot a partir do código-fonte, com suporte aos terminais `tikz`, `cairo` e `lua`.

| | |
|---|---|
| **Versão do GNUPlot** | 6.0.1 |
| **Distribuição** | Ubuntu 24.04 LTS (Noble Numbat) |
| **Criado em** | 08/10/2023 |
| **Última atualização** | 16/07/2024 |

---

## Sumário

1. [Instalação simples](#1-instalação-simples)
2. [Dependências](#2-dependências)
3. [Links simbólicos do Lua](#3-links-simbólicos-do-lua)
4. [Download do código-fonte](#4-download-do-código-fonte)
5. [Configuração e compilação](#5-configuração-e-compilação)
6. [Instalação](#6-instalação)
7. [Testes](#7-testes)
8. [Solução de problemas](#8-solução-de-problemas)

---

## 1. Instalação simples

Se você **não** precisa do terminal `tikz`, instale diretamente dos repositórios oficiais:

```bash
sudo apt install gnuplot
```

Caso queira gráficos com o terminal `tikz`, siga a compilação a partir da seção 2.

## 2. Dependências

Pacotes necessários para a compilação:

| Pacote | Finalidade |
|---|---|
| `automake`, `checkinstall` | Ferramentas de compilação |
| `libx11-dev`, `libxt-dev` | Suporte ao X11 |
| `libgd-dev` | Terminais de imagem (png, gif, jpeg) |
| `libreadline-dev` | Edição de linha no prompt interativo |
| `lua5.4`, `liblua5.4-dev` | Terminal `tikz` (via Lua) |
| `libcairo2-dev`, `libpango1.0-dev` | Terminais `cairolatex`, `pdfcairo`, `pngcairo` |
| `libwxgtk3.2-dev`, `libcanberra-gtk-dev` | Terminal `wxt` |
| `libcerf-dev` | Funções de erro complexas |
| `texlive-full` | Distribuição LaTeX completa |

Instalação em um único comando:

```bash
sudo apt install automake checkinstall libx11-dev libxt-dev libgd-dev \
libreadline-dev liblua5.4-dev libcairo2-dev libpango1.0-dev \
libwxgtk3.2-dev libcanberra-gtk-dev libcerf-dev lua5.4
```

Em seguida, o LaTeX completo:

```bash
sudo apt install texlive-full
```

> ⚠️ **Atenção:** se algum desses pacotes já estiver instalado, o `apt` pode ignorar a instalação de outros. Nesse caso, instale os pacotes individualmente, um por um.

> ❗ Caso ocorra erro de dependências quebradas ao instalar `libcairo2-dev` (mensagem `Some packages could not be installed...`), consulte a [solução](./erros.md).

## 3. Links simbólicos do Lua

O `./configure` procura o Lua em caminhos genéricos (`lua.pc` e `liblua.so`), mas o Ubuntu instala os arquivos com sufixo de versão. Crie os dois *links* simbólicos:

```bash
sudo ln -s /usr/lib/x86_64-linux-gnu/pkgconfig/lua5.4.pc /usr/lib/pkgconfig/lua.pc && \
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.4.so /usr/lib/liblua.so
```

> Na maioria dos sistemas Linux de 64 bits esses caminhos não mudam. Se o seu for diferente, localize os arquivos com `find /usr/lib -name "lua5.4*"`.

## 4. Download do código-fonte

Baixe a versão [6.0.1 no SourceForge](http://sourceforge.net/projects/gnuplot/files/) ou diretamente no [site oficial](http://www.gnuplot.info).

Descompacte e entre no diretório:

```bash
tar -xzvf gnuplot-6.0.1.tar.gz
cd gnuplot-6.0.1
```

## 5. Configuração e compilação

### 5.1. Configuração

```bash
./configure --with-lua=yes \
  --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
  --with-cairo > log.txt
```

> 💡 **Por que redirecionar para `log.txt`?** A saída do `./configure` é longa, e os avisos de bibliotecas ausentes ficam perdidos no meio dela. Com o redirecionamento, basta inspecionar o arquivo para localizar mensagens como:
>
> ```
> configure: WARNING:
> Package requirements (Qt5Core Qt5Gui Qt5Network Qt5Svg Qt5PrintSupport) were not met:
>
> No package 'Qt5Core' found
> ```

Se o aviso do Qt aparecer, reconfigure desabilitando o Qt:

```bash
./configure --with-lua=yes \
  --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
  --with-cairo --with-qt=no > log.txt
```

ou, se quiser o terminal Qt, indicando a versão:

```bash
./configure --with-lua=yes \
  --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
  --with-cairo --with-qt=qt4 > log.txt
```

> ❗ **Importante:** o valor de `--with-texdir` deve apontar para o diretório `gnuplot` dentro da árvore do LaTeX — é ali que os arquivos de estilo do terminal `tikz` serão instalados.

### 5.2. Compilação

```bash
make
```

> Esta é a etapa em que a maioria dos erros costuma aparecer. Consulte a seção 8 se necessário.

Para verificar a compilação (vários gráficos de teste serão exibidos na tela):

```bash
make check
```

## 6. Instalação

Como superusuário:

```bash
sudo make install
```

## 7. Testes

### 7.1. Teste visual

Execute:

```bash
gnuplot
```

A seguinte mensagem deve aparecer:

```
	G N U P L O T
	Version 6.0 patchlevel 1    last modified 2024-05-13

	Copyright (C) 1986-1993, 1998, 2004, 2007-2024
	Thomas Williams, Colin Kelley and many others

	gnuplot home:     http://www.gnuplot.info
	faq, bugs, etc:   type "help FAQ"
	immediate help:   type "help"  (plot window: hit 'h')

	Terminal type is now wxt
gnuplot>
```

No prompt, digite `test` — um gráfico de demonstração deve aparecer:

![test-graph](https://github.com/RafaelDexter/GNUPlot/blob/master/img/test.png)

### 7.2. Teste do terminal TikZ

No prompt do GNUPlot:

```gnuplot
set term tikz fulldoc
set output "nome.tex"
test
q
```

Em seguida, compile o arquivo gerado e abra o PDF:

```bash
pdflatex nome.tex && evince nome.pdf
```

Se tudo estiver correto, o mesmo gráfico do teste anterior será gerado — agora em formato `.pdf`, com tipografia LaTeX.

## 8. Solução de problemas

Os erros conhecidos e suas soluções estão documentados em [erros.md](./erros.md).

---

[⬅️ Voltar à página principal](../README.md)
