# trufflelintly
docker github action to run trufflehog and then lintly

# Lintly-trufflehog GitHub Action

A GitHub Action that scans the repo for secrets with Trufflehog then automatically creates pull request reviews if there are any violations.

## Usage

To use Lintly-trufflehog GitHub Action, add the following to a GitHub Actions workflow file such as `.github/workflows/main.yml`:

```yaml
on: [pull_request]

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: scriptsrc/trufflelintly@main
        with:
          # (Required) The GitHub API token to create reviews with
          token: ${{ secrets.GITHUB_TOKEN }}

          # Fail if "new" violations detected or "any", default "new"
          failIf: new

          # Additional arguments to pass to trufflehog
          args: ""
```

Now each PR created will be checked for secrets. If there are any violations then Lintly will comment on the PR using the `github-actions` bot user.

![Lintly example](example.png)

**Note:** Lintly-CFN-Nag only works with the `pull_request` event. If your job runs on the `push` event then make sure the Lintly-CFN-Nag step only runs on the pull request event by adding `if: github.event_name == 'pull_request'`:

```yaml
      - uses: scriptsrc/trufflelintly@main
        if: github.event_name == 'pull_request'
```
