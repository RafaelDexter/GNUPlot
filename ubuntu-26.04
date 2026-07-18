# GNUPlot 6.0.4 — Compilação no Ubuntu 26.04 LTS

> Guia de compilação do GNUPlot a partir do código-fonte, com suporte aos terminais `tikz`, `cairo` e `lua`.

| | |
|---|---|
| **Versão do GNUPlot** | 6.0.4 |
| **Distribuição** | Ubuntu 26.04 LTS |
| **Criado em** | 18/07/2026 |
| **Última atualização** | 18/07/2026 |

---

## Sumário

1. [Instalação simples](#1-instalação-simples)
2. [Dependências](#2-dependências)
3. [Links simbólicos do Lua](#3-links-simbólicos-do-lua)
4. [Download do código-fonte](#4-download-do-código-fonte)
5. [Configuração e compilação](#5-configuração-e-compilação)
6. [Instalação](#6-instalação)
7. [Testes](#7-testes)
8. [Mudanças em relação ao Ubuntu 24.04](#8-mudanças-em-relação-ao-ubuntu-2404)

---

## 1. Instalação simples

Se você **não** precisa do terminal `tikz`, instale diretamente dos repositórios oficiais:

```bash
sudo apt install gnuplot
```

Caso queira gráficos com o terminal `tikz`, siga a compilação a partir da seção 2.

## 2. Dependências

| Pacote | Finalidade |
|---|---|
| `build-essential`, `automake`, `checkinstall` | Ferramentas de compilação |
| `libx11-dev`, `libxt-dev` | Suporte ao X11 |
| `libgd-dev` | Terminais de imagem (png, gif, jpeg) |
| `libreadline-dev` | Edição de linha no prompt interativo |
| `lua5.4`, `liblua5.4-dev` | Terminal `tikz` (via Lua) |
| `libcairo2-dev`, `libpango1.0-dev` | Terminais `cairolatex`, `pdfcairo`, `pngcairo` |
| `libwxgtk3.2-dev`, `libcanberra-gtk3-dev` | Terminal `wxt` |
| `libcerf-dev` | Funções de erro complexas |
| `texlive-full` | Distribuição LaTeX completa |

Instalação em um único comando:

```bash
sudo apt update
sudo apt install build-essential automake checkinstall \
libx11-dev libxt-dev libgd-dev libreadline-dev \
lua5.4 liblua5.4-dev \
libcairo2-dev libpango1.0-dev \
libwxgtk3.2-dev libcanberra-gtk3-dev \
libcerf-dev
```

Em seguida, o LaTeX completo:

```bash
sudo apt install texlive-full
```

> 💡 **Lua 5.4 ou 5.5?** O Ubuntu 26.04 já oferece o Lua 5.5, mas o terminal `tikz` do GNUPlot 6.0.4 foi testado com as versões anteriores. Use o **5.4** — é a escolha segura, e os links simbólicos da próxima seção apontam explicitamente para ele.

> 💡 **(Opcional) Terminal Qt:** se quiser também o terminal interativo `qt` (o mais rápido e completo do GNUPlot 6, com menu de exportação para png/svg/pdf), instale ainda:
>
> ```bash
> sudo apt install qt6-base-dev libqt6svg6-dev libqt6core5compat6-dev
> ```

## 3. Links simbólicos do Lua

O `./configure` procura o Lua em caminhos genéricos (`lua.pc` e `liblua.so`), mas o Ubuntu instala os arquivos com sufixo de versão. Crie os dois *links* simbólicos:

```bash
sudo ln -s /usr/lib/x86_64-linux-gnu/pkgconfig/lua5.4.pc /usr/lib/pkgconfig/lua.pc && \
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.4.so /usr/lib/liblua.so
```

## 4. Download do código-fonte

```bash
cd ~
wget https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.4/gnuplot-6.0.4.tar.gz/download -O gnuplot-6.0.4.tar.gz
tar -xzvf gnuplot-6.0.4.tar.gz
cd gnuplot-6.0.4
```

Se o `wget` falhar com o redirecionamento do SourceForge, baixe manualmente pelo [site oficial](http://www.gnuplot.info).

## 5. Configuração e compilação

### 5.1. Configuração

**Sem o terminal Qt** (usando apenas o `wxt` como terminal interativo):

```bash
./configure --with-lua=yes \
--with-texdir=/usr/share/texmf/tex/latex/gnuplot \
--with-cairo --with-qt=no > log.txt
```

**Com o terminal Qt6** (requer os pacotes opcionais da seção 2):

```bash
./configure --with-lua=yes \
--with-texdir=/usr/share/texmf/tex/latex/gnuplot \
--with-cairo > log.txt
```

> 💡 **Por que redirecionar para `log.txt`?** A saída do `./configure` é longa e os avisos de bibliotecas ausentes se perdem no meio dela. Com o redirecionamento, basta inspecionar o arquivo para localizar o que faltou.

Verifique se o terminal `tikz` foi habilitado:

```bash
grep -i -A2 "lua" log.txt | head -30
tail -40 log.txt
```

No resumo final deve constar o terminal lua/TikZ como habilitado.

> ❗ **Importante:** o valor de `--with-texdir` deve apontar para o diretório `gnuplot` dentro da árvore do LaTeX — é ali que os arquivos de estilo do terminal `tikz` serão instalados.

### 5.2. Compilação

```bash
make
```

Ou, em paralelo (bem mais rápido):

```bash
make -j$(nproc)
```

Para verificar a compilação (vários gráficos de teste serão exibidos na tela):

```bash
make check
```

## 6. Instalação

```bash
sudo make install
```

## 7. Testes

### 7.1. Teste visual

Execute:

```bash
gnuplot
```

A mensagem de abertura deve indicar `Version 6.0 patchlevel 4`. No prompt, digite `test` — um gráfico de demonstração deve aparecer.

### 7.2. Teste do terminal TikZ

No prompt do GNUPlot:

```gnuplot
set term tikz fulldoc
set output "teste.tex"
test
q
```

Em seguida, compile o arquivo gerado e abra o PDF:

```bash
pdflatex teste.tex && papers teste.pdf
```

Se preferir um comando independente do visualizador instalado:

```bash
pdflatex teste.tex && xdg-open teste.pdf
```

Se tudo estiver correto, o mesmo gráfico do teste anterior será gerado — agora em formato `.pdf`, com tipografia LaTeX.

> 📄 **Nota — o fim do `evince`:** o Ubuntu 26.04 não traz mais o Evince. O visualizador padrão do GNOME agora é o **Papers**, que aparece no menu como *"Document Viewer"* e é chamado na linha de comando por `papers`. O `xdg-open` continua funcionando em qualquer caso, pois abre o aplicativo padrão do sistema.

## 8. Mudanças em relação ao Ubuntu 24.04

| Item | Ubuntu 24.04 (GNUPlot 6.0.1) | Ubuntu 26.04 (GNUPlot 6.0.4) |
|---|---|---|
| Pacote canberra | `libcanberra-gtk-dev` | `libcanberra-gtk3-dev` |
| Lua disponível | 5.4 | 5.4 e 5.5 (usar **5.4**) |
| Visualizador de PDF | `evince` | `papers` (Document Viewer) |
| Terminal Qt | Qt5 | Qt6 (`qt6-base-dev` etc.) |

---

[⬅️ Voltar à página principal](../README.md)
