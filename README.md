
This project is to organize and simplify deployment of some popular
modern languages.

this directory MUST be placed as $HOME/langDeploy so file
$HOME/langDeploy/set_env.sh (which is in current dir) is available.

place line `source "$HOME/langDeploy/set_env.sh"` into your home's
.bash_profile

NOTE: do not use .bashrc for $HOME/langDeploy/set_env.sh execution as
this will polute your PATH.

To enable some language, cd to corresponding dir and make symlink
'set_env.sh' to file 'set_env.sh_'. also, make sure 'set_env.sh' is
executable.
