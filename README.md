
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


## Language Support Status

<table>
<tr>
    <td>Go</td><td>good</td><td><a href="./go/README.md">readme</a></td>
</tr>
<tr>
    <td>D</td><td>good</td><td><a href="./d/README.md">readme</a></td>
</tr>
<tr>
    <td>Emscripten</td><td>check needed</td><td></td>
</tr>

<tr>
    <td>llvm</td><td>maybe</td><td></td>
</tr>
<tr>
    <td>java</td><td>maybe</td><td></td>
</tr>

<tr>
    <td>Nim</td><td>stalled</td><td></td>
</tr>
<tr>
    <td>Rust</td><td>stalled (requires better llvm support. maybe langDeploy should provide own llvm, os I don't like this)</td><td></td>
</tr>

<tr>
    <td>Haxe</td><td>removed</td><td></td>
</tr>
<tr>
    <td>Tarra</td><td>removed</td><td></td>
</tr>
<tr>
    <td>Zig</td><td>removed</td><td></td>
</tr>
</table>
