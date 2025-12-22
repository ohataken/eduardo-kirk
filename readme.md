# eduardo-kirk

### installation

available on homebrew tap.

```sh
brew tap ohataken/eduardo-kirk https://github.com/ohataken/eduardo-kirk
brew install eduardo-kirk
```

### .claude/settings.json example

```
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "eduardo-kirk session-start"
          }
        ]
      }
    ],
    "SessionEnd": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "eduardo-kirk session-end"
          }
        ]
      }
    ],
    "Notification": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "eduardo-kirk notification"
          }
        ]
      }
    ],
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "eduardo-kirk stop"
          }
        ]
      }
    ],
    "UserPromptSubmit": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "eduardo-kirk user-prompt-submit"
          }
        ]
      }
    ]
  }
}
```
