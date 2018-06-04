#!/usr/bin/env bats

# run tests
# --------

if ! markdownlint --help &> /dev/null; then
    echo "Error: markdownlint-cli not installed. Run npm install -g markdownlint-cli and try again."
    exit 1
fi

if ! shellcheck --version &> /dev/null; then
    echo "Error: shellcheck not installed. View installation instructions here:"
    echo "https://github.com/koalaman/shellcheck#installing"
    exit 1
fi

@test "markdown files conform to rules defined in .markdownlintrc" {
    run make lint

    [ "$status" -eq 0 ]
}

@test "bin/cub passes shellcheck" {
    run make test

    [ "$status" -eq 0 ]
}
