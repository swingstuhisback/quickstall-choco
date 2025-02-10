## Prerequisites

Make sure the following are installed:

- [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
- [Chocolatey](https://chocolatey.org/install)

(p.s, winget should be automatically installed alongside your Windows install; if it fails, I don't really know...)

## Instructions

1. **Download project**

   Simply download the release on the right hand side, alternatively copy the PowerShell script.

2. **Change Programs**

   Once the you've downloaded it, open it in a text editor, preferably [VS Code](https://code.visualstudio.com).

   To search for programs on Chocolatey, go to the [Chocolatey Packages page](https://community.chocolatey.org/packages/).

   If you're too lazy to use the CLI version of winget to search for packages, go to [winstall.app](https://winstall.app/apps).

   Once you found your winget package, it should look something like
   ```
   "winget install --id=Ablaze.Floorp  -e".
   ```
   We only need what's after "--id=" (i.e Ablaze.Floorp).

   **Or, for winget**

   Run **Command Prompt** or **PowerShell** as **administrator** and type:

   ```
   winget search {application name, i.e firefox}
   ```
   
   Once you've found your winget and chocolatey programs, type them into **programs.txt** and **programs-choco.txt** respectively on a new line.
   I've provided my personal program list, you can base your's off of that.

3. **Save**

   When you're done, save the text file and run the PowerShell script.

4. **???** (optional)

    ???

5. **Profit**

    Congratulations, your programs are installed. Enjoy.

## Credits

- [Snipcola](https://github.com/snipcola), for the readme template
- [Chocolatey Software](https://chocolatey.org/), for choco (obviously)
- [Microsoft](https://microsoft.com/), for winget alongside being so kind as to include Chocolatey in winget
- [Winstall team](https://winstall.app/), for the winstall site
- [Myself (the ego is crazy)](https://github.com/swingstuh/quickstall), for quickstall
