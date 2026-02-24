# Contributing to Copilot Adventures

Thank you for your interest in contributing to Copilot Adventures! This document provides guidelines and information about our development process, testing infrastructure, and how to contribute effectively.

## Table of Contents

- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Automated Testing Infrastructure](#automated-testing-infrastructure)
- [Running Tests Locally](#running-tests-locally)
- [Submitting Changes](#submitting-changes)
- [Code Style Guidelines](#code-style-guidelines)
- [Adventure Submission Guidelines](#adventure-submission-guidelines)

## Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR-USERNAME/CopilotAdventures.git
   cd CopilotAdventures
   ```
3. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## Development Workflow

1. Make your changes in your feature branch
2. Run tests locally to ensure your changes work correctly
3. Commit your changes with clear, descriptive commit messages
4. Push your branch to your fork
5. Create a Pull Request (PR) against the main repository

## Automated Testing Infrastructure

### Overview

CopilotAdventures uses GitHub Actions for continuous integration (CI) testing. Our automated test workflow runs on:
- **Pull Requests** to the `main` branch
- **Pushes** to the `main` branch
- **Changes** to files in the `Solutions/` directory

The test workflow ensures code quality and prevents regressions by automatically running all test suites whenever changes are made.

### Test Jobs

Our CI pipeline runs **three test jobs in parallel** for maximum efficiency:

1. **JavaScript Tests** (`test-javascript`)
   - Runtime: Node.js 20.x
   - Test Framework: Custom test script
   - Target: Gridlock Arena of Mythos solution
   - Average Duration: ~15 seconds

2. **C# Tests** (`test-csharp`)
   - Runtime: .NET 8.0
   - Test Framework: Custom test runner
   - Target: Gridlock Arena of Mythos solution
   - Average Duration: ~20 seconds

3. **Python Tests** (`test-python`)
   - Runtime: Python 3.12
   - Test Framework: Standalone test script
   - Target: Gridlock Arena of Mythos solution
   - Average Duration: ~10 seconds

### Workflow Performance

- **Parallel Execution**: All three test jobs run simultaneously
- **Total Runtime**: ~2-3 minutes (including setup and teardown)
- **Caching**: Dependencies are cached to speed up subsequent runs
- **Status Checks**: PR merges require all tests to pass

### How Tests Are Triggered

Tests automatically run when:
- You open a new Pull Request
- You push new commits to an existing PR
- Changes are merged to the `main` branch
- Any file in the `Solutions/` directory is modified

## Running Tests Locally

Before submitting your PR, always run tests locally to catch issues early.

### JavaScript Tests

```bash
# Navigate to the JavaScript test directory
cd Solutions/JavaScript/The-Gridlock-Arena-of-Mythos

# Run tests (no installation needed - npm test handles it)
npm test
```

**What happens:**
- Custom test script in `The-Gridlock-Arena-of-Mythos.test.js` runs comprehensive test suites
- Tests validate battle mechanics, creature movements, scoring, and edge cases
- Results are displayed with emoji indicators and detailed pass/fail messages
- npm automatically handles dependencies during test execution

### C# Tests

```bash
# Navigate to the C# solutions directory
cd Solutions/CSharp

# Run tests using the custom test command (recommended)
dotnet run mythos-test
```

**What happens:**
- Custom test runner executes comprehensive tests in `GridlockArenaTests.cs`
- Tests verify creature battles, movement calculations, and game logic
- Results show passed/failed tests with detailed output and emoji indicators

**Note:** The C# solution uses a custom test runner instead of xUnit. The `dotnet run mythos-test` command is the recommended way to run tests locally, matching the CI environment.

### Python Tests

```bash
# Navigate to the Python solutions directory
cd Solutions/Python

# Run tests directly (standalone test file)
python test_gridlock_arena.py

# Or use pytest for more detailed output
pytest test_gridlock_arena.py -v

# Run with coverage report
pytest test_gridlock_arena.py --cov=gridlock_arena_module --cov-report=term-missing
```

**What happens:**
- Custom test script runs comprehensive tests for `gridlock_arena_module.py`
- Tests validate the Gridlock Arena module functionality including battle mechanics, movement, and scoring
- Results are displayed with emoji indicators for passed/failed tests
- When using pytest, you get additional features like coverage reports and verbose output

## Interpreting Test Results

### Successful Test Run

```
✅ All tests passed!
✅ XX/XX test suites passed
✅ Coverage: XX%
```

When you see this, your changes are ready for submission.

### Failed Test Run

```
❌ FAIL: Test name
   AssertionError: Expected X but got Y
   
   File "test_file.py", line 42
```

**Steps to fix:**
1. Read the error message carefully - it tells you what failed
2. Check the file and line number mentioned in the stack trace
3. Review your changes - did you break existing functionality?
4. Fix the issue and run tests again
5. Repeat until all tests pass

### Common Test Failures and Solutions

#### JavaScript

**Issue:** `Cannot find module`
```
Error: Cannot find module 'some-module'
```
**Solution:** Run `npm install` in the test directory

**Issue:** Test timeout
```
Timeout - Async callback was not invoked within the 5000 ms timeout
```
**Solution:** Check for unresolved promises or infinite loops in your code

#### C#

**Issue:** Build failed
```
error CS0103: The name 'X' does not exist in the current context
```
**Solution:** Check your using statements and namespace declarations

**Issue:** Test discovery failed
```
No test is available
```
**Solution:** Ensure your test methods have the `[Fact]` or `[Theory]` attribute

#### Python

**Issue:** Import error
```
ModuleNotFoundError: No module named 'X'
```
**Solution:** Check your import statements and ensure the module file exists

**Issue:** Assertion failed
```
AssertionError: assert 5 == 10
```
**Solution:** Review the test expectations and your implementation logic

## Submitting Changes

### Creating a Pull Request

1. Push your changes to your fork
2. Go to the [CopilotAdventures repository](https://github.com/UnclesTavern/CopilotAdventures)
3. Click "New Pull Request"
4. Select your branch and provide:
   - **Clear title**: Describe what your PR does
   - **Description**: Explain the changes and why they're needed
   - **Testing notes**: Mention which tests you ran and the results

### PR Requirements

Before your PR can be merged:
- ✅ All automated tests must pass
- ✅ Code must follow project style guidelines
- ✅ Changes must be reviewed and approved
- ✅ Branch must be up to date with `main`

### After Submitting

- Monitor your PR for CI test results (appears within a few minutes)
- Address any test failures or reviewer feedback
- Keep your branch updated with the latest `main` branch changes

## Code Style Guidelines

### General Principles

- **Readability First**: Write code that's easy to understand
- **Educational Comments**: Include comments showing how Copilot helped
- **Self-Contained Solutions**: Minimize external dependencies
- **Fantasy Naming**: Use thematic variable names that align with adventures

### Language-Specific Conventions

**C#:**
- Use PascalCase for class and method names
- Use camelCase for local variables
- Follow .NET conventions and best practices

**JavaScript:**
- Use camelCase for variables and functions
- Use PascalCase for classes
- Prefer `const` and `let` over `var`

**Python:**
- Use snake_case for functions and variables
- Use PascalCase for classes
- Follow PEP 8 style guidelines

## Adventure Submission Guidelines

Want to create a new Copilot Adventure? Great! Here's what you need:

### Requirements

1. **Adventure markdown file** following the template in the `Adventures/` folder
2. **Hero image** (landscape format, 1456x832 pixels)
3. **Complete solution code** in a single file
4. **Solution placement** in the appropriate language folder in `Solutions/`
5. **Testing** - ensure your solution works correctly

### PR Title Format

```
New Copilot Adventure: [Your Adventure Name]
```

### What to Include

- Specify difficulty level (Beginner/Intermediate/Advanced)
- Choose Copilot mode (Agent/Ask/Both)
- Follow the fantasy adventure theme
- Ensure educational value and clear learning objectives
- Test your solution thoroughly

For more details, see the [README.md](./README.md) submission guidelines.

## Need Help?

- 💬 **Questions?** Open an issue in the repository
- 🐛 **Found a bug?** Report it via GitHub Issues
- 💡 **Feature idea?** Share it in the Discussions section
- 🤝 **Get involved**: Join the [Azure AI Foundry Discord](https://aka.ms/foundry/discord)

Thank you for contributing to Copilot Adventures! Your efforts help developers worldwide learn GitHub Copilot through engaging, adventure-themed challenges.
