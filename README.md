# ModusToolbox_URL_Modifier

ModusToolbox users may run into errors like “OpenSSL SSL_read: Software caused connection abort, errno 113” while running github.com-related git_clone/git_fetch in ModusToolbox. It means your connection to github.com is blocked for some reason.

In this case, you can turn to using some third-party repo_relaying servers, like *ghproxy.com*, to bypass the restrictions. Basically, you need to run the following GIT_config command to make it work in ModusToolbox:

`git config --system url."https://ghproxy.com/https://github.com".insteadOf https://github.com`

The tool is designed to help you with that. It automatically locates your ModusToolbox and adds the value, and then handles the conflicting settings.


## Guide

a) Download the latest release and unzip it wherever.

b) Run the file ***Install.cmd***.

c) Reboot ModusToolbox and done.

d) Use the file ***Uninstall.cmd*** to remove the tool from your system.

d) If a new version of ModusToolbox is installed, uninstall and then reinstall the tool again.


## Notes

a) *ghproxy.com* is a third-party service that can be unstable.

b) *ghproxy.com* is adopted in the tool but not part of the tool. Visit [ghproxy.com](https://ghproxy.com) for more info and support.

c) Support ModusToolbox 2.x and hopefully later.

d) The tool only helps you restore accessibility to the GitHub content of ModusToolbox. If you need to use any other content of ModusToolbox (when the variable CyRemoteManifestsOverride is touched by you), you have to uninstall it first or you might see more issues coming.

e) The tool is provided AS IS. There is NO WARRANTY.
