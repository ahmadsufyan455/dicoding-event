#!/bin/bash
# Automatic Code Review using AI API with Cursor Rules
# Supports: DeepSeek, OpenAI, Anthropic Claude, and GLM (Zhipu AI)

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

PROJECT_ROOT="$(git rev-parse --show-toplevel)"
cd "$PROJECT_ROOT"

# Get changed files from commits to push
REMOTE="${1:-origin}"
BRANCH="${2:-$(git rev-parse --abbrev-ref HEAD)}"

LOCAL_COMMIT=$(git rev-parse HEAD)
REMOTE_COMMIT=$(git rev-parse "$REMOTE/$BRANCH" 2>/dev/null || echo "")

if [ -z "$REMOTE_COMMIT" ]; then
    CHANGED_FILES=$(git diff --name-only --diff-filter=ACM HEAD~1 HEAD 2>/dev/null | grep '\.dart$' || true)
    DIFF_CONTENT=$(git diff HEAD~1 HEAD $CHANGED_FILES 2>/dev/null || echo "")
else
    CHANGED_FILES=$(git diff --name-only --diff-filter=ACM "$REMOTE_COMMIT"..HEAD 2>/dev/null | grep '\.dart$' || true)
    DIFF_CONTENT=$(git diff "$REMOTE_COMMIT"..HEAD $CHANGED_FILES 2>/dev/null || echo "")
fi

if [ -z "$CHANGED_FILES" ]; then
    echo -e "${GREEN}✓ No Dart files to review${NC}"
    exit 0
fi

FILE_COUNT=$(echo "$CHANGED_FILES" | wc -l | tr -d ' ')

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}🤖 Automatic Code Review${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}Reviewing $FILE_COUNT file(s)...${NC}"
echo ""

# Load Cursor rules
RULES_DIR=".cursor/rules"
RULES_CONTENT=""

if [ -d "$RULES_DIR" ]; then
    for rule_file in "$RULES_DIR"/*.mdc; do
        if [ -f "$rule_file" ]; then
            RULES_CONTENT+="\n\n=== $(basename "$rule_file") ===\n"
            RULES_CONTENT+="$(cat "$rule_file")"
        fi
    done
fi

# Prepare review prompt
REVIEW_PROMPT="You are reviewing Flutter/Dart code changes for a project following Clean Architecture with BLoC state management.

PROJECT RULES AND PATTERNS:
$RULES_CONTENT

CHANGED FILES ($FILE_COUNT):
$(echo "$CHANGED_FILES" | sed 's/^/- /')

CODE DIFF:
\`\`\`diff
$DIFF_CONTENT
\`\`\`

Please review the code changes above against the project rules. Check for:

1. Clean Architecture layer violations (data/domain/presentation separation)
2. BLoC pattern compliance (proper state management)
3. DTO structure patterns (immutable, proper defaults, copyWith)
4. Project structure conventions (correct directory placement)
5. UI component usage (using common design system components)
6. API integration patterns (BaseResponse/BaseListResponse)
7. Code quality and best practices

Provide structured feedback in this exact format:

## Review Results

### ✅ Good
[List what's working well]

### ⚠️ Warnings
[Non-blocking issues or suggestions]

### ❌ Critical Issues
[Blocking issues that must be fixed - if none, say 'None']

If there are critical issues, the push will be blocked."

# Determine which API to use (priority: DeepSeek > GLM > OpenAI > Anthropic)
REVIEW_RESPONSE=""

if [ -n "$DEEPSEEK_API_KEY" ]; then
    echo -e "${BLUE}Using DeepSeek API...${NC}"
    
    # DeepSeek API endpoint (OpenAI-compatible)
    DEEPSEEK_API_BASE="${DEEPSEEK_API_BASE_URL:-https://api.deepseek.com}"
    
    # Create temporary JSON file to avoid shell escaping issues
    TEMP_JSON=$(mktemp)
    cat > "$TEMP_JSON" << EOF
{
  "model": "${DEEPSEEK_MODEL:-deepseek-chat}",
  "messages": [
    {
      "role": "system",
      "content": "You are a senior Flutter/Dart code reviewer specializing in Clean Architecture and BLoC patterns."
    },
    {
      "role": "user",
      "content": $(echo "$REVIEW_PROMPT" | jq -Rs .)
    }
  ],
  "temperature": 0.3,
  "max_tokens": 2000
}
EOF
    
    # Call DeepSeek API
    REVIEW_RESPONSE=$(curl -s "$DEEPSEEK_API_BASE/v1/chat/completions" \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DEEPSEEK_API_KEY" \
      -d "@$TEMP_JSON" 2>/dev/null | jq -r '.choices[0].message.content' 2>/dev/null || echo "")
    
    # Clean up temp file
    rm -f "$TEMP_JSON" 2>/dev/null || true
    
elif [ -n "$GLM_API_KEY" ]; then
    echo -e "${BLUE}Using GLM API (Zhipu AI)...${NC}"
    
    GLM_API_BASE="${GLM_API_BASE_URL:-https://open.bigmodel.cn/api/paas/v4}"
    
    # Create temporary JSON file to avoid shell escaping issues
    TEMP_JSON=$(mktemp)
    cat > "$TEMP_JSON" << EOF
{
  "model": "${GLM_MODEL:-glm-4}",
  "messages": [
    {
      "role": "system",
      "content": "You are a senior Flutter/Dart code reviewer specializing in Clean Architecture and BLoC patterns."
    },
    {
      "role": "user",
      "content": $(echo "$REVIEW_PROMPT" | jq -Rs .)
    }
  ],
  "temperature": 0.3,
  "max_tokens": 2000
}
EOF
    
    REVIEW_RESPONSE=$(curl -s "$GLM_API_BASE/chat/completions" \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $GLM_API_KEY" \
      -d "@$TEMP_JSON" 2>/dev/null | jq -r '.choices[0].message.content' 2>/dev/null || echo "")
    
    # Clean up temp file
    rm -f "$TEMP_JSON" 2>/dev/null || true
    
elif [ -n "$OPENAI_API_KEY" ]; then
    echo -e "${BLUE}Using OpenAI API...${NC}"
    
    # Create temporary JSON file to avoid shell escaping issues
    TEMP_JSON=$(mktemp)
    cat > "$TEMP_JSON" << EOF
{
  "model": "gpt-4-turbo-preview",
  "messages": [
    {
      "role": "system",
      "content": "You are a senior Flutter/Dart code reviewer specializing in Clean Architecture and BLoC patterns."
    },
    {
      "role": "user",
      "content": $(echo "$REVIEW_PROMPT" | jq -Rs .)
    }
  ],
  "temperature": 0.3,
  "max_tokens": 2000
}
EOF
    
    REVIEW_RESPONSE=$(curl -s https://api.openai.com/v1/chat/completions \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $OPENAI_API_KEY" \
      -d "@$TEMP_JSON" 2>/dev/null | jq -r '.choices[0].message.content' 2>/dev/null || echo "")
    
    # Clean up temp file
    rm -f "$TEMP_JSON" 2>/dev/null || true
    
elif [ -n "$ANTHROPIC_API_KEY" ]; then
    echo -e "${BLUE}Using Claude API...${NC}"
    
    # Create temporary JSON file to avoid shell escaping issues
    TEMP_JSON=$(mktemp)
    cat > "$TEMP_JSON" << EOF
{
  "model": "claude-3-5-sonnet-20241022",
  "max_tokens": 2000,
  "messages": [
    {
      "role": "user",
      "content": $(echo "$REVIEW_PROMPT" | jq -Rs .)
    }
  ]
}
EOF
    
    REVIEW_RESPONSE=$(curl -s https://api.anthropic.com/v1/messages \
      -H "Content-Type: application/json" \
      -H "x-api-key: $ANTHROPIC_API_KEY" \
      -H "anthropic-version: 2023-06-01" \
      -d "@$TEMP_JSON" 2>/dev/null | jq -r '.content[0].text' 2>/dev/null || echo "")
    
    # Clean up temp file
    rm -f "$TEMP_JSON" 2>/dev/null || true
    
else
    echo -e "${YELLOW}⚠ No API key found${NC}"
    echo -e "${YELLOW}Set one of: DEEPSEEK_API_KEY, GLM_API_KEY, OPENAI_API_KEY, or ANTHROPIC_API_KEY${NC}"
    echo ""
    exit 0
fi

if [ -z "$REVIEW_RESPONSE" ]; then
    echo -e "${RED}❌ Review failed. API call returned empty response.${NC}"
    echo -e "${YELLOW}Check your API key and network connection.${NC}"
    exit 1
fi

# Display review results
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}📋 Review Results:${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "$REVIEW_RESPONSE"
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

# Check for critical issues
if echo "$REVIEW_RESPONSE" | grep -qiE "(❌|Critical Issues|critical issues)" && ! echo "$REVIEW_RESPONSE" | grep -qiE "(None|none|No critical)" ; then
    echo ""
    echo -e "${RED}❌ Critical issues found! Push blocked.${NC}"
    echo -e "${YELLOW}Please fix the issues above before pushing.${NC}"
    echo ""
    exit 1
fi

echo ""
echo -e "${GREEN}✓ Code review passed. No critical issues found.${NC}"
echo -e "${GREEN}Proceeding with push...${NC}"
echo ""
exit 0

