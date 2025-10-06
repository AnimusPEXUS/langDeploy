
## clone and build

<table>
<tr>
<td>
update.sh
</td>
<td>
clone to or update local  go source repo
</td>
</tr>
<tr>
<td>
build.sh
</td>
<td>
build certain tag. requires tag as parameter
</td>
</tr>
</table>

## local documentation servers

NOTE: documentation services frequently modified by their creators, so
those often go out of order. sometimes scrips, provided here, should be fixed accordingly.

commands suffixed with `gomod111` - trying to force GO 1.11 module system usage.

commands suffixed with `soxy` - trying to force socks proxy usage
(for those, who might be behind bogus firewall or who blockd by google and getting 403 http errors and friends)

<table>
    <tr>
        <td>
            documentation
        </td>
        <td>
            tries to run godoc (local go documentation server)
        </td>
    </tr>

    <tr>
        <td>
            documentation-update
        </td>
        <td>
            tries to download new godoc tool
        </td>
    </tr>

    <tr>
        <td>
            gomod111
        </td>
        <td>
            forces use of GO111MODULE=auto env
        </td>
    </tr>

    <tr>
        <td>
            soxy
        </td>
        <td>
            forces use of socks proxy (tor 9050 port) for go get and friends
        </td>
    </tr>

    <tr>
        <td>
            pkgsite-start
        </td>
        <td>
            tries to start package documentation site
        </td>
    </tr>

    <tr>
        <td>
            pkgsite-update
        </td>
        <td>
            tries to update package documentation site
        </td>
    </tr>

    <tr>
        <td>
            site
        </td>
        <td>
            tries to run go language documentation site
        </td>
    </tr>

    <tr>
        <td>
            site-update
        </td>
        <td>
            tries to update go language documentation site
        </td>
    </tr>
</table>
