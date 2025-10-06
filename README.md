# About

This project is to organize and simplify deployment of some popular
modern languages.

# Installation

**Note: designed and tested on Fedora.**

This directory **MUST** be placed as `$HOME/langDeploy` so file
`$HOME/langDeploy/set_env.sh` (which is in current dir) is available.

Place line `source "$HOME/langDeploy/set_env.sh"` into your home's
`.bash_profile` file.

NOTE: do not use .bashrc for $HOME/langDeploy/set_env.sh execution as
this will polute your PATH.

# Enabling languages

To enable some language, cd to corresponding dir and make symlink
'set_env.sh' to file 'set_env.sh_'. also, make sure 'set_env.sh' is
executable.

# Language Support Status

<table>
<tr>
    <td>Go</td><td>ok</td><td><a href="./go">navigate</a></td>
</tr>
<tr>
    <td>D</td>
    <td>
        <p>not ok</p>
        <div style="color: maroon;">
            2025-10-06: can't build v2.111.0 with 15.2.1 20250808 (Red Hat 15.2.1-1) gcc.

            waiting new tag-release. if continued like so - questions to be asked on forum.
        </div>
    </td>
    <td><a href="./d">navigate</a></td>
</tr>
<tr>
    <td>Emscripten</td><td>stalled</td><td></td>
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
    <td>Rust</td>
    <td>
        <p>bad idea. not going to happen in foreseed future.</p>
        <p>it's infrastructure is garbage, so I don't want to mess with it.</p>
        <p>not mentioning I don't like it as a language.</p>
    </td>
    <td></td>
</tr>

<tr>
    <td>Haxe</td><td>removed</td><td></td>
</tr>
<tr>
    <td>Tarra</td><td>removed, but maybe latter</td><td></td>
</tr>
<tr>
    <td>Zig</td><td>removed, but maybe latter</td><td></td>
</tr>
</table>
