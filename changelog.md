# Changelog

## Version 1.0.0 (2024-04-01)
- Added Dockerfile for containerizing the Redbot Discord bot.
- Added entrypoint.sh script to handle the start of the Docker container.
- Added start_bot.sh script to start the Redbot Discord bot inside the Docker container.
- Updated dependencies and refined startup script.
- Pushed the build to DockerHub.

## Version 0.2.0 (2024-03-29)
- Updated Dockerfile:
  * Updated Java installation to version 17 (openjdk17-jre-headless).
  * Modified the command to start the bot instance to include the prefix parameter.

## Version 0.1.0 (2023-05-10)
- Created start_bot.sh script.
- Made it possible to overwrite RedBot instance with environment variables.
- Changed syntax to allow bot to start with various prefixes.
- Made it possible to have server-specific prefixes.

## Version 0.0.1 (2023-05-09)
- Initial commit.
