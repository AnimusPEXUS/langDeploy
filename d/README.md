Use deployD.d to download, build and setup latest dmd.

If You don't have already dmd, you can compile deployD.d to
excutable using LLVM's or GCC's D compiler and run resulting deployD
in this dir instead of directly deployD.d.

deployD.d should be started with git tag of dmd to build.

after deployD.d done - make 'active' symlink to point
to newly built d_* and make symlink set_env.sh pointing to set_env.sh_ file.