# Contributing to CopilotAdventures

Thank you for your interest in contributing to CopilotAdventures! This guide will help you understand how to contribute effectively and work with our automated testing infrastructure.

## Table of Contents

- [Getting Started](#getting-started)
- [Automated Testing Infrastructure](#automated-testing-infrastructure)
- [Running Tests Locally](#running-tests-locally)
- [Creating a New Adventure](#creating-a-new-adventure)
- [Troubleshooting](#troubleshooting)
- [Pull Request Process](#pull-request-process)

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR-USERNAME/CopilotAdventures.git`
3. Create a new branch: `git checkout -b my-feature-branch`
4. Make your changes
5. Test your changes locally
6. Submit a pull request

## Automated Testing Infrastructure

### Overview

CopilotAdventures uses GitHub Actions for continuous integration (CI) to ensure code quality and functionality across all solution languages. Our test workflow automatically runs when:

- **Pull requests** are opened or updated targeting the `main` branch
- **Pushes** are made to the `main` branch
- Changes are made to files in `Solutions/**` or `.github/workflows/test.yml`

### Test Workflow Details

The test workflow (`.github/workflows/test.yml`) runs three parallel jobs to test solutions in different languages:

#### 1. JavaScript Tests (`test-javascript`)
- **Runtime Environment**: Node.js 20 on Ubuntu
- **Package Manager**: npm with dependency caching
- **Test Location**: `Solutions/JavaScript/The-Gridlock-Arena-of-Mythos`
- **Test Framework**: Custom test runner (no external dependencies)
- **Typical Duration**: ~6 seconds

#### 2. C# Tests (`test-csharp`)
- **Runtime Environment**: .NET SDK 9.x on Ubuntu
- **Package Manager**: NuGet with dependency caching
- **Test Location**: `Solutions/CSharp`
- **Test Framework**: xUnit with custom test integration
- **Typical Duration**: ~27 seconds

#### 3. Python Tests (`test-python`)
- **Runtime Environment**: Python 3.11 on Ubuntu
- **Test Location**: `Solutions/Python`
- **Test Framework**: Custom test runner (standalone execution)
- **Typical Duration**: ~2 seconds

### Performance Characteristics

- **Total Workflow Duration**: ~30 seconds (well below the 2-3 minute target)
- **Parallel Execution**: All three jobs run simultaneously for efficiency
- **Caching Strategy**: Dependencies are cached to speed up subsequent runs
- **Resource Optimization**: Tests only run on changes to `Solutions/**` or workflow files

### Interpreting Test Results

When you submit a pull request or push changes, GitHub Actions will automatically:

1. **Start the workflow** - You'll see a yellow dot (⚫) next to your commit indicating tests are running
2. **Execute all three jobs in parallel** - Each language's tests run independently
3. **Report results** - After completion, you'll see either:
   - ✅ **Green checkmark** - All tests passed
   - ❌ **Red X** - One or more tests failed
   - ⚫ **Yellow dot** - Tests are still running

Click on the workflow status to view detailed logs for each job and identify any failures.

## Running Tests Locally

Before submitting a pull request, run the tests locally to ensure your changes work correctly.

### JavaScript Tests

```bash
# Navigate to the JavaScript test directory
cd Solutions/JavaScript/The-Gridlock-Arena-of-Mythos

# Install dependencies (first time only)
npm install

# Run tests
npm test
```

**Expected Output**: You should see test results for the Gridlock Arena implementation with all tests passing.

### C# Tests

```bash
# Navigate to the C# solutions directory
cd Solutions/CSharp

# Run tests using the custom test runner
dotnet run mythos-test
```

**Note**: The C# solutions use a custom test runner integrated into the main application, not a standalone xUnit test framework. The workflow runs `dotnet test` for consistency with .NET conventions, but the actual tests execute via the custom runner.

**Expected Output**: Custom test results showing all test cases passing for the Gridlock Arena implementation.

### Python Tests

```bash
# Navigate to the Python solutions directory
cd Solutions/Python

# Run tests (no installation required - uses custom test runner)
python test_gridlock_arena.py
```

**Expected Output**: Custom test results showing all test cases passing for the Gridlock Arena implementation.

## Creating a New Adventure

When contributing a new adventure, please follow these guidelines:

### Adventure Structure

1. **Adventure File**: Create a markdown file in the appropriate difficulty folder under `Adventures/Agent/` or `Adventures/Ask/`
   - Use the naming convention: `The-[Name]-of-[Location]-[Mode].md`
   - Follow the existing template structure

2. **Hero Image**: Include a landscape image (1456x832 pixels)
   - Place images in the `Images/` directory
   - Use Microsoft Copilot Image Creator or similar tools

3. **Solution Code**: Provide a complete solution in a single file
   - Place in the appropriate language folder under `Solutions/`
   - Use the naming convention: `The-[Name]-of-[Location].[ext]`
   - Include educational comments showing Copilot interaction patterns

4. **Tests** (if applicable): If your solution includes tests, ensure they:
   - Follow existing test patterns in the repository
   - Can be run both locally and in CI
   - Include clear documentation

### C# Solutions

For C# solutions, update `Solutions/CSharp/Program.cs` to add your adventure to the switch statement:

```csharp
case "your-adventure":
    var yourAdventure = new YourAdventure();
    yourAdventure.Run();
    break;
```

## Troubleshooting

### Common Test Failures

#### JavaScript Tests Fail

**Problem**: `npm ci` fails with package-lock.json error

**Solution**: 
```bash
cd Solutions/JavaScript/The-Gridlock-Arena-of-Mythos
npm install --package-lock-only
```

**Problem**: Tests fail due to missing dependencies

**Solution**: 
```bash
rm -rf node_modules package-lock.json
npm install
npm test
```

#### C# Tests Fail

**Problem**: `dotnet run mythos-test` fails

**Solution**: 
```bash
cd Solutions/CSharp
dotnet clean
dotnet restore
dotnet run mythos-test
```

**Problem**: Build errors due to .NET version mismatch

**Solution**: Ensure you have .NET SDK 9.x installed:
```bash
dotnet --version  # Should show 9.x
```

#### Python Tests Fail

**Problem**: Import errors or module not found

**Solution**: Ensure you're running from the correct directory:
```bash
cd Solutions/Python
python test_gridlock_arena.py
```

**Problem**: Python version mismatch

**Solution**: The tests are designed for Python 3.11 but should work with 3.8+:
```bash
python --version  # Check your Python version
```

### CI-Specific Issues

**Problem**: Tests pass locally but fail in CI

**Possible Causes**:
- File path differences (Windows vs. Linux)
- Missing files not tracked in git
- Environment-specific dependencies

**Solution**: 
1. Check the CI logs carefully for specific error messages
2. Ensure all required files are committed
3. Test on a clean checkout of your branch

**Problem**: Workflow doesn't trigger on pull request

**Solution**: 
- Ensure your changes include files in `Solutions/**`
- Check that your PR targets the `main` branch
- Verify your PR doesn't have conflicts

## Pull Request Process

### Before Submitting

- [ ] Run all relevant tests locally and ensure they pass
- [ ] Follow the coding conventions in existing solutions
- [ ] Include educational comments in your code
- [ ] Update documentation if needed
- [ ] Ensure your branch is up to date with `main`

### PR Title Format

Use descriptive titles that clearly indicate the change:

- **New Adventure**: `New Copilot Adventure: [Adventure Name]`
- **Bug Fix**: `Fix: [Brief description]`
- **Enhancement**: `Enhance: [Brief description]`
- **Documentation**: `Docs: [Brief description]`

### PR Description

Include the following in your PR description:

1. **Purpose**: What does this PR accomplish?
2. **Changes**: What files were modified and why?
3. **Testing**: How did you test your changes?
4. **Adventure Details** (if applicable):
   - Difficulty level (Beginner/Intermediate/Advanced)
   - Copilot mode (Agent/Ask)
   - Language(s) used
   - Learning objectives

### Review Process

1. Automated tests will run automatically
2. Maintainers will review your code and provide feedback
3. Address any requested changes
4. Once approved, your PR will be merged

## Code of Conduct

Please note that this project follows the [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## Questions?

If you have questions or need help:

- Review existing issues and pull requests for similar discussions
- Create a new issue with your question
- Join the community discussions

Thank you for contributing to CopilotAdventures! 🚀
