%%%%%
% Document class for problem sets
% Adapted by Bannus Van der Kloot from CS121
% Original Header:
% Much of this file was stolen from psinclude.tex, which included
%   LaTeX code writen by Bob Walton and Craig Silverstein, and edited
%   at various times by Adam Deaton and Ben Wildasin.  This document
%   class is originally due to Robert Haas.
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{problemset}[2012/09/20 Class for college problem sets]

%%% Create some appropriately named counters.
\newcounter{Problem}
\newcounter{Subproblem}[Problem]   % WITHIN problem: reset when
                   % *problem* is
\newcounter{Subsolution}[Problem]
\newcounter{SubproblemX}
\newcounter{SubsolutionX}
\newcommand{\nextproblem}[1]{\setcounter{Problem}{#1}}

%%% Generic header.  This gets redefined if the 'ps' or 'solution' options
%%% are specified.
\newcommand{\header}[1]
{
  \begin{center}
    {\large \bf Harvard University}\\
    {\bf \className}\\

    \medskip
    {\bf #1}
  \end{center}
}

\newcommand{\printStudentName}
{
  \begin{center}
    Problem set by \studentName
  \end{center}
}

%%% Make a "problem*" environment
\newenvironment{problem*}[1][]
{ % On entering environment.  
   \bigskip
   \begin{center}
   PROBLEM \mbox{#1}
   \end{center}
   \begin{small} 
   \begin{sf} 
   \begin{quote}
}
{ % On leaving environment.
   \end{quote}
   \end{sf}
   \end{small}
}

%%% Make a "problem" environment.
\newenvironment{problem}[0]
{ % On entering environment.
   \stepcounter{Problem}
   \begin{problem*}[\arabic{Problem}]
}
{ % On leaving environment.
   \end{problem*}
}

\renewcommand{\header}[2]         % 2 ARGUMENTS: ps #, due date
{
  \setlength{\parskip}{0.0in}      % Use late date NONE for no lateness.
  \begin{center}
    {\large \bf \institutionName}\\
    {\bf \className}\\

    \medskip
    {\bf Problem Set #1}\\

    \medskip
    {\sf Due #2.\\
     \printStudentName  
    } % end of \sf
    %    \setlength{\parskip}{\theparskip}
  \end{center}
}      % end definition of \header

\renewcommand{\problem}[1]         % ONE ARGUMENT: point value of problem
{
  \stepcounter{Problem}      % gets set to 0 because of Problem's WITHIN
  \begin{center}
  \vspace{15pt}
  PROBLEM \arabic{Problem}
   % if points is blank don't show points
  \ifthenelse{\equal{#1}{}}{}
  {\mbox{(#1 point\ifthenelse{\equal{#1}{1}}{}{s})}}
  \end{center}
}

\newcommand{\subproblem}         % NO ARGUMENTS
{
  \p
  \stepcounter{Subproblem}
  {\sf (\ifthenelse{\value{Subproblem}<27}{\Alph{Subproblem}}%
  {\setcounter{SubproblemX}{\value{Subproblem}}%
  \addtocounter{SubproblemX}{-26}\Alph{SubproblemX}%
      \Alph{SubproblemX}})}
}

%%% Pass remaining options (and 11pt) to the article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*

%%% Load the article class, and select the amssymb, and
%%% latexsym packages.
\LoadClass[11pt]{article}
\RequirePackage{amssymb}
\RequirePackage{epsfig}
\RequirePackage{latexsym}
\RequirePackage{ifthen}
\RequirePackage{amsmath}

%%% LaTeX macros
\newcommand{\textref}[1]{{\sf [#1] }}
\newcommand{\LP}{L\&P }
\newcommand{\lpref}[1]{\textref{\LP #1}}
% \newcommand{\huref}[1]{\textref{Hopcroft \& Ullman #1}}
\newcommand{\tab}{\hspace*{0.5in}}      % * forces spaces
\newcommand{\p}{{\ \setlength{\parskip}{0.0in} \\}}
 
%\renewcommand{\#}{{\ensuremath{{\sqcup}}}}

%%% Quarter inch indentation, empty page style.
\setlength{\parindent}{0.25in}
\pagestyle{empty}

\newcommand{\turnover}
{\medskip
 \begin{center}
 (TURN OVER!)
 \end{center}
 \pagebreak
}

%%% Various macros.
\newcommand{\Nat}{\mathbb{N}}
\newcommand{\set}[1]{\{#1\}}
\newcommand{\PTIME}{\mathrm {P}}
\newcommand*{\NP}{\ensuremath{\mathrm {NP}}}
\def\slides{0}
\def\figscale{1.0}
%\def\epsline#1{\centerline{\mbox{\epsfig{file=#1}}}}
\def\epsline#1{\centerline{\mbox{\epsfig{file=#1,scale=\figscale}}}}
%\def\eps#1{\mbox{\epsfig{file=#1}}}
\def\eps#1{\mbox{\epsfig{file=#1,scale=\figscale}}}
\def\q#1{\ensuremath{\textrm{``}#1\textrm{''}}}
\def\quine#1{\ensuremath{#1\q{#1}}}
\def\|{\mathrel|}
\def\Shuffle{\mathrm{Shuffle}}
\def\Binary{\mathrm{Binary}}
\def\L{L}
\def\Cut{\mathrm{Cut}}
\def\Min{\mathrm{Min}}
\def\Max{\mathrm{Max}}
\def\Prefix{\mathrm{Prefix}}
\def\Suffix{\mathrm{Suffix}}
\def\b#1{\overline{#1}}
\def\mathsc{\textsc}
\newcommand{\vareps}{\varepsilon}
\newcommand{\zo}{\{0,1\}}
\newcommand{\blank}{\sqcup}
\newcommand{\qaccept}{q_{\mathrm{accept}}}
\newcommand{\qreject}{q_{\mathrm{reject}}}
\newcommand{\ADFA}{A_{\mathsf{DFA}}}
\newcommand{\ATM}{A_{\mathsf{TM}}}
\newcommand{\HTM}{\mathit{HALT}_{\mathsf{TM}}}
\newcommand{\TIME}{\mathrm{TIME}}
\newcommand{\NTIME}{\mathrm{NTIME}}
\newcommand{\textprob}[1]{\textsc{#1}}
\newcommand{\mathprob}[1]{\mbox{\textmd{\textsc{#1}}}}
\newcommand{\SATsearch}{\textprob{SAT-search}}
\newcommand{\Factoring}{\textprob{Factoring}}
\newcommand{\SAT}{\mathprob{SAT}}
\newcommand{\Satisfiability}{\textprob{Satisfiability}}
\newcommand{\TravellingSalesman}{\textprob{Travelling Salesman Problem}}
\newcommand{\HamiltonianCircuit}{\textprob{Hamiltonian Circuit}}
\newcommand{\Composites}{\textprob{Composites}}
\newcommand{\MapColoring}{\textprob{Map 3-Coloring}}
\newcommand{\TSAT}{\mathprob{3-SAT}}
\newcommand{\ILP}{\mathprob{ILP}}


%\renewcommand{\or}{\vee}
%\renewcommand{\and}{\wedge}
\newcommand{\ol}[1]{\overline{#1}}
\newcommand{\Leps}{L_{\vareps}}
\newcommand{\leqm}{\leq_m}
\newcommand{\leqP}{\leq_{\mathrm{P}}}

%%%%%%%%%%%%%
% Other macros
%%%%%%%%%%%%%
\newcommand{\norm}[1]{\left|\left|#1\right|\right|}
\newcommand{\abs}[1]{\left|#1\right|}
\newcommand{\bx}{\mathbf{x}}
\newcommand{\bu}{\mathbf{u}}
\newcommand{\floor}[1]{\lfloor #1 \rfloor}
\newcommand{\ceil}[1]{\lceil#1 \rceil}
\newcommand{\bv}{\mathbf{v}}
\newcommand{\bbZ}{\mathds{Z}}
\newcommand{\bbR}{\mathds{R}}
\newcommand{\bbC}{\mathds{C}}
\newcommand{\bbN}{\mathds{N}}
\newcommand{\bbQ}{\mathds{Q}}
\newcommand{\bbzw}{\mathds{Z}[\omega]}
\newcommand{\bbzi}{\mathds{Z}[i]}
\newcommand{\nZ}[1][n]{\ensuremath{\mathds{Z}/#1\mathds{Z}}}
\newcommand{\<}{\langle}
\renewcommand{\>}{\rangle}

%%% Page margins
\topmargin 0pt
\advance \topmargin by -\headheight
\advance \topmargin by -\headsep
     
\textheight 8.9in
     
\oddsidemargin 0pt
\evensidemargin \oddsidemargin
\marginparwidth 0.5in
     
\textwidth 6.5in


\usepackage{dsfont}
\usepackage{listings}
\usepackage{courier}
\usepackage{color}
\lstset{
  basicstyle=\footnotesize\ttfamily,
  numberstyle=\tiny,
  numbersep=5pt,
  tabsize=2,
  extendedchars=true,
  breaklines=true,
  keywordstyle=\color{red},
  frame=b,
  stringstyle=\color{white}\ttfamily,
  showspaces=false,
  showtabs=false,
  xleftmargin=17pt,
  framexleftmargin=17pt,
  framexrightmargin=5pt,
  framexbottommargin=4pt,
  showstringspaces=false
 }

% Include graphics or code with the following:
%\lstinputlisting{code.c}
%\includegraphics[width=400px]{picture.png}
