\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{darticle}

\RequirePackage{pgfkeys}
\RequirePackage{pgfopts}
\pgfkeys{
  /darticle/.cd,
  9pt/.code={\PassOptionsToClass{9pt}{scrartcl}},
  twocolumn/.code={\PassOptionsToClass{twocolumn}{scrartcl}},
}
\ProcessPgfOptions{/darticle}
\ProcessOptions\relax
\LoadClass{scrartcl}

% Color
\RequirePackage{xcolor}

% Page geometry
\RequirePackage[a4paper,margin=2cm]{geometry}

% Math
\RequirePackage{amsmath}
\RequirePackage{amssymb}

\RequirePackage{fontspec}
\RequirePackage[bold-style=ISO]{unicode-math}
\setmainfont{TeX Gyre Termes}
\setsansfont{Helvetica Neue}
\setmathfont{TeX Gyre Termes Math}
\setmathfont[range=\mathcal]{TeX Gyre Chorus}

% Theorems
\RequirePackage{tcolorbox}
\tcbuselibrary{skins, theorems}
\tcbset{
  dtheorem/.style={
    enhanced,
    sharp corners,
    toprule=0pt,
    rightrule=0pt,
    bottomrule=0pt,
    detach title,
    fonttitle=\sffamily\bfseries,
    coltitle=black,
    before upper={\tcbtitle\quad}
  }
}
\newcounter{dtheorem}
%\NewTcbTheorem[use counter=dtheorem]{theorem}{Theorem}{dtheorem}{dtheorem}
%\NewTcbTheorem[use counter=dtheorem]{lemma}{Lemma}{dtheorem}{lem}
%\NewTcbTheorem[use counter=dtheorem]{definition}{Definition}{dtheorem}{def}
%\NewTcbTheorem[use counter=dtheorem]{example}{Example}{dtheorem}{ex}
%\NewTcbTheorem[use counter=dtheorem]{claim}{Claim}{dtheorem}{ex}

% Lists
\RequirePackage[shortlabels, inline]{enumitem}
\setlist{noitemsep,topsep=0pt}
\setlist[enumerate,1]{label=(\arabic*)}

% PDF index
\RequirePackage[breaklinks,hidelinks,bookmarksnumbered]{hyperref}

% Code listings
\RequirePackage{listings}

\lstdefinelanguage{Algebraic}{
  sensitive=true,
  morekeywords={spec,basedon,sorts,consts,ops,vars,axioms,end},
  moredelim=[is][\bfseries]{|}{|},
  literate={->}{{$\to$\ }}2 {*}{{$\times$\ }}1,
}

\lstdefinelanguage{pseudocode}{
  morekeywords={
    algorithm,
    if,then,else,while,do,repeat,until,seq,and,or,
    seqdo,return,call,switch,match,case,default,
    for,pardo,in,foreach,print,output,input,exit,
    break,loop,end,begin,goto,par,global,local,
    read,write,to,stop,idle,procedure,function,
    continue,throw,catch,null
  },
  sensitive=true,
  morecomment=[l]{//},
  morestring=[b]",
  moredelim=[is][\scshape]{|}{|},
  literate={<-}{{$\gets$\ }}2 {*}{{$\times$\ }}1,
}

\lstdefinestyle{pseudocode}{
  language=algebraic,
  basicstyle=\rmfamily,
  identifierstyle=\itshape,
  keywordstyle=\bfseries,
  columns=fullflexible,
  commentstyle=\color{black!60}\rmfamily,
  escapechar=$,
  escapebegin=$,
  escapeend=$,
}

\lstnewenvironment{Algebraic}{\lstset{style=pseudocode,language=Algebraic}}{}
\lstnewenvironment{Pseudocode}{\lstset{style=pseudocode,language=pseudocode}}{}

% Easy notation for common sets
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}

% Swap varphi with phi and varepsilon with epsilon
\AfterEndPreamble{%
  \let\oldphi\phi%
  \let\phi\varphi%
  \let\varphi\oldphi%
  \let\oldepsilon\epsilon%
  \let\epsilon\varepsilon%
  \let\varepsilon\oldepsilon%
  \let\vec\symbf%
}
