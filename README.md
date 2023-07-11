
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

<style>
.good {
 background-color: lime;
}
.deletion{
 color: white;
 background-color: red;
}
.poor{
 color: black;
 background-color: yellow;
}
</style>

<table>
<tr>
    <td>Go</td><td class="good">good</td>
</tr>
<tr>
    <td>D</td><td class="good">was ok last time I checked. but stalled</td>
</tr>
<tr>
    <td>Emscripten</td><td class="good">was ok last time I checked. but stalled</td>
</tr>
<tr>

    <td>Haxe</td><td class="poor">stalled</td>
</tr>
<tr>
    <td>Nim</td><td class="poor">stalled</td>
</tr>
<tr>
    <td>Rust</td><td class="poor">stalled, poorly checked</td>
</tr>
<tr>
    <td>Tarra</td><td class="poor">stalled</td>
</tr>
<tr>
    <td>Zig</td><td class="deletion">going to be removed</td>
</tr>
</table>
