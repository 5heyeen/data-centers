#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/new-operator.sh <operator-name>
# Creates a new operator folder from the template.
# Example: ./scripts/new-operator.sh green-mountain

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
TEMPLATE_DIR="$REPO_ROOT/projects/operators/_template"

if [ $# -eq 0 ]; then
    echo "Usage: $0 <operator-name>"
    echo "  operator-name: lowercase, hyphenated (e.g., green-mountain)"
    exit 1
fi

OPERATOR_NAME="$1"
OPERATOR_DIR="$REPO_ROOT/projects/operators/$OPERATOR_NAME"

if [ -d "$OPERATOR_DIR" ]; then
    echo "Error: Operator folder already exists: $OPERATOR_DIR"
    exit 1
fi

echo "Creating operator: $OPERATOR_NAME"

# Create directory structure
mkdir -p "$OPERATOR_DIR/research"

# Copy and customize template files
sed "s/{OPERATOR_NAME}/$OPERATOR_NAME/g" "$TEMPLATE_DIR/operator.md" > "$OPERATOR_DIR/operator.md"
sed "s/{OPERATOR_NAME}/$OPERATOR_NAME/g" "$TEMPLATE_DIR/CLAUDE.md" > "$OPERATOR_DIR/CLAUDE.md"

echo ""
echo "Created: $OPERATOR_DIR/"
echo "  ├── CLAUDE.md"
echo "  ├── operator.md"
echo "  └── research/"
echo ""
echo "Next steps:"
echo "  1. Edit $OPERATOR_DIR/operator.md with known information"
echo "  2. cd $OPERATOR_DIR && claude"
echo "  3. Tell Claude: \"Run all phases\""
