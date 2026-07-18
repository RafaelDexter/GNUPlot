<div align="center">

# GNUPlot — Compilação a partir do código-fonte

![graph1](http://www.gnuplot.info/figs/front2.png) ![graph2](http://www.gnuplot.info/figs/gaussians.png)

**O melhor utilitário de representação gráfica para Linux**

[![Site oficial](https://img.shields.io/badge/Site-gnuplot.info-blue)](http://www.gnuplot.info/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-LTS-E95420?logo=ubuntu&logoColor=white)](https://ubuntu.com/)
[![LaTeX](https://img.shields.io/badge/Terminal-TikZ-008080)](https://www.ctan.org/pkg/pgf)

</div>

---

## 📖 Sobre este repositório

Este repositório documenta o processo completo de **compilação do GNUPlot a partir do código-fonte** no Ubuntu, com suporte ao terminal `tikz` — essencial para gerar gráficos com qualidade tipográfica LaTeX.

A cada nova versão LTS do Ubuntu, o processo de instalação é revisado, testado e documentado em uma página própria. Assim, este repositório serve como um **histórico versionado de instalações**, facilitando a reinstalação e a adaptação às mudanças de dependências entre as versões do sistema.

## 🗂️ Guias de instalação por versão

| Ubuntu | GNUPlot | Status | Guia |
|:------:|:-------:|:------:|:----:|
| 24.04 LTS (Noble Numbat) | 6.0.1 | ✅ Concluído | [📄 Instalação no Ubuntu 24.04](./ubuntu-24.04/README.md) |
| 26.04 LTS | — | 🚧 Em breve | [📄 Instalação no Ubuntu 26.04](./ubuntu-26.04/README.md) |

> 💡 **Escolha o guia correspondente à sua versão do Ubuntu.** As dependências e os caminhos de bibliotecas mudam entre as versões — usar o guia errado pode gerar erros de compilação.

## ⚡ Instalação rápida (sem TikZ)

Se você **não** precisa do terminal `tikz`, a instalação pelos repositórios oficiais é suficiente:

```bash
sudo apt install gnuplot
```

Caso queira gráficos com o terminal `tikz` integrados ao LaTeX, siga o guia de compilação da sua versão do Ubuntu na tabela acima.

## 🎯 Por que compilar da fonte?

- ✅ Suporte completo ao terminal **`tikz`** (gráficos nativos em LaTeX)
- ✅ Suporte a **Lua** e **Cairo**
- ✅ Versão mais recente do GNUPlot, antes de chegar aos repositórios
- ✅ Controle total sobre os terminais e recursos habilitados

## 📚 Estrutura do repositório

```
.
├── README.md            ← você está aqui
├── ubuntu-24.04/        ← guia completo para Ubuntu 24.04 LTS (GNUPlot 6.0.1)
│   ├── README.md
│   └── erros.md
└── ubuntu-26.04/        ← guia para Ubuntu 26.04 LTS (em construção)
```

## 🔗 Links úteis

- [Site oficial do GNUPlot](http://www.gnuplot.info/)
- [Downloads (SourceForge)](http://sourceforge.net/projects/gnuplot/files/)
- [Documentação do terminal TikZ](http://www.gnuplot.info/docs/)

---

<div align="center">

Mantido por **RafaelDexter** · Primeira versão: 08/10/2023

</div>
