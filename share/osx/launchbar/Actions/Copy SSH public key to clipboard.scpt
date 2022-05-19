#!/usr/bin/env osascript

set ssh_key to "~/.ssh/id_rsa.pub"
try
	do shell script "pbcopy <" & ssh_key
end try
open location "x-launchbar:hide"
