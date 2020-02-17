# Résumé
LaTeX source for my résumé.

# Dependencies
At a minimum, LaTeX is required in order to compile. See [my list of LaTeX packages](packages.tex) for all of the individual LaTeX packages in use.

## Optional Dependencies
My personal workflow also requires [BlackBox](https://github.com/StackExchange/blackbox "BlackBox on GitHub") to encrypt/decrypt my secrets (plaintext `.tex` files with personal information in them).

## How To Use
If you'd like to use this as a template for your own résumé, run the following from a terminal:

```shell
git clone https://github.com/cawaltrip/resume
pushd resume
echo "" > address.tex
echo "" > banner.tex
```
You're now free to compile `resume.tex`.  Optionally, you probably want to remove the `.blackbox` folder, and `*.tex.gpg` files.  These are encrypted files that contain personal information.  Where possible the `.gpg` files only contain plaintext and any formatting is done in [resume.tex](resume.tex).

## License
This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License]("http://creativecommons.org/licenses/by-sa/4.0/"). See [the license file](LICENSE.md) for the full text of this license.