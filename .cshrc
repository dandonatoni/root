# $FreeBSD: releng/11.0/etc/root/dot.cshrc 278616 2015-02-12 05:35:00Z cperciva $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available  /usr/share/examples/csh/


alias h		history 25
alias j		jobs -l
alias la	ls -aF
alias lf	ls -FA
alias ll	ls -lAal
alias lll       ls -AF

# A righteous umask
if ("id -un" == "id -gn") then
    umask 002
else
    umask 022
endif

set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin $HOME/bin)

setenv	EDITOR	vi
setenv	PAGER	more
setenv	BLOCKSIZE	K

#if ( -r ~/local/csh.pre ) then
#    source ~/local/csh.pre
#endif

set M = "uname -m"
#set P = "uname -p"
set S = "uname -s"
set R = "uname -r"
#if ("$M" == "$P") then
#    set P = ""
#endif
set sysname="echo $M-$S-$R" # | tr "[:upper:]" "[:lower:]""
#unset R S P M

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set prompt = "%N@%m:%~ %# "
	set promptchars = "%#"

	set filec
	set history = 1000
	set savehist = (1000 merge)
	set autolist = ambiguous
        set autocorrect = ambiguous
        set complete = enhance
        set correct = cmd
	
	# Use history to aid expansion
	set autoexpand
	set autorehash
	set mail = (/var/mail/$USER)
#        setenv LSCOLORS ExGxFxdxCxegedabaExEx
#        setenv LSCOLORS ExGxcxdxCxegedCxCxExEx
        setenv LSCOLORS exfxcxdxbxegedabagacacad; # default
#        setenv LSCOLORS ExGxFxdxCxDxDxhbadExEx; # most linux distros
        setenv CLICOLOR yes
	     if ( $?tcsh ) then
		      bindkey "^W" backward-delete-word
		      bindkey -k up history-search-backward
		      bindkey -k down history-search-forward
                   if ($uid) then
#                        set prompt =  "\n%n@%B%m%b$osbuildno\n%B%~%b%# "
                        set prompt = "%{\033[32m%}%B<%n@%{\033[33m%}%m%{\033[33m%}>%b%{\033[0m%}%/ # "
              else
#                        set prompt =  "\n%n@%B%m%b$osbuildno\n%B%~%b%# "
                        set prompt = "%{\033[31m%}%B<root@%{\033[33m%}%m%{\033[33m%}>%b%{\033[0m%}%/ # "
                   endif
	     endif

endif
