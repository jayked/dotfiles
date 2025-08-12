# CoPilot Chatmodes

This directory contains a variety of chatmodes for GitHub CoPilot.
A symlink will be set to `~/.copilot/chatmodes` by using the installscript.
VS Code should either automatically detect the chatmodes or you can create a symlink from `~/.copilot/chatmodes` to `.github/chatmodes` inside your workspace.

## Modes
This folder will contain multiple modes.

### Test writer
This chat mode transforms GitHub Copilot into a test writing expert that helps create comprehensive tests for your codebase.

#### Example Prompts
1. "Generate unit tests for the `UserService` class in my workspace, following our existing test patterns."
2. "Create integration tests for my API endpoints based on the current route definitions."
3. "Look at my current test coverage and suggest tests for uncovered edge cases."
4. "Write tests for the error handling in my current module, including all error scenarios."
5. "Generate performance tests for my database operations based on the current implementation."
6. "Create mock objects and test data based on my current types and interfaces."
7. "Write end-to-end tests for the authentication flow in my application."
8. "Generate boundary tests for all the validation functions in my current workspace."

#### Tips
- The bot will analyze your existing tests for patterns
- Specify your preferred testing framework
- Ask for specific types of tests (unit, integration, e2e)
- Request coverage for specific edge cases
- Ask for test organization suggestions

### Dashboard creator

This chat mode transforms GitHub Copilot into a dashboard creation expert that helps you visualize data from your workspace using simple, self-contained solutions.

#### Example Prompts
1. "Create a dashboard to visualize the data in my `data/sales.csv` file, focusing on monthly trends and regional breakdowns."
2. "Look at my project's package.json dependencies and create a dependency relationship visualization dashboard."
3. "Generate a performance dashboard for the metrics data in my logs directory, updating in real-time."
4. "Create a React dashboard using Recharts to visualize the API response data in my current test fixtures."
5. "Build a dashboard for my project's test coverage data using the latest test results."
6. "Generate a simple HTML dashboard to monitor the database metrics from my configuration files."
7. "Create an interactive dashboard for analyzing the JSON data in my current workspace's data directory."

#### Tips
- Specify if you want a single-file HTML solution or a React component
- The bot will analyze your data files automatically
- Mention any specific charts or visualizations you need
- Tell the bot if you want to use specific libraries (Chart.js, Recharts, etc.)
- Indicate if you need real-time updates or static visualizations

## Thanks
Thanks to [dfinke](https://github.com/dfinke) for providing some awesome examples and inspiration in the [awesome-copilot-chatmodes](https://github.com/dfinke/awesome-copilot-chatmodes) repo.
