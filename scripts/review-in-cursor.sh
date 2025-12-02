#!/bin/bash
# Code Review Script for Cursor
# Prepares code changes and opens them in Cursor for AI review

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔍 Preparing code review for Cursor...${NC}"

# Determine if reviewing staged or unstaged changes
REVIEW_TYPE="${1:-staged}"

if [ "$REVIEW_TYPE" == "staged" ]; then
    CHANGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '\.dart$' || true)
    DIFF_CONTENT=$(git diff --cached $CHANGED_FILES 2>/dev/null || echo "")
    STATUS="staged"
    echo -e "${YELLOW}Reviewing staged changes...${NC}"
elif [ "$REVIEW_TYPE" == "unstaged" ]; then
    CHANGED_FILES=$(git diff --name-only --diff-filter=ACM | grep '\.dart$' || true)
    DIFF_CONTENT=$(git diff $CHANGED_FILES 2>/dev/null || echo "")
    STATUS="unstaged"
    echo -e "${YELLOW}Reviewing unstaged changes...${NC}"
else
    echo -e "${RED}Usage: $0 [staged|unstaged]${NC}"
    echo "  staged    - Review staged changes (default)"
    echo "  unstaged  - Review unstaged changes"
    exit 1
fi

if [ -z "$CHANGED_FILES" ]; then
    echo -e "${YELLOW}⚠ No Dart files to review${NC}"
    exit 0
fi

# Create .cursor directory if it doesn't exist
mkdir -p .cursor

# Create review file
REVIEW_FILE=".cursor/review_context.md"

# Count files
FILE_COUNT=$(echo "$CHANGED_FILES" | wc -l | tr -d ' ')

cat > "$REVIEW_FILE" << EOF
# Code Review Request - $STATUS changes

**Files Changed:** $FILE_COUNT file(s)

## Changed Files
$(echo "$CHANGED_FILES" | sed 's/^/- `/; s/$/`/')

## Code Diff
\`\`\`diff
$DIFF_CONTENT
\`\`\`

---

## Review Prompt for Cursor

Copy the text below and paste it into Cursor Composer (Cmd+I) or Chat:

---

Review the code changes above against our project's Cursor rules. The project follows Clean Architecture with BLoC state management.

**Review Checklist:**
1. ✅ **Clean Architecture** - Check layer separation (data/domain/presentation)
2. ✅ **BLoC Patterns** - Verify proper state management implementation
3. ✅ **DTO Structure** - Ensure DTOs follow project patterns
4. ✅ **Project Structure** - Confirm files are in correct directories
5. ✅ **UI Components** - Use common UI components from design system
6. ✅ **API Patterns** - Follow BaseResponse/BaseListResponse patterns
7. ✅ **Code Quality** - Check for best practices and conventions

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
- ❌ **Critical** - Blocking issues that must be fixed

---

EOF

echo -e "${GREEN}✓ Review context created: $REVIEW_FILE${NC}"
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}📋 Next Steps:${NC}"
echo ""
echo -e "   1. ${GREEN}Open Cursor Composer${NC} (Cmd+I) or Chat"
echo -e "   2. ${GREEN}Open the review file:${NC} $REVIEW_FILE"
echo -e "   3. ${GREEN}Copy the review prompt${NC} from the file"
echo -e "   4. ${GREEN}Paste into Cursor${NC} and review your code"
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Try to open in Cursor, fallback to default editor
if command -v cursor &> /dev/null; then
    echo -e "${BLUE}Opening in Cursor...${NC}"
    cursor "$REVIEW_FILE" &
elif command -v code &> /dev/null; then
    echo -e "${BLUE}Opening in VS Code...${NC}"
    code "$REVIEW_FILE" &
else
    echo -e "${YELLOW}Opening with default editor...${NC}"
    open "$REVIEW_FILE" 2>/dev/null || xdg-open "$REVIEW_FILE" 2>/dev/null || echo "Please open $REVIEW_FILE manually"
fi

echo ""
echo -e "${GREEN}Ready for review!${NC}"

