# Emacs for Latex on Mac OS X


### Install Emacs

This article is primarily for Mac users. Though one can download the pure emacs (e.g., [pure emacs](http://emacsformacosx.com/)) or a managed emacs (e.g., [aquamacs](http://aquamacs.org)). I suggest to install Emacs using homebrew

```
brew install --cocoa --srgb emacs
brew linkapps emacs
```

It essentially installs pure emacs by downloading and compiling the emacs from [GNU](http://www.gnu.org/software/emacs/). Future update is made easy by using 

`brew update && brew upgrade && brew cleanup`

> Homebrew is quite a nice tool to manage most of popular packages on Mac. For more information, see [homebrew](http://brew.sh).


Vim users, please cool down :) I am not saying Emacs is any better than vim. Just for the task of latex editing, Emacs combined with auctex indeed provides great convenience, at least in my view. 

### Setting up Emacs for Latex Editing

Without setting up, Emacs can be used right after installation. But it does not look nice and function properly as you expect. To set up, we need create the `init.el` file and a few others in the hidden folder `.emacs.d` in the current user's home folder. You can download my `.emacs.d` from [https://github.com/reijz/my-settings](https://github.com/reijz/my-settings). Here is what you need to do for setting up: 


1. Install [auctex](http://www.gnu.org/software/auctex/)
    
   `brew install auctex`

2. Install [aspell](http://aspell.net) 

    `brew install aspell --with-lang-en`

3. Put the `.emacs.d` folder in your home folder
4. Put the `.latexmkrc` file in your home folder
5. **Add** the following line 

   `file_line_error_style = t`

   to file `/usr/local/texlive/2014/texmf.cnf`
 
The above steps basically customize and set up the following things

* For the appearance, I changed the font face and enlarge the size. I also add line number on the left, and highlight the line where the cursor is. I make the cursor type box, and blinking with different colours. 
* I also customized a few key bindings, `⌘`+`→` to go to the end of the current line, and `⌘`+`←` to the beginning. 
* I set up the spell checker to be [aspell](http://aspell.net). That is why you need to install aspell using homebrew in the above step 2. 
* For latex, I set the compiler to be `pdflatex`, loaded [auctex](http://www.gnu.org/software/auctex/) (step 3 in the above).
* I make [latexmk](http://users.phys.psu.edu/~collins/software/latexmk-jcc/) available in compiling tools. Often in time, you need to compile the latex file multiple time to get the reference (to equations, section, bib items) right. With latexmk, you don't need to worry about it. Latexmk is a perl script for running LaTeX the correct number of times to resolve cross references. In order this works with emacs, you need to set it up as I did in the `.emacs.d` (step 3 in the above) and put the `.latexmkrc` file in the home folder of unix/linux user (step 4 in the above).
* Step 5 is needed for error handling when compiling latex. I got the tip from 
  [https://groups.google.com/forum/#!topic/comp.text.tex/aY3xrX7F3eM]
   (https://groups.google.com/forum/#!topic/comp.text.tex/aY3xrX7F3eM)

### Compiling and Error Handling

1. Compile the latex file use `C-c C-c`. The short cut means `⌃`+`c` followed immediately with `⌃`+`c`. This by default invokes the latexmk script. You may also choose to clean up all the auxiliary files. 
2. Whenever you see an error after compiling, just press `C-c` ```, you can see the detailed error message and the line where it occurs. 


### Sync with pdf viewer

Emacs can also sync with pdf reader [skim](http://skim-app.sourceforge.net) on OS X. For syncing, please go to the preference of the skim app, choose the “sync”, and set “preset” to be “emacs” from the dropdown menu. 

Then `shift-cmd-click` on pdf in skim will take you to the corresponding location in the latex code, and same action on the latex code in emacs will take you to the corresponding location in the pdf file. The accuracy is up to the line in latex code.  

[http://mactex-wiki.tug.org/wiki/index.php/SyncTeX]
(http://mactex-wiki.tug.org/wiki/index.php/SyncTeX)


### Some basic shortcuts to get started

Latexing using emacs with [auctex](http://www.gnu.org/software/auctex/) is quite easy. Here is a brief list of command short cuts to get you started. 


2. To type any begin/end environment, you just need to type `C-c C-e`. 
3. Referencing an equation/section is easy. Use `C-c C-)` you will see the list of all equations/sections in the paper. 
4. To reference any article in your bib file, just use `C-c C-[` and type author's name or some words in the title, you will see the list of papers containing the words you type. 
5. Navigating through long article is also easy, just use `C-c C-=`. 
6. In math environment, to type a greek letter, just use ```+`a` for `\alpha`. See the reference card for a complete list. Most are intuitive, e.g., ```+`e` for `\epsilon` and ```+`b` for `\beta`.
7. You can insert `$`...`$` or `\(...\)` (in fact most paired parenthesis and brackets) by typing a single `$` or `\(`. In order to use this feature.
8. There are more advantages, see the reference card. You may also google if you need any features particularly for yourself.

See the [reference card](http://verse.ielm.ust.hk/files/tex-ref.pdf) for various shortcuts.
