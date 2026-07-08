# `ad` - Quick Directory Jumper for VS Code

A PowerShell function that quickly opens a project folder in VS Code and pulls the latest changes from Git, all with a single command.

## ✨ Features

- 🔍 **Fuzzy match** folder names — type a partial name and it finds the best match.
- 🚀 **Opens VS Code** directly to the project folder.
- 🔄 **Auto Git pull** — if the folder is a Git repository, it pulls the latest changes automatically.
- 📂 **Multiple base paths** — searches across configured base directories.
- ⚡ **Lightweight** — just a single PowerShell function, no external dependencies.

## 📋 Requirements

- **PowerShell 5.1+** (or PowerShell Core 7+)
- **Git** installed and available in your `PATH`
- **Visual Studio Code** installed and accessible via the `code` command

## ⚙️ Installation

1. **Clone or download** this repository.
2. Open your PowerShell profile file: 
   ```powershell
   notepad $PROFILE 
   ```
3. **Paste the function** at the end of the file and save.
4. **Reload your profile**:
   ```powershell
   . $PROFILE
   ```

### Configure your base paths

Edit the `$basePaths` variable inside the function to point to your project directories:

```powershell
$basePaths = "C:\Projects", "D:\Work\Repos"
```

## 🚀 Usage

```powershell
ad <folder-name>
```

### Examples

```powershell
ad my-project        # Opens the exact match
ad my                # Fuzzy matches "my-project", "my-app", etc.
ad api               # Matches "api-server", "api-client", etc.
```

If no match is found, the function lists all available folders:

```
Folder 'unknown' not found.
Options: my-project, api-server, web-app, docs
```

## 🧠 How It Works

1. Scans all configured `$basePaths` for directories.
2. Filters folders by **exact match** or **prefix match** against the prompt.
3. Picks the **first match** and:
   - Opens the folder in VS Code.
   - Runs `git pull` (if `.git` exists).
4. If no match is found, prints available folder names.

## 📸 Example Output

```powershell
PS> ad my-api
# VS Code opens at C:\Projects\my-api
# Already up to date.  (or git pull output)
```

## 🤝 Contributing

Contributions are welcome! Feel free to:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/my-feature`).
3. Commit your changes (`git commit -m "Add my feature"`).
4. Push to the branch (`git push origin feature/my-feature`).
5. Open a Pull Request.

## 💡 Tips

- Add **more base paths** to search across multiple drives or locations.
- Combine with [Terminal-Icons](https://github.com/devblackops/Terminal-Icons) for prettier folder listings.
- Modify `Open-And-Pull` to run additional commands (e.g., `npm install`, `dotnet restore`).

---

Made with ❤️ for faster dev workflows.
