Logon Edited Files 

This project will show a popup when you log into a windows machine. The popup will list the files that were created in the [username]/Documents folder since the day of the last login. This could be useful in cyber security in case an unexpected file shows up there. It could be useful to remind one of the work they have been doing as well. 

Here are the steps to set this up. 

    Download the showFiles.bat file to the computer and store it in a location where you will not accidentally delete it (probably don’t save it in the downloads folder). 

    Open the shell:startup folder. 

    Open the windows search. 

    Type ‘run’, then enter. 

    Type ‘shell:startup’ then enter. 

    File explorer will open up with the location of the shell:startup folder. 

    Create a shortcute for the showFiles. 

    Right click on the file and select ‘Create Shortcut’ 

    The shortcut will create in the same directory. 

    Drag the shortcut to the shell:startup folder. 

    On login, a popup should show with a list of files that were created during the day of the last login. 

To test this, log in to the computer and a popup should show up with the list of files created recently. 

The script can be tested without logging in simply by double clicking the script. 

Note that this script uses powershell commands for various of its functionalities. By default, a .bat file will run in the traditional command prompt, which is more limited.

