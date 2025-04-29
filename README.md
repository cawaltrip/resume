# Resume
This is my resume.  It uses RenderCV to generate it based on a template YAML file.  There's a build script for running locally.  However, private information is stored in GitHub Secrets and a GitHub Action will pull those out and update the YAML file before it builds it and uploads it as an artifact.  So, if you want to use this locally, replace those values.

The theme it uses is based on the `engineeringclassic` theme, however the `BulletEntry` has been updated to allow a date to be added to the right of the entry.

I might switch back to LaTeX in the future, but for now, I like how this works.