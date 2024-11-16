# Changelog

## Version 1.1.0 (2024-11-16)
### Major Updates
- Migrated to a Debian-based Dockerfile for improved compatibility and stability.
  * New Dockerfile created at the root of the repository and named `Dockerfile`.
  * Old Alpine-based Dockerfile moved to `deprecated/last-stable-alpine/`.
  * Added `dos2unix` to the Dockerfile for handling line-ending issues in scripts.
- Enhanced environment variable handling:
  * Added support for dynamic configuration using `ARG` and `ENV` directives.
  * Hardcoded ENV variables in Dockerfile for default values:
    - `RED_USERNAME`
    - `RED_USER_ID`
    - `RED_ADDITIONAL_PATHS`
    - Updated `PATH` to include `RED_ADDITIONAL_PATHS`.

### Script Changes
- Extracted the bot setup and startup logic from the old Dockerfile into a standalone script:
  * `scripts/start.sh` was created by moving and adapting the inline script previously defined in the Dockerfile.
- Added `scripts/entrypoint.sh` (not in use, kept for potential future use).

### Other Changes
- Updated `LICENSE_MIT` to reflect the change in ownership:
  * Added "Copyright (c) 2023 GlennIgen."
- Updated `dev/docker_commands/push.txt` to reflect the new Debian-based build and run commands.
- Added `.gitignore` to exclude sensitive files:
  * `.env`
  * `red_token.txt`

### Deprecations
- Moved all Alpine-based builds and related scripts to `deprecated/last-stable-alpine/`.

## Version 1.0.0 (2024-04-01)
- Added Dockerfile for containerizing the Redbot Discord bot.
- Added `entrypoint.sh` script to handle the start of the Docker container.
- Added `start_bot.sh` script to start the Redbot Discord bot inside the Docker container.
- Updated dependencies and refined the startup script.
- Pushed the build to DockerHub.

## Version 0.2.0 (2024-03-29)
- Updated Dockerfile:
  * Updated Java installation to version 17 (`openjdk17-jre-headless`).
  * Modified the command to start the bot instance to include the prefix parameter.

## Version 0.1.0 (2023-05-10)
- Created `start_bot.sh` script.
- Made it possible to overwrite RedBot instance with environment variables.
- Changed syntax to allow the bot to start with various prefixes.
- Made it possible to have server-specific prefixes.

## Version 0.0.1 (2023-05-09)
- Initial commit.
