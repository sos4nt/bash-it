SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""

SCM_THEME_PROMPT_DIRTY=' ${bold_red}✗${normal}'
SCM_THEME_PROMPT_CLEAN=' ${bold_green}✓${normal}'
SCM_GIT_CHAR='${bold_green}±${normal}'
SCM_SVN_CHAR='${bold_cyan}⑆${normal}'
SCM_HG_CHAR='${bold_red}☿${normal}'

stan_rvm_version_prompt() {
  if which rvm &> /dev/null; then
    rvm=$(rvm tools identifier) || return
    echo -e "$rvm "
  fi
}

stan_scm_prompt() {
  CHAR=$(scm_char)
  if [ $CHAR = $SCM_NONE_CHAR ]
  then
    return
  else
    echo "\[${bold_cyan}\]$(scm_char) \[${green}\]$(scm_prompt_info) "
  fi
}

prompt() {
  PS1="\[${yellow}\]$(stan_rvm_version_prompt)$(stan_scm_prompt)\[${normal}\]in \[${cyan}\]\w
\[${black}\]\!\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`▸ \[${normal}\]"
}

PS2="↳ "
PS3=">> "

PROMPT_COMMAND=prompt
