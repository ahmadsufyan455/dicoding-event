#!/bin/bash
# Quick Code Review Generator for Cursor
# Generates a review prompt and copies it to clipboard

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔍 Generating code review prompt...${NC}"

# Determine if reviewing staged or unstaged changes
REVIEW_TYPE="${1:-staged}"

if [ "$REVIEW_TYPE" == "staged" ]; then
    CHANGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '\.dart$' || true)
    DIFF_CONTENT=$(git diff --cached $CHANGED_FILES 2>/dev/null || echo "")
    STATUS="staged"
elif [ "$REVIEW_TYPE" == "unstaged" ]; then
    CHANGED_FILES=$(git diff --name-only --diff-filter=ACM | grep '\.dart$' || true)
    DIFF_CONTENT=$(git diff $CHANGED_FILES 2>/dev/null || echo "")
    STATUS="unstaged"
else
    echo -e "${YELLOW}Usage: $0 [staged|unstaged]${NC}"
    echo "  staged    - Review staged changes (default)"
    echo "  unstaged  - Review unstaged changes"
    exit 1
fi

if [ -z "$CHANGED_FILES" ]; then
    echo -e "${YELLOW}⚠ No Dart files to review${NC}"
    exit 0
fi

# Count files
FILE_COUNT=$(echo "$CHANGED_FILES" | wc -l | tr -d ' ')

# Generate review prompt
REVIEW_PROMPT="Review these code changes ($STATUS) against our project's Cursor rules. The project follows Clean Architecture with BLoC state management.

**Changed Files ($FILE_COUNT):**
$(echo "$CHANGED_FILES" | sed 's/^/- `/; s/$/`/')

**Code Diff:**
\`\`\`diff
$DIFF_CONTENT
\`\`\`

**Review Checklist:**
1. ✅ Clean Architecture - Check layer separation (data/domain/presentation)
2. ✅ BLoC Patterns - Verify proper state management implementation
3. ✅ DTO Structure - Ensure DTOs follow project patterns
4. ✅ Project Structure - Confirm files are in correct directories
5. ✅ UI Components - Use common UI components from design system
6. ✅ API Patterns - Follow BaseResponse/BaseListResponse patterns
7. ✅ Code Quality - Check for best practices and conventions

**Reference Rules:**
- \`.cursor/rules/01-project-structure.mdc\` - Project structure
- \`.cursor/rules/02-clean-architecture.mdc\` - Architecture patterns
- \`.cursor/rules/03-dto-patterns.mdc\` - DTO patterns
- \`.cursor/rules/04-bloc-patterns.mdc\` - BLoC patterns
- \`.cursor/rules/06-ui-components.mdc\` - UI components
- \`.cursor/rules/08-api-patterns.mdc\` - API patterns

**Provide structured feedback with:**
- ✅ **Good** - What's working well
- ⚠️ **Warnings** - Non-blocking issues or suggestions
- ❌ **Critical** - Blocking issues that must be fixed"

# Copy to clipboard based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    echo "$REVIEW_PROMPT" | pbcopy
    echo -e "${GREEN}✓ Review prompt copied to clipboard!${NC}"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    if command -v xclip &> /dev/null; then
        echo "$REVIEW_PROMPT" | xclip -selection clipboard
        echo -e "${GREEN}✓ Review prompt copied to clipboard!${NC}"
    elif command -v xsel &> /dev/null; then
        echo "$REVIEW_PROMPT" | xsel --clipboard --input
        echo -e "${GREEN}✓ Review prompt copied to clipboard!${NC}"
    else
        echo -e "${YELLOW}⚠ Clipboard not available. Install xclip or xsel.${NC}"
        echo "$REVIEW_PROMPT"
        exit 0
    fi
else
    # Windows or other
    echo -e "${YELLOW}⚠ Clipboard not supported on this OS. Here's the prompt:${NC}"
    echo ""
    echo "$REVIEW_PROMPT"
    exit 0
fi

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}📋 Next Steps:${NC}"
echo ""
echo -e "   1. ${GREEN}Open Cursor Composer${NC} (Cmd+I) or Chat"
echo -e "   2. ${GREEN}Paste${NC} (Cmd+V) the review prompt"
echo -e "   3. ${GREEN}Review your code${NC} with Cursor AI"
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

