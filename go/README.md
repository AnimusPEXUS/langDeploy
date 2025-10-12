
<a href="..">langDeploy</a> must be properly deployed in your linux profile before starting following scripts

## utils

* `gomod111` - prefix to disable module system usage
* `soxy` - prefix to run over Tor
* `set_env.sh` - create this symlink to `set_env.sh_` to enable it in langDeploy
* `set_env.sh_` - properly sets up golang environment

note: before continuing, after you created `set_env.sh` symlinc, open new terminal, which will use updated environment

## clone and build

* `./go-update.sh` - download golang source
* `./go-build.sh` - build golang

note: after `go-build.sh` successful run, make `active` symlink to newly built golang directory

## download and run local golang documentation services

NOTE: documentation services sometimes modified by their creators, so
those sometimes going out of order. sometimes scrips, provided here, should be fixed accordingly.

### doc-api

* `./doc-api` - start golang basic api site
* `./doc-api-update` - install/update
* `./doc-aip-update-with-soxy` - install/update using Tor proxy

### doc-pkgsite

* `./doc-pkgapi` - same, but for installed third party packages in current system.
* `./doc-pkgapi-with-soxy` - sometimes pkgsite refuses to work without proxy.
* `./doc-pkgapi-update`
* `./doc-pkgapi-update-with-soxy`

### doc-site

* `./doc-site` - golang site with language documentation, mauals and howtos. (http://localhost:6061/go.dev/ref/spec, http://localhost:6061/go.dev/doc)
* `./doc-site-with-soxy`
* `./doc-site-update-with-soxy`
