#!/bin/sh

# Bash Maven2 completion
#

_jenv_comp()
{
  typeset cur
  cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=( $( compgen -W "$1" -- "$cur" ) )
}

_jenv_commands()
{
   cmds="all ls candidates list update install uninstall pause execute exe use which cd version default add repo selfupdate help requirements"
   _jenv_comp "$cmds"
   return 0
}

_jenv_use()
{
   candidates="${JENV_CANDIDATES[@]}"
   _jenv_comp "$candidates"
   return 0
}

_jenv_update()
{
   candidates="${JENV_CANDIDATES[@]}"
   _jenv_comp "$candidates"
   return 0
}

_jenv_list()
{
   candidates="${JENV_CANDIDATES[@]}"
   _jenv_comp "$candidates"
   return 0
}

_jenv_default()
{
  candidates="${JENV_CANDIDATES[@]}"
  _jenv_comp "$candidates"
  return 0
}

_jenv_show()
{
  candidates="${JENV_CANDIDATES[@]}"
  _jenv_comp "$candidates"
  return 0
}

_jenv_which()
{
   candidates="${JENV_CANDIDATES[@]}"
   _jenv_comp "$candidates"
}

_jenv_install()
{
   candidates="${JENV_CANDIDATES[@]}"
   _jenv_comp "$candidates"
   return 0
}

_jenv_execute()
{
   candidates="${JENV_CANDIDATES[@]}"
   _jenv_comp "$candidates"
   return 0
}

_jenv_cd()
{
   candidates="${JENV_CANDIDATES[@]}"
   _jenv_comp "$candidates"
   return 0
}

_jenv_pause()
{
   candidates="${JENV_CANDIDATES[@]}"
   _jenv_comp "$candidates"
   return 0
}


_jenv_uninstall()
{
   candidates="${JENV_CANDIDATES[@]}"
   _jenv_comp "$candidates"
   return 0
}

_jenv_repo()
{
   _jenv_comp "add update"
   return 0
}

_jenv()
{
    typeset prev
    prev=${COMP_WORDS[COMP_CWORD-1]}

    case "${prev}" in
    use)       _jenv_use ;;
    pause)     _jenv_pause ;;
    update)    _jenv_update ;;
    list)      _jenv_list ;;
    ls)        _jenv_list ;;
    install)   _jenv_install ;;
    execute)   _jenv_execute ;;
    exe)       _jenv_execute ;;
    show)      _jenv_show ;;
    default)   _jenv_default ;;
    which)     _jenv_which ;;
    cd)        _jenv_cd ;;
    uninstall) _jenv_uninstall ;;
    add)       return 0 ;;
    repo)      _jenv_repo ;;
    *)        _jenv_commands ;;
    esac

    # completion for candidate version
    if [[ "$COMP_CWORD" == "3" ]]; then
        candidate="${prev}"
        if __jenvtool_array_contains JENV_CANDIDATES[@] "${candidate}"; then
           versions=($(__jenvtool_fetch_versions "${candidate}"))
           _jenv_comp "${versions}"
           unset candidate
        fi
    fi

     return 0
} &&

complete -F _jenv jenv