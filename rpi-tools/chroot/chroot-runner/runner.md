## chrootRunner
the file chrootRunner.sh is the main file, run it to run the chroot, make sure it cd's to a dir with the chroot-to-pi.sh script in it
the chroot-to-pi.sh is the regular chroot script

## vscode terminal
a terminal that auto opens chroot, add it to the settings.json of the termilals in vscode
```
        "chroot-pi": {
            "path": "/usr/bin/bash",
            "color": "terminal.ansiCyan",
            "icon": "circuit-board",
            "args": ["/home/fares/chrootRunner.sh"]
        }
```