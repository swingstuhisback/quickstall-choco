> [!NOTE]
> This repository is currently being worked on due to migrating between a version which was less effective. See [quickstall](https://github.com/swingstuhisback/quickstall)

## Prerequisites

Make sure the following are installed:

- [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
- [Chocolatey](https://chocolatey.org/install)

(p.s, winget should be automatically installed alongside your Windows install; if it fails, please download the .msixbundle installer from the [winget-cli](https://github.com/microsoft/winget-cli/releases) repo.)

## Instructions

1. **Download project**

   Simply download the release on the right hand side, alternatively copy the PowerShell script.

2. **Change Programs**

   Once the you've downloaded it, open it in a text editor, preferably [VS Code](https://code.visualstudio.com).

   To search for programs on Chocolatey, go to the [Chocolatey Packages page](https://community.chocolatey.org/packages/).

   **Or, for winget**

   Run **Command Prompt** or **PowerShell** as **administrator** and type:

   ```
   winget search {application name, i.e firefox}
   ```

   Once you found your winget package, it should look something like
   ```
   "winget install --id=Ablaze.Floorp  -e".
   ```
   We only need what's after "--id=" (i.e Ablaze.Floorp).

   Once you've found your winget and chocolatey programs, type them into **programs.txt** and **programs-choco.txt** respectively on a new line.
   I've provided my personal program list, you can base your's off of that.

2. **Save**

   When you're done, save the text files and run the PowerShell script via
   ```
   powershell -c "./install-choco.ps1"
   ```

3. **???** (optional)

    ???

4. **Profit**

    Congratulations, your programs are installed. Enjoy.

## Credits

- [Snipcola](https://github.com/snipcola), for the readme template & huge help
- [Chocolatey Software](https://chocolatey.org/), for choco (obviously)
- [Microsoft](https://microsoft.com/), for winget alongside being so kind as to include Chocolatey in winget
- [Winstall team](https://winstall.app/), for the winstall site
- [Myself (the ego is crazy)](https://github.com/swingstuh/quickstall), for quickstall
