syntax enable

"Pathogen configuration
execute pathogen#infect()

"Setup vim-colors-solarized
	set background=dark
	colorscheme solarized "torte, evening, & murphy

"set smartcase " Auto capitilization

"Tabbing (http://vim.wikia.com/wiki/Indenting_source_code)
	set tabstop=4 " Width of TAB is set to 4, still \t
	set shiftwidth=4 " indents will have a width of 4

	set smarttab "Will insert indentation depending on cursor location
	set smartindent "Auto insertion of indentation


"Turn on the wild menu
set wildmenu

"Set folding options
	"This automatically folds opened files based on indentation
	set foldmethod=syntax "indent
	set foldlevel=2
	set foldclose=all

	"Controls:
	"zo - opens fold
	"zc - closes fold
	"zm - increases auto fold depth
	"zr - decreases auto fold depth
