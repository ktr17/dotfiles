%\NeedsTexFormat{LaTeX2e}
\ProvidesClass{ktr}
\LoadClass[11pt, a4paper]{jsarticle}
\usepackage{here}
\usepackage[top=20truemm,bottom=20truemm,left=20truemm,right=20truemm]{geometry} % 余白
\usepackage[dvipdfmx]{graphicx, color}
\usepackage{latexsym}
\usepackage{url}
\usepackage{caption}


% 1ページの設定
\AtBeginDocument{
\newcount\@chars\newcount\@lines
\@chars=40                      % 1行の文字数
\@lines=40                      % 1ページの行数

\newdimen\@kanjiskip
\@kanjiskip=\dimexpr(\textwidth-1zw*\@chars)/\numexpr\@chars-1
\newdimen\@@kanjiskip
\@@kanjiskip=\dimexpr\@kanjiskip/10

\baselineskip=\dimexpr\textheight/\@lines
\kanjiskip=\@kanjiskip plus \@@kanjiskip minus \@@kanjiskip
\parindent=\dimexpr\parindent+\@kanjiskip
}
% ここまで


% titleの表示位置の設定
\def\@maketitle{%
\begin{flushright}%
{\large \@date}% 日付
\end{flushright}%
\begin{center}%
{\LARGE \@title \par}% タイトル
\end{center}%
\begin{flushright}%
{\large \@author}% 著者
\end{flushright}%
\par\vskip 1.5em
}
% ここまで


% セクションの設定
\usepackage{titlesec}
\titleformat*{\section}{\fontsize{11}{20}\bfseries}
\titleformat*{\subsection}{\fontsize{10}{10}\bfseries}
\titleformat*{\subsubsection}{\fontsize{10}{0}\bfseries}
%セクション番号が消えるバグの修正（https://tex.stackexchange.com/questions/299969/titlesec-loss-of-section-numbering-with-the-new-update-2016-03-15）
\usepackage{etoolbox}
\patchcmd{\ttlh@hang}{\parindent\z@}{\parindent\z@\leavevmode}{}{}
\patchcmd{\ttlh@hang}{\noindent}{}{}{}
% セクションの上下にできる余白の調整
\titlespacing{\section}{0pt}{0pt}{0pt} % 2017/12/21 0,10,0 -> 0,0,0へ変更
\titlespacing{\subsection}{0pt}{5pt}{0pt} % 2017/12/21 0,10,0 -> 0,5,0へ変更
\titlespacing{\subsubsection}{0pt}{5pt}{0pt} % 2017/12/21 0,10,0 -> 0,5,0へ変更
% ここまで


%図表のキャプションフォーマットの変更
\renewcommand{\theequation}{\arabic{section}.\arabic{subsection}.\arabic{equation}}
\renewcommand{\thefigure}{\arabic{section}.\arabic{subsection}.\arabic{figure}}
\renewcommand{\thetable}{\arabic{section}.\arabic{subsection}.\arabic{table}}
\@addtoreset{figure}{subsection}
\@addtoreset{equation}{subsection}
\@addtoreset{table}{subsection}

\captionsetup[figure]{labelsep=space, name=Fig.}
\captionsetup[table]{labelsep=space, name=Table}
% Figure環境の登録
\newenvironment{Figure}
{\par\medskip\noindent\minipage{\linewidth}}
{\endminipage\par\medskip}
% Table環境の登録
\newenvironment{Table}
{\par\medskip\noindent\minipage{\linewidth}}
{\endminipage\par\medskip}
% ここまで


% ソースコードの設定
\usepackage{listing}
\usepackage{plistings}
\renewcommand{\lstlistingname}{Code}
\lstset{
% プログラム言語(複数の言語に対応，C,C++も可)
language = Python,
%背景色と透過度
backgroundcolor={\color[gray]{.90}},
%枠外に行った時の自動改行
breaklines = true,
%%自動改行後のインデント量(デフォルトでは20[pt])
breakindent = 10pt,
commentstyle = {\itshape \color[cmyk]{1,0.4,1,0}},
%関数名等の色の設定
classoffset = 0,
%%キーワード(int, ifなど)の書体
keywordstyle = {\bfseries \color[cmyk]{0,1,0,0}},
%%表示する文字の書体
stringstyle = {\ttfamily \color[rgb]{0,0,1}},
framesep = 5pt,
%%行番号の位置
numbers = left,
%%行番号の間隔
stepnumber = 1,
%%行番号の書体
numberstyle = \tiny,
%%タブの大きさ
tabsize = 4,
}
% ここまで
