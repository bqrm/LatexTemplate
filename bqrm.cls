%
% this file 'bqrm.cls' defines the detailed parameters of the template
% compiled on MikTeX-2.9-X86, using 'pdfLaTeX+MakeIndex+BibTex'
% 
% 
% version:	1.8
%
% Create:	2017/07/20
% Modified:	2017/09/29
% Modified:	2017/10/23, colored href
% Modified:	2018/04/05, no page number of first page of chapter
% Modified:	2018/04/20, add support for gif
% Modified:	2018/04/20, modify setenumerate, setitemize and setdescription
% Modified:	2018/04/20, set depth of content to 4
% Modified:	2018/05/14, add watermark
% Modified:	2018/07/04, disable watermark by default
% Modified:	2018/07/27, revise header
% 
% Copyright(C) 2017-2018 bqrmtao@qq.com
%

\NeedsTeXFormat{LaTeX2e}[2017/09/29]
\ProvidesClass{bqrm}

\def\bqrmtao{BqrmTao}

% 参数控制选项
\input{bqrm.cfg}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\let\tableofcontents\relax

\ifbqrm@istwoside
	\LoadClass[UTF8, space=auto, openright, cs4size, a4paper, twoside]{ctexbook}
\else
	\LoadClass[UTF8, space=auto, openany, cs4size, a4paper, oneside]{ctexbook}
\fi

% 若批注开启，显示批注
\newcommand{\addcomment}[2]{{#2}}
\RequirePackage{etex}
\RequirePackage[textwidth=2.9cm,shadow, backgroundcolor=lime]{todonotes}
\ifbqrm@iscommented
    \renewcommand\addcomment[2]
	{
		\todo{#1}
		{\color{gray}#2}
	}
\fi

\newcommand{\pozhehao}{\kern0.3ex\rule[0.8ex]{2em}{0.1ex}\kern0.3ex}

% 文档格式控制
\RequirePackage{geometry}
\geometry
{
	top			= 3.5cm,	%面边距上
	bottom		= 3.5cm,	%面边距下
	left		= 3.5cm,	%面边距左
	right		= 3.5cm, 	%面边距右
	headheight	= 2.6cm,	%页眉
	headsep		= 3mm,		%
	footskip	= 13mm		%
}

% 设置页眉页脚
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\footrulewidth}{0pt}
\ifbqrm@istwoside
	\renewcommand{\headrulewidth}{0pt}
%	\renewcommand{\rightmark}{\thesection \; \chaptername}
	\fancyhead[RE]{\protect \nouppercase \leftmark}		% even pages on right
	\fancyhead[LO]{\protect \nouppercase \rightmark}	% odd pages on left
\else
	\fancyhead[C]{\protect \nouppercase \rightmark}	
\fi
\fancyfoot[C]{\small {\bf\thepage}}	%页脚

% 第一页页码为空
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
					\thispagestyle{empty}
					\global\@topnum\z@
					\@afterindentfalse
					\secdef\@chapter\@schapter}

% 设定目录格式
\RequirePackage{titletoc}

% 设置目录深度
\setcounter{secnumdepth}{4}

% 文字加阴影
\RequirePackage{framed}

% 图表标题格式控制
\RequirePackage{caption}

% 文件树
\RequirePackage{dirtree}
\RequirePackage{varwidth}

% 位置控制
\RequirePackage{float}

% 文字行距
\RequirePackage{setspace}
\setstretch{1.38}

% 图形宏包
\RequirePackage{graphicx}
\RequirePackage{subfig}
\DeclareGraphicsExtensions{.png, .jpg, .gif, .pdf, .eps, .mps}
\graphicspath{{figure/}}

% gif 图片，ImageMagick 转换成 png
\usepackage{animate}
% 将 \includegraphics 替换为以下命令
% \animategraphics
%    [autoplay,		% 自动播放
%     loop,			% 循环播放
%     controls,		% 控制条
%     width=.7\textwidth,
%     height=.7\textheight
%    ]
%    {4}			% 一秒播放几张
%    {folder/ra-}	% 循环播放的 PNG 图片名前缀
%    {0}			% 第一张图片的序号
%    {3}			% 最后一张图片的序号

% 设置字体
%\RequirePackage{txfonts}

% 颜色宏包
%\RequirePackage{color}
\RequirePackage{xcolor}

% 首行缩进宏包
\RequirePackage{indentfirst}

% 引用
\RequirePackage{hyperref}
%\RequirePackage{hypernat}
\hypersetup
{
%	CJKbookmarks		= true,	%会造成章节名中部分汉字冲突
%	unicode				= true,	%
%	pdfstartview		= FitH, %
	bookmarksnumbered	= true,
	bookmarksopen		= true,
	bookmarksopenlevel	= 0,
	breaklinks			= true,
	colorlinks			= true,
	plainpages			= false,
	pdfpagelabels,
	pdfborder			= 0 0 0,
	linkcolor			= black,%
	urlcolor			= black,%
	citecolor			= black	%
}

% 表格控制
\RequirePackage{multirow}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{slashbox}

% tabularx 需要在 hyperref 之后引入才不会使正文的 footnote 的超链接失效
\RequirePackage{tabularx}

% assumption
\RequirePackage{amsmath,amssymb}

% 代码宏包
\RequirePackage{listings}
\lstset
{
	tabsize				= 4 , %
	%frame				= shadowbox,		%把代码用带有阴影的框圈起来
	backgroundcolor		= \color{black!5},	%设置代码背景色
	commentstyle		= \color{black!100},%浅灰色的注释
	rulesepcolor		= \color{red!20!green!20!blue!20},	%代码块边框为淡青色
	keywordstyle		= \color{blue!}\bfseries,	%代码关键字的颜色为蓝色，粗体
	showstringspaces	= true,			%显示代码字符串中间的空格标记
	stringstyle			= \ttfamily,	%代码字符串的特殊格式
	keepspaces			= true,	%
	breakindent			= 22pt,	%
	numbers				= left,	%左侧显示行号
	stepnumber			= 1,	%
	numberstyle			= \small,	%行号字体用小号
	basicstyle			= \small,	%
	showspaces			= false,	%
	flexiblecolumns		= true,	%
	breaklines			= true,	%对过长的代码自动换行
	breakautoindent		= true,	%
	breakindent			= 4em,	%
	escapebegin			= \begin{CJK*}{GBK}{kai},	%代码中文支持
	escapeend			= \end{CJK*},	%代码中文支持
	aboveskip			= 1em,	%代码块边框
	fontadjust			= true,	%
	captionpos			= t,	%
	framextopmargin		= 2pt,	%
	framexbottommargin	= 2pt,	%
	abovecaptionskip	=-3pt,	%
	belowcaptionskip	= 3pt,	%
	%xleftmargin		=-1em,	%
	%xrightmargin		=-1em,	%listing左右的空白
	%numbersep			=-1em,	%listing数字的样式
	texcl				= true,	%
	extendedchars		= false,	%
	columns				= flexible,	%
	mathescape			= true	%
}

% 下划线自动换行
\RequirePackage{ulem}

% 更换英文字体
\renewcommand{\sfdefault}{phv}
\renewcommand{\rmdefault}{ptm}
\renewcommand{\ttdefault}{pcr}

% 附录控制
\RequirePackage{appendix}

% 定制中文文档的相关变化
\ifbqrm@iszh

	% 中文环境修改为“目录”
	\renewcommand\contentsname{目\hspace{0.5em}录}
	
	% 定公式、图、表编号为"1-1"的形式，子图和子表的应用序号外加小括号，1-1(a)
	\renewcommand\theequation{\arabic{chapter}--\arabic{equation}}
	\renewcommand\thefigure{\arabic{chapter}--\arabic{figure}}
	\renewcommand\thetable{\arabic{chapter}--\arabic{table}}
	
	% 重命名标题头
	\newtheorem{proof}{证明}
	\newtheorem{assumption}{假设}[chapter]
	\newtheorem{definition}{定义}[chapter]
	\newtheorem{proposition}{命题}[chapter]
	\newtheorem{lemma}{引理}[chapter]
	\newtheorem{theorem}{定理}[chapter]
	\newtheorem{axiom}{公理}[chapter]
	\newtheorem{corollary}{推论}[chapter]
	\newtheorem{exercise}{练习}[chapter]
	\newtheorem{example}{例}[chapter]
	\newtheorem{remark}{注释}[chapter]
	\newtheorem{problem}{问题}[chapter]
	\newtheorem{conjecture}{猜想}[chapter]
	\renewcommand{\lstlistingname}{代码}
	\renewcommand\listfigurename{插图索引}
	\renewcommand\listtablename{表格索引}
	\newcommand\listequationname{公式索引}
	\newcommand\equationname{公式}
	\renewcommand\bibname{参考文献}
	\renewcommand\indexname{索引}
	\renewcommand\figurename{图}
	\renewcommand\tablename{表}
	
	% 设置章节名格式
	\CTEXsetup
	[
		number		= {\arabic{chapter}},
		name		= {第,章},
		nameformat	= {\bfseries\centering\zihao{-2}},
		titleformat	= {\bfseries\zihao{-2}},
		afterskip	= {30pt},
		beforeskip	= {10pt}
	]{chapter}
	\CTEXsetup
	[
		nameformat	= {\bfseries\zihao{3}},
		titleformat	= {\bfseries\zihao{3}},
		format		= {\Large\bfseries} % 标题靠左
	]{section}
	\CTEXsetup
	[
		nameformat	= {\bfseries\zihao{4}},
		titleformat	= {\bfseries\zihao{4}}
	]{subsection}
	\CTEXsetup
	[
		nameformat	= {\bfseries\zihao{-4}},
		titleformat	= {\bfseries\zihao{-4}}
	]{subsubsection}
	% 设置附录格式
	\CTEXsetup
	[
		number		= {\Alph{chapter}},
		name		= {附录 {} {},},
	]{appendix}
	
	\titlecontents{chapter}[0pt]{\vspace{0.25\baselineskip} \heiti \zihao{-4}}{\thecontentslabel\quad}{}{\hspace{.5em}\titlerule*{.}\contentspage}
	\titlecontents{section}[2em]{\songti \zihao{-4}}{\thecontentslabel\quad}{}{\hspace{.5em}\titlerule*{.}\contentspage}
	\titlecontents{subsection}[4em]{\songti \zihao{-4}}{\thecontentslabel\quad}{}{\hspace{.5em}\titlerule*{.}\contentspage}
	
\else
% 定制英文文档的相关变化
	\renewcommand\contentsname{Contents}
	
	% 定公式、图、表编号为"1.1"的形式，子图和子表的应用序号外加小括号，1.1(a)
	\renewcommand\theequation{\arabic{chapter}.\arabic{equation}}
	\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
	\renewcommand\thetable{\arabic{chapter}.\arabic{table}}
	
	% 重命名标题头
	\newtheorem{proof}{Proof}
	\newtheorem{assumption}{Assumption}[chapter]
	\newtheorem{definition}{Definition}[chapter]
	\newtheorem{proposition}{Proposition}[chapter]
	\newtheorem{lemma}{Lemma}[chapter]
	\newtheorem{theorem}{Theorem}[chapter]
	\newtheorem{axiom}{Axiom}[chapter]
	\newtheorem{corollary}{Corollary}[chapter]
	\newtheorem{exercise}{Exercise}[chapter]
	\newtheorem{example}{Example}[chapter]
	\newtheorem{remark}{Remark}[chapter]
	\newtheorem{problem}{Problem}[chapter]
	\newtheorem{conjecture}{Conjecture}[chapter]
	\renewcommand{\lstlistingname}{Code}
	\renewcommand\listfigurename{Index of Figures}
	\renewcommand\listtablename{Index of Tables}
	\newcommand\listequationname{Index of Equations}
	\newcommand\equationname{Equation}
	\renewcommand\bibname{Reference}
	\renewcommand\indexname{Index}
	\renewcommand\figurename{Figure}
	\renewcommand\tablename{Table}
	
	% 设置章节名格式
	\CTEXsetup
	[
		number		= {\arabic{chapter}},
		name		= {},
		nameformat	= {\bfseries\centering\zihao{-2}},
		titleformat	= {\bfseries\zihao{-2}},
		afterskip	= {30pt},
		beforeskip	= {10pt}
	]{chapter}
	\CTEXsetup
	[
		nameformat	= {\bfseries\zihao{3}},
		titleformat	= {\bfseries\zihao{3}},
		format		= {\Large\bfseries} % 标题靠左
	]{section}
	\CTEXsetup
	[
		nameformat={\bfseries\zihao{4}},
		titleformat={\bfseries\zihao{4}}
	]{subsection}
	\CTEXsetup
	[
		nameformat={\bfseries\zihao{-4}},
		titleformat={\bfseries\zihao{-4}}
	]{subsubsection}
	% 设置附录格式
	\CTEXsetup
	[
		number		= {\Alph{chapter}},
		name		= {Appendix {} {},},
	]{appendix}
	
	\titlecontents{chapter}[0pt]{\vspace{0.25\baselineskip} \heiti \zihao{-4}}{\thecontentslabel\quad}{}{\hspace{.5em}\titlerule*{.}\contentspage}
	\titlecontents{section}[2em]{\songti \zihao{-4}}{\thecontentslabel\quad}{}{\hspace{.5em}\titlerule*{.}\contentspage}
	\titlecontents{subsection}[4em]{\songti \zihao{-4}}{\thecontentslabel\quad}{}{\hspace{.5em}\titlerule*{.}\contentspage}	

\fi

% 生成封面
\newcommand{\makecover}
{
	\begin{titlepage}
		\vskip 200pt
		\noindent \rule{\textwidth}{1mm}
		
		\vskip 30pt
		
		\begin{flushleft}
		\hspace{20pt} \huge \textbf{{\heiti \bqrm@maintitle}}
		\vskip 20pt
		\hspace{20pt} \large {\heiti \bqrm@subtitle}
		\end{flushleft}
		
		\vskip -10pt
		\noindent \rule{\textwidth}{0.3mm}
		
		\vskip 50pt
		
		\begin{flushright}
			\huge \textbf{{\heiti \bqrm@authorname}} \hspace{20pt}
			\vskip 10pt
			\small {\bqrm@organizationname} \hspace{25pt}
			\vskip 10pt
		\end{flushright}
		
		\vfill
		
		\begin{figure}[H]
			\includegraphics[height=2em]{\bqrm@logoname}
		\end{figure}
		
		\vskip-15pt
		\noindent \normalsize \textbf{{\heiti \bqrm@publishername}}
		
	\end{titlepage}
}

\newcommand{\changeappendexchapternumber}
{
	\ifbqrm@iszh
		\renewcommand{\thefigure}{\Alph{chapter}-\arabic{figure}}
		\renewcommand{\thetable}{\Alph{chapter}-\arabic{table}}
		\renewcommand{\theequation}{\Alph{chapter}-\arabic{equation}}
	\else
		\renewcommand{\thefigure}{\Alph{chapter}.\arabic{figure}}
		\renewcommand{\thetable}{\Alph{chapter}.\arabic{table}}
		\renewcommand{\theequation}{\Alph{chapter}.\arabic{equation}}
	\fi
}

% 
\RequirePackage{enumerate}
\RequirePackage{enumitem}
\setenumerate[1]
{
	partopsep	= 0pt,	% 好像无效
	parsep		= 0pt,	% item 之间的间隔
	topsep		= 5pt	% 整个结构与上一行的距离
}
\setitemize[1]
{
	partopsep	= 0pt,	% 好像无效
	parsep		= 0pt,	% item 之间的间隔
	topsep		= 5pt	% 整个结构与上一行的距离
}
\setdescription
{
	partopsep	= 0pt,	% 好像无效
	parsep		= 0pt,	% item 之间的间隔
	topsep		= 5pt	% 整个结构与上一行的距离
}

\RequirePackage{draftwatermark}
\SetWatermarkText{BQRM}
\SetWatermarkLightness{0.95}
\SetWatermarkScale{1}
\SetWatermarkAngle{60}
\@sc@wm@stampfalse			% 默认不显示水印

\newcommand\WatermarkOn		% 添加水印
{
	\@sc@wm@stamptrue
}

\newcommand\WatermarkOff	% 去除水印
{
	\@sc@wm@stampfalse
}

% 自定义宏包
\RequirePackage{bqrm}

\endinput
% end of 'bqrm.cls'
