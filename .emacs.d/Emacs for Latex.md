# Emacs for Latex on Mac OS X


### Install Emacs

This article is primarily for Mac users. Though one can download the pure emacs (e.g., [pure emacs](http://emacsformacosx.com/)) or a managed emacs (e.g., [aquamacs](http://aquamacs.org)). I suggest to install Emacs using homebrew

```
brew install --cocoa --srgb emacs
brew linkapps emacs
```

It essentially installs pure emacs by downloading and compiling the emacs from [GNU](http://www.gnu.org/software/emacs/). Future update is made easy by using 

`brew update & brew upgrade`

> Homebrew is quite a nice tool to manage most packages on Mac. For more information, see [homebrew](http://brew.sh).


Vim users, please cool down :) I am not saying Emacs is any better than vim. Just for the task of latex editing, Emacs combined with auctex indeed provides great convenience, at least in my view. 

### Setting up Emacs for Latex Editing

Without setting up, Emacs can be used right after installation. But it does not look nice and function properly as you expect. To set up, we need create the `init.el` file and a few others in the hidden folder `.emacs.d` in the current user's hoemfolder. You can download my `.emacs.d` from [https://github.com/reijz/my-settings](https://github.com/reijz/my-settings). Here is what you need to do for setting up: 

1. Put the `.emacs.d` folder in your home folder
2. Put the `.latexmkrc` file in your home folder
3. Install [aspell](http://aspell.net) by excuting `brew install aspell --with-lang-en` in your terminal

I basically customerize and set up a few things

1. For the appearance, I changed the font face and enlarge the size. I also add line number on the left, and highligh the line where the cursor is. I make the cursor type box, and blinking with different colors. 
2. For latex, I set the compipler to be `pdflatex`, loaded [auctex](http://www.gnu.org/software/auctex/).
3. I make [latexmk](http://users.phys.psu.edu/~collins/software/latexmk-jcc/) available in compiling tools. Often in time, you need to compile the latex file multiple time to get the reference (to equations, section, bib items) right. With latexmk, you don't need to worry about it. 
4. I set up the spell checker to be [aspell](http://aspell.net). That is why you need to install aspell using homebrew in the above step 3. 
5. I also customerized a few key bindings, `⌘`+`→` to go to the end of the current line, and `⌘`+`←` to the begining. 

### Sync with pdf viewer

Emacs can also sync with pdf reader [skim](http://skim-app.sourceforge.net) on OS X. For syncing, please go to the preference of the skim app, choose the “sync”, and set “preset” to be “emacs” from the dropdown menu. 

Then `shift-cmd-click` on pdf in skim will take you to the corresponding location in the latex code, and same action on the latex code in emacs will take you to the corresponding location in the pdf file. The accuracy is up to the line in latex code.  

[http://mactex-wiki.tug.org/wiki/index.php/SyncTeX]
(http://mactex-wiki.tug.org/wiki/index.php/SyncTeX)

### Basics of Auctex

Latexing using emacs with [auctex](http://www.gnu.org/software/auctex/), is quite easy, see the [reference card](http://verse.ielm.ust.hk/files/tex-ref.pdf) for various shortcuts. Here is a brief list of command short cuts to get you started: 

1. Compile the latex file use `C-c C-c`. The short cut means `⌃`+`c` followed immediately with `⌃`+`c`.
2. To type any begin/end environment, you just need to type `C-c C-e`. 
3. Referencing an equation/section is easy. Use `C-c C-)` you will see the list of all equations/sections in the paper. 
4. To reference any article in your bib file, just use `C-c C-[` and type author's name or some words in the title, you will see the list of papers containing the words you type. 
5. Navigating through long article is also easy, just use `C-c C-=`. 
6. In math environment, to type a greek letter, just use ```+`a` for `\alpha`. See the reference card for a complete list. Most are intuitive, e.g., ```+`e` for `\epsilon` and ```+`b` for `\beta`.
7. You can insert `$`...`$` or `\(...\)` (in fact most paired parenthesis and brakets) by typing a single `$` or `\(`. In order to use this feature.
8. There are more advantages, see the reference card. You may also google if you need any features particularly for yourself.


### Advanced

1. **Error handling**

   Adding the following line 

   `file_line_error_style = t`

   to file `/usr/local/texlive/2014/texmf.cnf`

   After that, whenever you see error after compiling, just press `C-c` ```, you can see the detailed error message and the line where it occurs. 

   [https://groups.google.com/forum/#!topic/comp.text.tex/aY3xrX7F3eM]
   (https://groups.google.com/forum/#!topic/comp.text.tex/aY3xrX7F3eM)


2. **Latexmk**

   Latexmk is a perl script for running LaTeX the correct number of times to resolve cross references. In order this works with emacs, you need to set it up as I did in the `.emacs.d`. Moreover, put the following in your `.latexmkrc` (in the home folder of unix/linux user)

   ```
   $pdflatex = '/usr/texbin//pdflatex -interaction=nonstopmode -synctex=1    %O %S';
   $pdf_previewer = 'open -a skim';
   $clean_ext = 'bbl rel %R-blx.bib %R.synctex.gz';
   ```

   [http://users.phys.psu.edu/~collins/software/latexmk-jcc/]
   (http://users.phys.psu.edu/~collins/software/latexmk-jcc/)
