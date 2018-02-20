# LaTeX class for LiU Thesis

This is `liuthesis`, a modern class for writing a thesis for PhD, Licenciate,
Master, or Bachelor (plus some more) at Linköping University (LiU) in Sweden. 

## Contributors

This list is not sorted in any particular order. Initial work was done by Ola
Leifler, but several people have since made contributions to liuthesis. See the 
commit log for details.

- Ola Leifler, ola.leifler@liu.se
- Jonathan Jogenfors, jonathan.jogenfors@liu.se
- Ivan Ukhov, ivan.ukhov@liu.se

## How to contribute

Please do submit issues so we know what works and what does not work. 
If your issue pertains to deviations from prescribed formats, please include a 
pdf or other detailed description of how the typeset material should look. If 
there are missing features or bugs, please provide a minimal example that 
demonstrates the issue, along with a description of your environment. At best, 
provide a merge request. Remember that each merge request should address one 
specific issue, though, and be generally applicable to all theses at LiU. 
Merge Requests will be reviewed and approved by main developers, currently Ola 
Leifler.

## Where to download

The latest version can always be found on GitLab. `liuthesis` is constantly
being developed, so go to [the download
page](https://gitlab.ida.liu.se/olale55/liuthesis) to get the latest version.

## Package options

The following options are recognized by the liuthesis document class

- `phd` - For doctoral dissertations 
- `lic` - For licentiate theses
- `msc` - For Masters' theses (default)
- `bachelor` - For Bachelors' theses
- `hu`     - For the medical sciences (experimental)
- `filfak` - For the Faculty of Arts and Sciences
- `lith`   - For LiTH (default)
- `exhibitpage` - Produce an exhibit page (spikblad) and no thesis. Use
	      this option to produce an exhibit page only for Licentiate/PhD
	      dissertations.
- `printerfriendly` - ensure chapters begin on recto pages
- `swedish` - use Swedish as the main language, English as the secondary language
- `english` - use English as the main language

Since `liuthesis` is based on the [memoir](https://www.ctan.org/pkg/memoir)
document class, all options supported by `memoir` are supported by `liuthesis`as
well.

## System Requirements

You need a modern LaTeX distribution to be able to use `liuthesis`. Depending on
your operating system, we recommend you install the following distribution:
* For Linux systems: `TeXLive` (we recommend at least version 2016).
* For Windows systems: `MiKTeX` (we recommend at least version 2.9).
* For Mac/OSX systems: `MacTeX`.

More information on which distribution to choose can be found [at the LaTeX
project homepage](https://www.latex-project.org/get/).

`liuthesis` takes full advantage of the features of modern LaTeX, so you need
to make sure your distribution installs at least the following packages (list
incomplete):
* `biblatex`
* `biber`

When LaTeX has been installed, you are ready to use `liuthesis`. When compiling,
`liuthesis` you have the option of choosing between the following build
environments: 
* `XeLaTeX` (recommended)
* `pdfLaTeX`

While the standard `pdfLaTeX` engine can be used for building, `XeTeX` is
recommended in order to get the corrects fonts
(`KorolevLiU`/`Calibri`/`Carlito`) used in the LiU style manual. When `XeTeX` is
used, the `polyglossia`, `mathspec`, `fontspec`, `xunicode` and, `xltxtra`
packages are loaded. When `pdfLaTeX` is used, `babel`, `palatino`, and
`mathpazo` packages are used instead.

For correct font typesetting according to the LiU style manual, the proprietary
fonts  `KorolevLiU` or `Calibri` are required. `Carlito` may be used as a
fallback for `Calibri` on systems that do not have `Calibri`
installed. `KorolevLiU` is only used for exhibit pages ("spikblad") on the
philosophical faculty.

## Packages included

The `liuthesis` package includes a number of packages for convenient,
contemporary TeX typesetting.

The [BibLaTeX](https://www.ctan.org/pkg/biblatex) package is used for
managing references. Currently, there is no way to specify the
load-time options to biblatex as document class options together with
other options, so the biblatex package _has to be loaded manually_ in
settings.tex (see Usage below).

## Usage

This package contains a style file for theses (`liuthesis.cls`) and a file
`settings.tex` which must at least include the lines

```
\usepackage{biblatex}
\addbibresource{<my bibliography file>}
```

and possibly other settings. In the directory `figures/`, you should place all
graphics for your thesis. Logos are included for LiU, please add other logotypes
as appropriate.

In your thesis file, you need to specify where the bibliography should be
typeset using the command `\printbibliography`.

All files must be typeset using UTF-8 in order for non-latin characters such as
åäö to work. Any modern editor will support this, and is probably enabled by
default.

## Example files

To make it easy to get started, a number of demonstration files are included: 

* `demo_student_thesis.tex` for Bachelor and Master student theses
* `demo_lith_lic.tex` for Licenciate theses at LiTH
* `demo_filfak_lic.tex` for Licenciate theses at Filfak
* `demo_lith_phd.tex` for PhD theses at LiTH
* `demo_filfak_phd.tex` for PhD theses at Filfak
* `demo_exhibipage_lith.tex` for exhibit pages (spikblad) at LiTH
* `demo_exhibipage_filfak.tex` for exhibit pages (spikblad) at Filfak

These demo pages are a good starting point and can be customized to your needs.
Put your abstract in the file `Abstract.tex` (mandatory), and if your thesis
requires a Swedish summary, put it in `sammanfattning.tex`. The demo files have
further documentation to get you started.

## Makefile

If you are on a platform where you can use `make` for building your PDF, we have
prepared a `Makefile`. Edit the name of the main file that you wish to process
(`TEXMAINFILE`) and run `make`. This will run `XeLaTeX` and `biber` as many
times as needed to produce a PDF. To clean all auxiliary files, run `make
clean`. To typeset the demos, run `make demos`, which will compile the demo
files.

## Including articles

```
\includearticle{<citekey>}
```

With the `\includearticle` command, you can include PDF articles and refer to
them in your thesis. An example of this is given in the demo files (see above).
`<citekey>` should be the same as the key in your bibliography which describes
your article, and the file name of the PDF file. You can refer to your articles
in your thesis using the reference key `art:<citekey>`.

```
\includearticletex{<citekey>}
```

With the `\includearticletex` command, you can include TeX articles and refer to
them in your thesis. The demonstration files for PhD and Licenciate (see above)
include examples for this. `<citekey>` should be the same as the key in your
bibliography which describes your article, and the file name of the TeX
manuscript in the papers/ directory. Please refer to the `scigen.tex` example
for hints how you format your manuscript for inclusion. You can refer to your
articles in your thesis using the reference key `art:<citekey>`.

There are a number of commands with one parameter which should be used
to specify thesis metadata, and they are all typeset using the command
names as they appear in the PDF. For instance, using the command
`\opponent{Your opponent}`, you can specify the opponent. If you do not,
the PDF will contain the verbatim text `\opponent` on all locations
where the argument supplied to that command will substitute
`\opponent`.

## File headers

To use and update the file headers appropriately, you will need Emacs
with the `header2` package. Put this information in an Emacs init file:

```
(require 'package)
;; Marmalade
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;; The original ELPA archive still has some useful
;; stuff.
 (add-to-list 'package-archives
              '("elpa" . "http://tromey.com/elpa/"))
(package-initialize)

(autoload 'auto-update-file-header "header2")
(add-hook 'write-file-hooks 'auto-update-file-header)
(add-hook 'latex-mode-hook   'auto-make-header)
```

## Complete list of parameters

This is a complete list of parameters that can be modified as part of the
template. Some of them are set by specifying a document class option, but all
are available in the main manuscript and can be overwritten if necessary. Here
is a description of them.

All parameters are accessible through eponymous commands that render the name of
the command, so that it will be obvious (hopefully) which commands to use for
parametrizing the thesis.

Thus, `\createvariable{edition}` creates a command `\edition{}` which accepts a
single parameter and sets the global variable `\@edition`, which is given the
initial value `\texttt{\textbackslash edition}`.


```
%% The edition of the PhD thesis (at the philosophical faculty)
\createvariable{edition}

%% Parameters for the exhibit page (spikblad)
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

%% Undergrad specific

% faculty abbreviation, for the publication number
\createvariable{area}

% First-cycle/Second-cycle
\createvariable{level}
\createvariable{thesistypenameswedish}
\createvariable{thesistypenameenglish}

% 15/16/30 credit thesis
\createvariable{thesiscredits}

\createvariable{thesissubject}
\createvariable{thesissubjectenglish}
```


