# CompilerManager
A Bash script designed to manage C files in a directory

The script performs the following operations:

- Removes files with a `.out` extension.
- Compiles `.c` files that contain a specific keyword.
- Supports recursive operations on subdirectories.

## Usage

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/tomerp1812/CompilerManager.git
   cd CompilerManager
   ```
2. **Make the Script Executable:**
   ```bash
   chmod +x script.sh
   ```
3. **Run the Script with 2 or 3 parameters:**
   ```bash
   ./gccfind.sh <directory> <keyword>
   ./gccfind.sh <directory> <keyword> -r
   ```
   - directory: The path to the directory to start the operation.
   - keyword: The keyword to search for in .c files.
   - -r: Indicates that the operation should be recursive and apply to subdirectories as well. (optional)
