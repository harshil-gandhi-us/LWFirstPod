#!/bin/bash
echo "Validating Swift Package..."
# Check Package.swift exists
if [ ! -f "Package.swift" ]; then
    echo "❌ Package.swift not found"
    exit 1
fi
echo "✅ Package.swift found"
# Check dump-package
if swift package dump-package > /dev/null 2>&1; then
    echo "✅ Package.swift is valid"
else
    echo "❌ Package.swift has errors"
    exit 1
fi
# Check build
if swift build > /dev/null 2>&1; then
    echo "✅ Package builds successfully"
else
    echo "❌ Package has build errors"
    exit 1
fi
# Check for tags
if git tag | grep -E '^[0-9]+.[0-9]+.[0-9]+$' > /dev/null; then
    echo "✅ Semantic version tags found"
else
    echo "❌ No semantic version tags"
    exit 1
fi
echo ""
echo "✅ All basic validations passed!"
echo "Remember to verify repository is public before publishing."