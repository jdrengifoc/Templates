# Algorithmic Trading Project Template

This folder contains a reusable template for creating algorithmic trading projects in Python.\
It uses **Poetry**, `.env` for secrets, and a clean modular structure.

---

## **Folder Structure**

```
src/
    api/                # Broker API connection and operations
    models/
        template/       # Starter files for new models (strategy.py, feedback.py)
    utils/              # Helpers and logging (logger.py is empty by default)
config/                  # Settings and secrets management
data/                    # Optional data storage
tests/                   # Unit tests
notebooks/               # Jupyter notebooks for experiments
.env.template            # Template for API credentials
pyproject.toml           # Poetry configuration
.gitignore
README.md
create_algo_trading.sh   # Bash script to generate new projects
```

---

## **How to Use the Template**

### 1. Navigate to the template folder

```bash
cd ~/templates/algo_trading_template
```

### 2. Run the generator

Create a new project **in the current folder** by providing the project path:

```bash
./create_algo_trading.sh path/my_new_project
```

- This will create a folder called `path/my_new_project/` **inside the **``** directory**.

---

### 3. Install dependencies

```bash
cd path/my_new_project         # Enter your new project folder
poetry install                # Create virtual environment & install dependencies
```

---

### 4. Run via Poetry

Run python scripts via poetry.

```bash
poetry run python src/main.py
```

---

### 5. Configure secrets

Copy the `.env.template` to `.env` and fill in your API credentials:

```bash
cp .env.template .env
nano .env
```

---

### 6. Version control (optional)

Initialize a Git repository in the new project:

```bash
git init -b main
git add .
git commit -m "Initial commit from template"
git remote add origin https://github.com/yourusername/my_new_project.git
git push -u origin main
```

---

### **Notes**

- `models/template/` contains starter files for `strategy.py` and `feedback.py`. Copy these when creating new models.
- `logger.py` is empty by default; you can implement your logging later.
- Keep the template folder **separate** so it can be reused for multiple projects.

