latex-problemset
================

Custom LaTeX document class for doing problem sets.

## Sample usage

	\documentclass[letterpaper]{problemset}

	\newcommand{\institutionName}{Harvard University}
	\newcommand{\studentName}{Bannus Van der Kloot}
	\newcommand{\className}{Applied Math 120}

	\begin{document}

	\header{2}{Sep 21, 2012}

	\problem{10}
	\subproblem
	\subproblem

	\problem{20}
	\subproblem
	\end{document}