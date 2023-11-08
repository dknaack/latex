\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dbook}
\LoadClass{scrbook}

% Page geometry
\RequirePackage[a4paper,left=3cm,right=3cm,top=3cm,bottom=3.75cm,footskip=1.5cm,headsep=1cm]{geometry}

% Math
\RequirePackage{amsmath}
\RequirePackage{amssymb}

\RequirePackage{fontspec}
\RequirePackage[bold-style=ISO]{unicode-math}
\setmainfont{TeX Gyre Termes}
\setsansfont{Helvetica Neue}
\setmathfont{TeX Gyre Termes Math}
%\setmathfont[range=\mathcal]{TeX Gyre Chorus}

% Color
\RequirePackage{xcolor}
\definecolor{secondary}{HTML}{D7BB45}

% Theorems
\RequirePackage{tcolorbox}
\tcbuselibrary{skins, theorems}
\newcounter{dtheorem}[chapter]

\colorlet{theorem}{green!50!black}
\colorlet{example}{blue!60!black!70!white}
\colorlet{definition}{purple!60!black!70!white}
\definecolor{primary}{HTML}{DBD358}
\tcbset{
  dtheorem/.style={
    enhanced jigsaw,
    sharp corners,
    boxrule=0pt,
    leftrule=2pt,
    colframe=#1,
    colback=#1!15!white,
    coltitle=#1,
    fonttitle=\sffamily,
    detach title,
    before upper={\tcbtitle\hspace{1ex}},
  },
}

\newtcolorbox[use counter=dtheorem]{definition}[1][]{
  dtheorem=definition,
  title={\textbf{Definition~\thechapter.\thetcbcounter}\ifstrempty{#1}{\textbf{.}}{ (#1)\textbf{.} \\}},
}

\newtcolorbox[use counter=dtheorem]{theorem}[1][]{
  dtheorem=theorem,
  title={\textbf{Theorem~\thechapter.\thetcbcounter}\ifstrempty{#1}{\textbf{.}}{ (#1)\textbf{.} \\}},
}

\newtcolorbox[use counter=dtheorem]{lemma}[1][]{
  dtheorem=theorem,
  title={\textbf{Lemma~\thechapter.\thetcbcounter}\ifstrempty{#1}{\textbf{.}}{ (#1)\textbf{.} \\}},
}

\newtcolorbox[use counter=dtheorem]{example}[1][]{
  enhanced jigsaw,
  sharp corners,
  boxrule=0pt,
  leftrule=2pt,
  colframe=example,
  coltitle=example,
  colback=white,
  fonttitle=\sffamily\bfseries,
  title={\textbf{Example~\thechapter.\thetcbcounter}\ifstrempty{#1}{}{ (#1)}\textbf{.}},
  detach title,
  before upper={\tcbtitle\hspace{1ex}},
}

\newtcolorbox{proof}[1][]{
  enhanced jigsaw,
  sharp corners,
  boxrule=0pt,
  colframe=theorem,
  coltitle=theorem,
  colback=white,
  fonttitle=\sffamily\bfseries,
  title={\ifstrempty{#1}{Proof}{#1}.},
  detach title,
  before upper={\tcbtitle\hspace{1ex}},
}
\AtEndEnvironment{proof}{\null\hfill\textcolor{theorem}{$\square$}}

% Lists
\RequirePackage[shortlabels]{enumitem}
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
    if,then,else,while,do,repeat,until,seq,
    seqdo,return,call,
    for,pardo,in,foreach,print,output,input,exit,
    break,loop,end,begin,goto,par,global,local,
    read,write,to,stop,idle,procedure,function,
    throw,catch
  },
  sensitive=true,
  morecomment=[l]{//},
  morestring=[b]",
}

\lstdefinestyle{pseudocode}{
  language=algebraic,
  basicstyle=\rmfamily,
  identifierstyle=\itshape,
  keywordstyle=\bfseries,
  columns=fullflexible,
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
\AfterEndPreamble{
  \let\oldphi\phi
  \let\phi\varphi
  \let\varphi\oldphi
  \let\oldepsilon\epsilon
  \let\epsilon\varepsilon
  \let\varepsilon\oldepsilon
  \let\vec\symbf
}
