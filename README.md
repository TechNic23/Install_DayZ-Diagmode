# DayZ Diagmode Installation Guide

## Installation:

### Via Steam:
1. Open the Steam client.
2. Go to your library.
3. Right-click on **DayZ** and select **Properties**.
4. Switch to the **Installed Files** tab.
5. Click on **Browse** – this will open the DayZ installation folder in your file manager.

### Default Path (Windows):
If you prefer to search for the folder manually, the default path is usually:
`C:\Program Files (x86)\Steam\steamapps\common\DayZ`

## Show Hidden Files and File Extensions:

To ensure you can see all files, including hidden ones and file extensions, follow these steps:

1. **Open Windows Explorer (File Manager)**:
   - Open Windows Explorer.

2. **Enable viewing hidden files**:
   - Click on the **View** tab at the top of the Explorer window.
   - Check the box for **Hidden items** to display hidden files and folders.

3. **Show file extensions**:
   - Under the same **View** tab, you'll find the option **File name extensions**. Check this box as well to see extensions like `.bat` or `.cfg`.

## Download Link:

[Download Install_DayZ-Diagmode](#)

## Copy Files from "Install_DayZ-Diagmode.rar" to the DayZ Directory:

1. Copy the files from the `Install_DayZ-Diagmode.rar` to the previously located DayZ installation folder.

## Enter Your DayZ Installation Folder in the Configuration File:

1. If you installed DayZ on a drive other than `C:\Program Files (x86)\Steam\steamapps\common\DayZ`, manually edit the `DayZ-Diagmode\Globals.cfg` file and input the correct DayZ installation folder.
   - Open the `Globals.cfg` file in a text editor (e.g., Notepad, VS Code).
   - Insert the full path at the line `game_dir=` (e.g., `C:\Program Files (x86)\Steam\steamapps\common\DayZ`).

## Start the Installation:

1. Run the `Install_DayZ-Diagmode.bat` file in the DayZ installation folder and follow the instructions to complete the installation.

## Create a Desktop Shortcut:

1. Navigate to the `\DayZ-Diagmode` directory created during installation.
2. Right-click on the directory and select **Send to > Desktop (Create Shortcut)**.
   - This will give you quick access to the directory directly from your desktop.

## Run `Start_Server_(C)herno_or_(E)noch.bat`:

1. Open the linked `DayZ-Diagmode` directory via the desktop shortcut.
2. Double-click the `Start_Server_(C)herno_or_(E)noch.bat` file in the opened directory.
   - This will run the file, activate diagnostic mode, and start the local server and game.
