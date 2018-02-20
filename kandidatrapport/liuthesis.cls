%%% liuthesis.cls ---
%%
%% Filename: liuthesis.cls
%% Description:
%% Author: Ola Leifler
%% Maintainer:
%% Created: Fri Mar 20 08:25:23 2009 (CET)
%% Version:
%% Last-Updated: Tue Aug 22 11:45:32 2017 (+0200)
%%           By: Ola Leifler
%%     Update #: 1530
%% URL:
%% Keywords:
%% Compatibility:
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%% Commentary:
%%
%% Read the README instead...
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%% Change log:
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% This program is free software; you can redistribute it and/or
%% modify it under the terms of the GNU General Public License as
%% published by the Free Software Foundation; either version 3, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%% General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License
%% along with this program; see the file COPYING.  If not, write to
%% the Free Software Foundation, Inc., 51 Franklin Street, Fifth
%% Floor, Boston, MA 02110-1301, USA.

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%% Code:
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{liuthesis} [2017/04/20 Thesis class for LiU]
\typeout{Undergraduate and graduate thesis class for LiU by Ola Leifler - v 1.1}
\def\createvariable#1{%
  \expandafter\def\csname #1\endcsname{\expandafter\gdef\csname @#1\endcsname}
  \csname #1\endcsname{\texttt{\textbackslash #1}}
}

% \def\createconditionalvariable#1{
%   \expandafter\newif\csname if#1\endcsname
%   \csname #1 false\endcsname
%   \def\csname#1\endcsname
% }

\RequirePackage{xkeyval}
\RequirePackage{ifxetex}

\ifxetex
\else
\RequirePackage[utf8]{inputenc}
\fi

\RequirePackage[absolute]{textpos}

% For conditionally including lists of tables and figures
\RequirePackage[figure,table]{totalcount}

\createvariable{edition}
\createvariable{presentationroom}
\createvariable{presentationbuilding}
\createvariable{presentationcampus}
\createvariable{presentationdate}
\createvariable{presentationdateenglish}
\createvariable{presentationtime}


\createvariable{thesislanguage}
\createvariable{faculty}
\createvariable{issn}
\createvariable{degreeprefix}
\createvariable{degreesuffix}
\createvariable{exhibittext}
\createvariable{exhibittextswedish}
\createvariable{opponenttitle}
\createvariable{opponentname}
\createvariable{opponentuniversity}
\createvariable{opponentcountry}
\createvariable{thesisnumber}
\createvariable{currentyearthesisnumber}
\createvariable{supportedby}
\createvariable{publicationyear}
\createvariable{publicationmonth}
\createvariable{isbn}
\createvariable{supervisor}
\createvariable{examiner}
\createvariable{titleenglish}
\createvariable{titleswedish}
\createvariable{keywords}
\createvariable{keywordsswedish}
\createvariable{department}
\createvariable{departmentenglish}
\createvariable{departmentshort}
\createvariable{division}
\createvariable{divisionshort}
\createvariable{dateofpublication}
\createvariable{publicationseries}
% Undergrad specific
\createvariable{area}
\createvariable{level}
\createvariable{thesistypenameswedish}
\createvariable{thesistypenameenglish}
\createvariable{thesiscredits}
\createvariable{thesissubject}
\createvariable{thesissubjectenglish}

\newif\ifsubtitleswedish
\subtitleswedishfalse
\def\subtitleswedish#1{\subtitleswedishtrue\gdef\@subtitleswedish{#1}}

\newif\ifsubtitleenglish
\subtitleenglishfalse
\def\subtitleenglish#1{\subtitleenglishtrue\gdef\@subtitleenglish{#1}}

\newif\ifdedication
\dedicationfalse
\def\dedication#1{\dedicationtrue\gdef\@dedication{#1}}

\newif\ifexternalsupervisor
\externalsupervisorfalse
\def\externalsupervisor#1{\externalsupervisortrue\gdef\@externalsupervisor{#1}}

\createvariable{divanumber}
% Include the abstract
\gdef\@abstract{\input{abstract}}
\gdef\@sammanfattning{\input{sammanfattning.tex}}
\gdef\@acknowledgments{\input{acknowledgments.tex}}

\newif\iflith
\lithtrue

\newif\ifhu
\newif\iffilfak
\newif\ifphd
% \phdtrue
\newif\iflic
\licfalse
\newif\ifstudent
\studenttrue
\newif\ifprinterfriendly
\printerfriendlyfalse

\DeclareOption{hu}{%
  \hutrue
  \lithfalse
  \filfakfalse
  \faculty{Faculty of Health Sciences}
  \gdef\@facultyshort{HU}
  \gdef\@facultyshortlogo{hu}
 \publicationseries{Linköping University Medical Dissertations}
  \degreeprefix{medicine}
}

\DeclareOption{lith}{%
  \lithtrue
  \hufalse
  \filfakfalse
  \faculty{Institute of Technology}
  \publicationseries{Linköping Studies in Science and Technology}
  \degreeprefix{teknologie}
  \gdef\@facultyshort{Tek}
  \gdef\@facultyshortlogo{lith}
  \gdef\@area{LITH}
}

\DeclareOption{filfak}{%
  \filfaktrue
  \lithfalse
  \hufalse
  \faculty{Philosophical faculty}
  \gdef\@facultyshort{FilFak}
  \gdef\@facultyshortlogo{filfak}
  \publicationseries{Linköping Studies in Arts and Sciences}
  \degreeprefix{filosofie}
%  \gdef\@area{FFK-UP}
}

\DeclareOption{msc}{%
  \studenttrue
  \phdfalse
  \licfalse
  \level{A}
  \gdef\@thesistypenameenglish{Master}
  \gdef\@thesistypenameswedish{avancerad nivå}
  \thesiscredits{30}
  \PassOptionsToClass{oneside}{memoir}
}

\DeclareOption{bachelor}{%
  \studenttrue
  \phdfalse
  \licfalse
  \level{G}
  \gdef\@thesistypenameenglish{Bachelor}
  \gdef\@thesistypenameswedish{grundnivå}
  \thesiscredits{16}
  \PassOptionsToClass{oneside}{memoir}
}

\DeclareOption{lic}{%
  \lictrue
  \phdfalse
  \studentfalse
}

\DeclareOption{phd}{%
  \licfalse
  \studentfalse
  \phdtrue
}

\DeclareOption{printerfriendly}{%
  \printerfriendlytrue
}

\DeclareOption{swedish}{%
  \thesislanguage{swedish}
}

\DeclareOption{english}{%
  \thesislanguage{english}
}

\newif\ifexhibitpage
\exhibitpagefalse

\DeclareOption{exhibitpage}{%
  \exhibitpagetrue
  \PassOptionsToClass{oneside}{memoir}
}

% % % Add the necessary biblatex options to the class options

% \DeclareOptionX{biblatexoptions}{%
%  \gdef\@biblatexoptions{#1}
% \PassOptionsToPackage{\@biblatexoptions}{biblatex}
% }

% \DeclareOptionX{memoiroptions}{%
% \PassOptionsToClass{#1}{memoir}
% }

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

\ExecuteOptions{english,phd,lith,a4paper}

\ProcessOptions*

%% There is a special exception to the rule that publication series
%% are defined by the faculty, and that is the philosophical faculty
%% that uses a special series for licentiate theses

\iflic
\iffilfak
\publicationseries{Faculty of Arts and Sciences}
\fi
\fi

\LoadClass{memoir}

\RequirePackage{color}
\RequirePackage[svgnames]{xcolor}
\RequirePackage{pdfpages}
\RequirePackage{tikz}
\RequirePackage{pbox}
\RequirePackage{ifthen}
\RequirePackage{geometry}
\RequirePackage[pdfusetitle]{hyperref}
\RequirePackage{amssymb}
\RequirePackage{amsmath}

% Set up input encoding and font handling
\ifxetex
\RequirePackage[MnSymbol]{mathspec}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Some versions of latex have issues with mathspec, see
% https://tex.stackexchange.com/questions/85696/what-causes-this-strange-interaction-between-glossaries-and-amsmath
\let\RequirePackage\original@RequirePackage
\let\usepackage\RequirePackage
% End workaround
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xltxtra}
\defaultfontfeatures{Mapping=tex-text}
\else
\RequirePackage{graphicx}
\RequirePackage{palatino}
\RequirePackage{mathabx}
\RequirePackage{mathpazo}
\RequirePackage[T1]{fontenc}
\fi


\ifphd
\gdef\@degreetype{\@degreeprefix {} doktorsexamen}
\gdef\@degreetypeenglish{Doctor of \@degreesuffix}
\else
\iflic
\gdef\@degreetype{\@degreeprefix {} licentiatexamen}
\gdef\@degreetypeenglish{Licentiate degree in \@degreesuffix}
\fi
\fi

\iflith
\iflic
\issn{0280-7971}
\fi
\ifphd
\issn{0345-7524}
\fi
\fi

% We use the same series for lic and PhD at Filfak/HU

\ifhu
% \ifphd
\issn{0345-0082}
% \fi
% \iflic
% \typeout{Please define the ISSN by issuing a \textbackslash issn command}
% \issn{\textbackslash\texttt{issn}}
% \fi
\fi

\iffilfak
% \ifphd
\issn{0282-9800}
% \fi
% \iflic
% \typeout{Please define the ISSN by issuing a \textbackslash issn command}
% \issn{\textbackslash\texttt{issn}}
% \fi
\fi

\newcommand{\swedishenglish}[2]{
\ifthenelse{\equal{\@thesislanguage}{swedish}}{#1}{#2}
}
\RequirePackage{csquotes}
\ifxetex
\RequirePackage{polyglossia}
\swedishenglish{
  \setmainlanguage{swedish}
  \setotherlanguages{english}
}{
  \setmainlanguage{english}
  \setotherlanguages{swedish}
}
\else
\swedishenglish{
  \RequirePackage[swedish]{babel}
}{
  \RequirePackage[english]{babel}
}
\fi
%% Include articles
\RequirePackage{calc}
\RequirePackage{ragged2e}

\definecolor{nicered}{rgb}{.647,.129,.149} 
\newsavebox{\feline@article} 
\newcommand\feline@article@marker[1][4cm]{%
  \sbox\feline@article{%
    \resizebox{!}{#1}{\fboxsep=1pt%
      \colorbox{nicered}{\color{white}\bfseries\thearticle\phantom{.}}%
    }}%
  \rotatebox{90}{%
    \resizebox{%
      \heightof{\usebox{\feline@article}}+\depthof{\usebox{\feline@article}}}%
    {!}{{\scshape \MakeUppercase Paper}}}\quad%
  \raisebox{\depthof{\usebox{\feline@article}}}{\usebox{\feline@article}}%
}
\newcommand\feline@chm[1][4cm]{%
  \sbox\feline@article{\feline@article@marker[#1]}%
  \makebox[0pt][l]{% aka \rlap
    \makebox[\spinemargin][r]{
      \usebox\feline@article
    }
  }
}

\newcounter{article}
\setcounter{article}{0}
\renewcommand{\thearticle}{\Roman{article}}
\includepdfset{pages=-}
\setlength{\TPVertModule}{2cm}
\setlength{\TPHorizModule}{\paperwidth - 4.3cm}
\newcommand{\papermark}{Paper \thearticle}

\newcommand{\includearticle}[2][pages=-]{%
  \@twosidetrue
  \refstepcounter{article}%
  \cleartorecto%
  \thispagestyle{empty}
  \mbox{}%
  \vspace*{\fill}
   \begin{center}%
     {\hfill \feline@chm[2.5cm]\\[2\baselineskip]}
     {\fullcite{#2}}
  \end{center}%
  \vspace*{\fill}%
  \cleartorecto%
  \label{art:#2}%
  \addcontentsline{toc}{chapter}{\papermark}%
  \includepdf[#1]{#2}%
}
\newenvironment{papers}{
  \makeevenhead{ruled}{\papermark}{}{}
  \renewcommand*{\thechapter}{\thearticle}
  \newlength{\numberheight}
 \makechapterstyle{paperstyle}{%
    \setlength{\afterchapskip}{40pt}
    \setlength{\numberheight}{10mm}
  \renewcommand*{\chapterheadstart}{\vspace*{40pt}}
    \renewcommand*{\afterchapternum}{\par\nobreak\vskip 25pt}
    \renewcommand*{\chapnamefont}{\normalfont\LARGE\flushright}
    \renewcommand*{\chapnumfont}{\normalfont\HUGE}
    \renewcommand*{\chaptitlefont}{\normalfont\Huge\bfseries\flushright}
    \renewcommand*{\printchaptername}{%
    }
    \renewcommand*{\chapternamenum}{}

    \renewcommand*{\printchapternum}{%
    }%
    \makeoddfoot{plain}{}{}{\thepage}}
    \renewcommand{\@chapapp}{\papermark}
    \chapterstyle{paperstyle}
}{}
\newcommand{\includearticletex}[1]{%
 \stepcounter{article}%
  \cleartorecto%
  \thispagestyle{empty}
  \mbox{}%
  \vspace*{\fill}
   \begin{center}%
     {\hfill \feline@chm[2.5cm]\\[2\baselineskip]}
     {\fullcite{#1}}
  \end{center}%
  \vspace*{\fill}%
  \clearpage{}
  \chapter[\papermark][\papermark]{\citetitle{#1}}
  \label{art:#1}
 \input{papers/#1}%
}

\ifx\pdfoutput\undefined
\else
\pdfoutput=1
\DeclareGraphicsExtensions{.pdf,.jpg,.png}
\fi

\graphicspath{{figures/}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                    %
%                     font selection, based on availability                               %
%                                                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\def\tryfonts#1#2{
  \ifxetex
    \def\primaryfont{"#1"} % first preferred font
    \def\secondaryfont{"#2"} % if first font not avaliable
    \count255=\interactionmode
    \batchmode
    \font\bodyfont=\primaryfont\space at 10pt
    \ifx\bodyfont\nullfont
      \font\bodyfont=\secondaryfont\space at 10pt
      \ifx\bodyfont\nullfont
        \errorstopmode
        \errmessage{Neither #1 or #2 fonts installed, quitting..}
      \else
        \fontspec{#2}
        \setmainfont{#2}
      \fi
    \else
      \fontspec{#1}
      \setmainfont{#1}
    \fi
    \interactionmode=\count255
    \else
    \typeout{ **** Please use XeTeX and install Calibri for correct typesetting ***}
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                    %
%                     The exhibit page                               %
%                                                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\exhibitpagelith}{%
  \tryfonts{Calibri}{Carlito}
    \copypagestyle{exhibitpagestyle}{plain}
    \makeevenfoot{exhibitpagestyle}{ISBN \@isbn}{}{ISSN \@issn}
    \makeoddfoot{exhibitpagestyle}{ISBN \@isbn}{}{ISSN \@issn}
    \thispagestyle{exhibitpagestyle}
  \begin{center}
    {\footnotesize \@publicationseries}\\
    {\footnotesize \ifphd Dissertations,\else Licentiate Thesis\fi {} No. \@thesisnumber}\\[15mm]
    {\Large\bfseries\swedishenglish{\@titleswedish}{\@titleenglish}}\\[5mm]
    by\\[5mm]
    {\Large\bfseries\@author}
    \vfill
    {\small\textbf{Akademisk avhandling}\\
    som för framläggande av \@degreetype{} i \@thesissubject{}
    vid Linköpings universitet kommer att offentligt försvaras i sal
    \@presentationroom, hus \@presentationbuilding, universitetsområde
    \@presentationcampus, \@presentationdate{} kl. \@presentationtime}\\[2\baselineskip]
    \textbf{Fakultetsopponent}\\
    \@opponenttitle{} \@opponentname\\
    \@opponentuniversity\\
    \@opponentcountry
    \\[15mm]
    \vfill
    \includegraphics[width=35mm]{liu_primary_black_en}
    \\[15mm]
   Linköping University\\
  \@departmentenglish\\
  \@division\\
    SE--581 83 Linköping\\[5mm]
    Linköping \@publicationyear\\
    \vspace*{1mm}
  \end{center}
  \clearpage{}
  \tryfonts{Calibri}{Carlito}
    \small \textbf{Abstract}\\
    \@abstract
    \vfill
    \footnotesize
    \begin{flushleft}
      Keywords: \@keywords\\[3mm]
      \@supportedby\mbox{}\\[3mm]
      URL:    \texttt{http://urn.kb.se/resolve?urn=urn:nbn:se:liu:diva-\@divanumber}\\[3mm]
    \end{flushleft}

  }


\newcommand{\exhibitpagefilfak}{%
  \begin{center}
    \tryfonts{KorolevLiU}{Calibri}
      \@publicationseries{} No. \@thesisnumber\\[3\baselineskip]
      {\Large\@titleswedish\\
        \@subtitleswedish}\\[5mm]\fi
      \small
      {\bfseries\@author}\\[5mm]
    {\bfseries Akademisk avhandling}\\
    som för framläggande av \@degreetype{} i \@thesissubject{}
    vid Filosofiska fakulteten kommer att offentligt försvaras i sal
    \@presentationroom, hus \@presentationbuilding, universitetsområde
    \@presentationcampus, \@presentationdate{} kl. \@presentationtime\\[2\baselineskip]
    {\bfseries Sammanfattning}\\
    \@exhibittextswedish\\[6mm]
    \vfill
    \begin{flushleft}
      Nyckelord: \@keywordsswedish\\[3mm]
    \end{flushleft}
    \includegraphics[width=35mm]{liu_primary_black_sv}\\
    \@department\\
    Linköpings universitet, 581 83 Linköping\\[5mm]
    ISBN \@isbn{} ISSN \@issn
  \clearpage{}
  \normalsize
   {\@publicationseries{} No. \@thesisnumber}\\[3\baselineskip]
   {\Large\@titleenglish\\
     \@subtitleenglish}\\[5mm]
   \small
   {\bfseries\@author}\\[5mm]
    {\textbf{Academic dissertation}\\
    Academic dissertation for the Degree of \@degreetypeenglish{} in \@thesissubjectenglish{}
    at the Faculty of Arts and Sciences to be publicly defended on
     \@presentationdateenglish{} at \@presentationtime{} in room
    \@presentationroom, building \@presentationbuilding, campus
    \@presentationcampus{} by \@author}
    \\[2\baselineskip]
    {\bfseries Abstract}\\
    \@abstract
  \vfill
  \begin{flushleft}
    Keywords: \@keywords\\[3mm]
  \end{flushleft}
  \includegraphics[width=35mm]{liu_primary_black_en} \\
    \@departmentenglish\\
   Linköping University, SE--581 83 Linköping\\[5mm]
    ISBN \@isbn{} ISSN \@issn
  \end{center}
  \clearpage{}
}

\newcommand{\gettitle}{\swedishenglish{\@titleswedish}{\@titleenglish}}

\iflic
\newcommand{\isrn}{LIU-\@facultyshort{}-Lic-{}-\@publicationyear:\@currentyearthesisnumber}
\fi

\ifstudent
\newcommand{\isrn}{LIU-\@departmentshort{}/\@area{}-EX-\@level{}-{}-\@publicationyear/\@currentyearthesisnumber-{}-SE}
\fi

\newcommand\makeundergraduatetitle{%
  {\tryfonts{Calibri}{Carlito}
      {\raggedleft%
      \sffamily%
      \swedishenglish{%
      \begin{large}%
        Linköpings universitet | \@department\par
        Examensarbete på \@thesistypenameswedish, \@thesiscredits hp | \@thesissubject\par%
        20\@publicationyear\ | \isrn\par%
      \end{large}%
      }{%
      \begin{large}%
        Linköping University | \@departmentenglish\par
        \@thesistypenameenglish{} thesis, \@thesiscredits{} ECTS | \@thesissubject\par%
        20\@publicationyear\ | \isrn\par%
      \end{large}%
      }%
      }%
      \vspace*{50mm}%
      \swedishenglish{%
        \hspace*{36mm}%
      }{%
        \hspace*{38mm}%
      }%
      \newlength{\thesiswidth}%
      \swedishenglish{%
        \setlength{\thesiswidth}{\paperwidth-86mm}%
      }{%
        \setlength{\thesiswidth}{\paperwidth-88mm}%
      }%
\begin{minipage}[t]{\thesiswidth}
      {\fontsize{25pt}{30pt}\selectfont\swedishenglish{\@titleswedish}{\@titleenglish}\par}%
      \swedishenglish{\ifsubtitleswedish}{\ifsubtitleenglish} -- {\fontsize{13pt}{15pt}\selectfont\swedishenglish{\@subtitleswedish}{\@subtitleenglish}\par}\fi%
      \hrulefill{}
      \\{}
      {\tryfonts{Calibri}{Carlito}{%
          \fontsize{13pt}{15pt}\selectfont%
          \textit{\swedishenglish{\@titleenglish}{\@titleswedish}}\par}%
        \swedishenglish{\ifsubtitleenglish}{\ifsubtitleswedish}--
        {\fontsize{13pt}{15pt}\textit{\selectfont\swedishenglish{\@subtitleenglish}{\@subtitleswedish}}\par}
      \fi}%
      \vspace*{10mm}%
      {\tryfonts{Calibri}{Carlito}\fontsize{12pt}{13pt}\selectfont\textbf{\@author}\par
      }%
      \vspace*{10mm}%
      {\tryfonts{Calibri}{Carlito}\fontsize{10pt}{11pt}\selectfont
        \parbox{\textwidth}{\swedishenglish{Handledare}{Supervisor}: \@supervisor\\
          \swedishenglish{Examinator}{Examiner}: \@examiner\\[2\baselineskip]
        \ifexternalsupervisor \swedishenglish{Extern
          handledare}{External supervisor}: \@externalsupervisor\fi}}%
 \end{minipage}
\vfill{}
\begin{textblock*}{\textwidth}(2cm,\paperheight-4cm)
  \swedishenglish{\gdef\@langlogo{sv}}{\gdef\@langlogo{en}}
  \parbox{0.4\textwidth}{\includegraphics[width=85mm]{liu_primary_black_\@langlogo}}%
  \hspace*{32mm}
  \parbox{0.5\textwidth}{\raggedleft%
    \vspace*{4mm}
    Linköpings universitet\\
    SE--581 83 Linköping\\
    \swedishenglish{013-28 10 00}{+46 13 28 10 00}, \href{http://www.liu.se}{www.liu.se}}
\end{textblock*}
    }
  }

\newcommand{\makegraduatetitle}{
  \tryfonts{Calibri}{Carlito}
  {\center
    {\footnotesize\centerline\@publicationseries{}%\\
      \ifphd
      Dissertations,
      \else
      Licentiate Thesis
      \fi No.  \@thesisnumber}\\[25mm]
     {\LARGE\bfseries\gettitle}\\[20mm]
     {\Large\bfseries\@author}\\
     \vfill
    \swedishenglish{\gdef\@langlogo{sv}}{\gdef\@langlogo{en}}
    \includegraphics[width=85mm]{liu_primary_black_\@langlogo}
   \\[12mm]
     {\footnotesize
     \swedishenglish{%
     \iflic
     Framlagd vid \@faculty{} vid Linköpings universitet som del av fordringarna för \@degreetype\\[6mm]
     \fi
     \@department \\
     Linköping universitet\\
     581 83 Linköping
     }{%
       Linköping University\\
       \@departmentenglish\\
       \@division\\
       SE-581 83 Linköping, Sweden\\
     }
    \vspace*{5mm}
     Linköping \@publicationyear\\
   }
   }
}

\ifstudent
\renewcommand{\maketitle}{\makeundergraduatetitle}
\else
\renewcommand{\maketitle}{\makegraduatetitle}
\fi

\newcommand{\abstractpages}{%
\ifphd
  \vspace*{6mm}
  \ifxetex
  \begin{swedish}
  \else
      \selectlanguage{swedish}
  \fi
  \setlength{\parindent}{0mm}
    \setlength\parskip{8pt}\centerline{POPULÄRVETENSKAPLIG SAMMANFATTNING}
    \vspace{3mm}
    \footnotesize{\@sammanfattning}
  \ifxetex
    \end{swedish}
  \else
    \swedishenglish
    {
    }
    {
    \selectlanguage{english}
    }
  \fi
\fi
  \newpage
  \vspace*{6mm}
  { \setlength{\parindent}{0mm}
    \setlength\parskip{8pt}\centerline{ABSTRACT}
    \vspace{3mm}
    \footnotesize{\@abstract}
  }
}

\newcommand{\makepermissionpage}{
  \mbox{}
  \iffilfak
  \ifphd
  \hspace{-\parindent}
  At the Faculty of Arts and Sciences at Linköping University,
  research and doctoral studies are carried out within broad problem
  areas. Research is organized in interdisciplinary research
  environments and doctoral studies mainly in graduate
  schools. Jointly, they publish the series Linköping Studies in Arts
  and Sciences. This thesis comes from \@division{} at the \@departmentenglish.
  \fi
  \fi
  \iflic
  \vfill
  \begin{center}
    {\footnotesize
    This is a Swedish Licentiate’s Thesis\\[0.8\baselineskip]
    Swedish postgraduate education leads to a doctor’s degree and/or a
    licentiate’s degree.\\
    A doctor’s degree comprises 240 ECTS credits
    (4 years of full-time studies).\\
    \vspace{-0.3\baselineskip}
    A licentiate’s degree comprises 120 ECTS credits.}
  \end{center}
  \fi
  \vfill
  \begin{flushleft}
    Edition \@edition\\[5mm]
    \copyright{} \@author, \@publicationyear\\
    ISBN \@isbn\\
    ISSN \@issn\\
    {\footnotesize URL \texttt{http://urn.kb.se/resolve?urn=urn:nbn:se:liu:diva-\@divanumber}}\\[1cm]
    Published articles have been reprinted with permission from the
    respective
    copyright holder.\\
%    Paper III \copyright{} XXX\\
    Typeset using \ifxetex\XeTeX\else\LaTeX\fi\\[1cm]
    Printed by LiU-Tryck, Linköping \@publicationyear
  \end{flushleft}
  \clearpage}

% Intro page for MSC theses
\newcommand{\makeinsidepage}{
  \thispagestyle{empty}
  {\tryfonts{Calibri}{Carlito}\selectfont

\vspace*{2cm}
 \section*{Upphovsrätt}
\label{sec:upphovsratt}

Detta dokument hålls tillgängligt på Internet – eller dess framtida ersättare –
under 25 år från publiceringsdatum under förutsättning att inga extraordinära
omständigheter uppstår. Tillgång till dokumentet innebär tillstånd för var och
en att läsa, ladda ner, skriva ut enstaka kopior för enskilt bruk och att
använda det oförändrat för ickekommersiell forskning och för undervisning.
Överföring av upphovsrätten vid en senare tidpunkt kan inte upphäva detta
tillstånd. All annan användning av dokumentet kräver upphovsmannens medgivande.
För att garantera äktheten, säkerheten och tillgängligheten finns lösningar av
teknisk och administrativ art. Upphovsmannens ideella rätt innefattar rätt att
bli nämnd som upphovsman i den omfattning som god sed kräver vid användning av
dokumentet på ovan beskrivna sätt samt skydd mot att dokumentet ändras eller
presenteras i sådan form eller i sådant sammanhang som är kränkande för
upphovsmannens litterära eller konstnärliga anseende eller egenart. För
ytterligare information om Linköping University Electronic Press se förlagets
hemsida \href{http://www.ep.liu.se/}{http://www.ep.liu.se/}.
\vspace*{2cm}
\section*{Copyright}
\label{sec:copyright}

The publishers will keep this document online on the Internet – or its possible
replacement – for a period of 25 years starting from the date of publication
barring exceptional circumstances. The online availability of the document
implies permanent permission for anyone to read, to download, or to print out
single copies for his/hers own use and to use it unchanged for non-commercial
research and educational purpose. Subsequent transfers of copyright cannot
revoke this permission. All other uses of the document are conditional upon the
consent of the copyright owner. The publisher has taken technical and
administrative measures to assure authenticity, security and accessibility.
According to intellectual property law the author has the right to be mentioned
when his/her work is accessed as described above and to be protected against
infringement. For additional information about the Linköping University
Electronic Press and its procedures for publication and for assurance of
document integrity, please refer to its www home page:
\href{http://www.ep.liu.se/}{http://www.ep.liu.se/}.

\vfill{}
\copyright{} \@author
\vfill{}
}
}


\newcommand{\makededicationpage}{
\mbox{}
\vfill
\begin{center}
\@dedication\\
\end{center}
\vfill
}

%%%%%%%%%%%%%%%%%
%
% Page size and layout
%
%%%%%%%%%%%%%%%%%
\clubpenalty=10000
\widowpenalty=10000
\raggedbottom
\midsloppy

\newlength{\mylen}	% a length
\newcommand{\alphabet}{abcdefghijklmnopqrstuvwxyzåäö} % the lowercase
                                % alphabet
\begingroup
% keep font change local
% font specification e.g.,
% \Large\sffamily
\settowidth{\mylen}{\alphabet}
% The length of this alphabet is
% \the\mylen.
\typeout{The length of the alphabet is \the\mylen}
% put in log file
% end the grouping
\endgroup

% Tryckmaterialets storlek
\setstocksize{297mm}{210mm}
%
\ifstudent
\settrimmedsize{290mm}{205mm}{*}
\settypeblocksize{*}{34pc}{1.618} % golden ratio
\else
% LiU-specific definition of the S5 format
\settrimmedsize {240mm}{165mm}{*}
\settypeblocksize{*}{28pc}{1.618}
\fi

\newcommand{\resetlayout}{
  \setlength{\trimtop}{\stockheight} % \trimtop = \stockheight  - \paperheight
  \addtolength{\trimtop}{-\paperheight} %
  \setlength{\trimedge}{\stockwidth} % \trimedge = \stockwidth - \paperwidth
  \addtolength{\trimedge}{-\paperwidth} %
  % Beskär endast höger- och nederkanten på respektive papper
  % \settrims{0pt}{0pt}
  % Beskär runt om: Centrera tryckytan på pappret
  \settrims{0.5\trimtop}{0.5\trimedge}
  % Inner margin 2cm
  \ifprinterfriendly
  \renewcommand{\clearforchapter}{\cleartooddpage}
  \fi
  \ifstudent
  \setlrmargins{*}{*}{1}
  \else
  \setlrmargins{*}{*}{1.5}
  \fi
  % Övre marginal 2cm, den undre automatiskt beräknad
  \setulmargins{2cm}{*}{*}
}
%
% Common layout settings



% Variables and page layout
\linespread{1.05}

\typeout{******** LiU thesis layout ********}
\typeoutlayout
\typeout{******** Standard memoir layout ********}
\typeoutstandardlayout

%% Load user settings from the file settings.tex

\AtBeginDocument{%
  \resetlayout
  \checkandfixthelayout
  \pagestyle{empty}
  \ifexhibitpage
  \iflith
  \exhibitpagelith
  \else
  \exhibitpagefilfak
  \fi
\end{document}%
\endinput%
\fi
  \pagenumbering{roman}
\begin{adjustwidth}{-1cm}{-1cm}
 \maketitle
  \newpage
\end{adjustwidth}

  \ifstudent
  \makeinsidepage
  \else
  \pagestyle{plain}
  \makepermissionpage
  \fi
  \ifdedication
  \makededicationpage
  \fi
  \cleartorecto%
\phantomsection
\swedishenglish{\addcontentsline{toc}{chapter}{Sammanfattning}}
{\addcontentsline{toc}{chapter}{Abstract}}
\clearpage
\ifstudent
\begin{abstract}
  \@abstract
\end{abstract}
\else
\abstractpages
\fi
\clearpage
  \newpage
  \@acknowledgments
  \swedishenglish{\addcontentsline{toc}{chapter}{Författarens tack}}
  {\addcontentsline{toc}{chapter}{Acknowledgments}}
  \clearpage
  {\pagestyle{plain}\tableofcontents\relax\clearpage}
  \iftotalfigures {\pagestyle{plain}\listoffigures\relax\clearpage}\fi
  \iftotaltables {\pagestyle{plain}\listoftables\relax\clearpage}\fi
  \@ifpackageloaded{todonotes}{\pagestyle{plain}\listoftodos\relax\clearpage}{}
  \ifprinterfriendly
    \cleartooddpage
  \else
    \cleartorecto
  \fi
  \pagenumbering{arabic}
  \pagestyle{ruled}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% liuthesis.cls ends here
