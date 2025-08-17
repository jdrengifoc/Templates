#!/bin/bash

# Check if project path is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <PROJECT_PATH>"
    exit 1
fi

PROJECT_PATH="$1"
PROJECT_DIR=$(dirname "$PROJECT_PATH")
PROJECT_NAME=$(basename "$PROJECT_PATH")

echo "Creating project '$PROJECT_NAME' at '$PROJECT_DIR'..."

# Create project directory
mkdir -p "$PROJECT_PATH"
cd "$PROJECT_PATH" || exit

# Initialize Poetry project (use safe name without slashes)
poetry init --name "$PROJECT_NAME" \
  --dependency requests \
  --dependency python-dotenv \
  --dev-dependency pytest \
  --dev-dependency black \
  --no-interaction

# Create directory structure
mkdir -p config data src/{api,models/template,utils} tests notebooks

# Add __init__.py files for clean imports
touch src/__init__.py
touch src/utils/__init__.py
touch src/models/__init__.py
touch src/models/template/__init__.py
touch src/api/__init__.py
touch config/__init__.py
touch data/__init__.py

# README.md
cat <<EOL > README.md
# $PROJECT_NAME

This project contains an algorithmic trading system template with modular design, secure secrets management, and a basic structure for development.
EOL

# .gitignore
cat <<EOL > .gitignore
# Python
__pycache__/
*.pyc
*.pyo
*.pyd

# Environments
.env
.venv

# Jupyter
.ipynb_checkpoints

# Logs
*.log
EOL

# .env.template
cat <<EOL > .env.template
# Copy this file to .env and fill in your API credentials
API_KEY=your_api_key_here
API_SECRET=your_api_secret_here
API_BASE_URL=https://api.yourbroker.com
EOL

# config/settings.py
cat <<EOL > config/settings.py
from dotenv import load_dotenv
import os

load_dotenv()

API_KEY = os.getenv("API_KEY")
API_SECRET = os.getenv("API_SECRET")
API_BASE_URL = os.getenv("API_BASE_URL")

if not all([API_KEY, API_SECRET, API_BASE_URL]):
    raise ValueError("API_KEY, API_SECRET, and API_BASE_URL must be set in .env")
EOL

# src/utils/logger.py (empty)
touch src/utils/logger.py

# src/main.py
cat <<EOL > src/main.py
def main():
    print("Hello, $PROJECT_NAME!")

if __name__ == "__main__":
    main()
EOL

# src/models/template/strategy.py
cat <<EOL > src/models/template/strategy.py
class Strategy:
    \"""
    Template for a trading strategy.
    Copy this file and modify it for your own strategies.
    \"""
    def decide(self, market_data):
        \"""
        Implement your decision logic here.
        Return a dictionary with at least {'action': 'buy'/'sell', ...}
        \"""
        raise NotImplementedError
EOL

# src/models/template/feedback.py
cat <<EOL > src/models/template/feedback.py
class Feedback:
    \"""
    Template for feedback mechanism to adjust strategies.
    Copy this file and modify for your feedback logic.
    \"""
    def record_trade(self, trade_result):
        \"""
        Record trade outcome and update internal state if needed.
        \"""
        raise NotImplementedError

    def adjust_strategy(self, strategy):
        \"""
        Adjust strategy parameters based on past performance.
        \"""
        raise NotImplementedError
EOL

# Create empty Python files for structure
touch src/api/{connection.py,operations.py}
touch src/utils/helpers.py
touch tests/{test_api.py,test_strategy.py,test_utils.py}
touch notebooks/.gitkeep

echo "Poetry project '$PROJECT_NAME' created successfully at '$PROJECT_PATH'!"
echo "Remember to run: poetry install --no-root"
echo "Then run your scripts with: poetry run python -m src.main"
