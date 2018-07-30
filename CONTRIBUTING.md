# Contributing to setup.sh

> [We won't ship shit. – Robert C. Martin](https://www.youtube.com/watch?v=BSaAMQVq01E)

Thank you for willing to contribute to our [setup.sh project](/). The following 
contributing guidelines intend to ease contribution on this project. These are 
mostly guidelines, not rules. 

## Table of Contents

* [I Just Have A Question](#i-just-have-a-question)
* [How To Contribute](#how-to-contribute)
	* [Before Contributing](#before-contributing)
	* [Submiting An Issue](#submiting-an-issue)
	* [Your First Code Contribution](#your-first-code-contribution)
	* [Pull Requests](#pull-requests)
	* [Design Decisions](#design-decisions)
* [Quality Assurance](#quality-assurance)
* [Styleguides](#styleguides)
	* [Git Commit Messages](#git-commit-messages)
	* [Documentation](#documentation)
* [Issues And Pull Requests Labels](#issues-and-pull-requests-labels)
	* [Type Of Change](#type-of-change)
	* [Severity](#severity)
	* [Type](#type)
* [CHANGELOG](#changelog)

## I Just Have A Question

> **Note:** Please do not file an issue to ask a question. You'll get faster 
results by following the guidelines below.

Feel free to ask you question directly on [Gitter](https://gitter.im/NShift/setup.sh).
The collaborators and the community are all over the world and could reply at
anytime of the day.

## How To Contribute

### Before Contributing

You are welcome contribute to the GitHub Guidelines whenever you feel it can be 
improved or you can add to it.

Before you go on with your contribution, make sure to first do these steps:

1. Determine if the enhancement should be suggested in this repository.
2. Perform a search inside the [issues](/issues) and [pull requests](/pulls) 
sections to see if the issue has already been reported or not. If it has 
and the issue is still open, add a comment to the existing issue instead of 
opening a new one.

> :warning: If you create a new issue that addresses an enhancement that has 
already been suggested, your issue will be closed.

### Submiting An Issue

Any enhancement and bug report should be tracked as an issue created using 
[Github issue templates](/.github/ISSUE_TEMPLATE/). You should follow the 
proccess of [creating a new issue](/issues/new) by selecting one of the 
available options:

* [New app](/issues/new?template=new-apps.md): Suggest a new app that improve our 
productivity
* [Enhancement](/issues/new?template=enhancement.md): Suggest an enhancement on 
existing command lines
* [Bug Report](/issues/new?template=bug-report.md): Create a report to help us 
improve
* [Project Design](/issues/new?template=project-design.md): Suggest a better 
approach on project design

Issues should be fill out with the maximum of information and should follow the
instructions:

```markdown
## What's the issue?
<!-- Describe the context of the issue. -->
<!-- Describe the action that produces the issue. -->
<!-- Describe your expectation. -->

## Goals
<!-- List the high-level objectives of this issue. -->
<!-- Include any relevant context. -->

## Expectation
<!-- Describe your expectation. -->
```

### Your First Code Contribution

Unsure where to begin contributing to `setup.sh`? You can start by looking through 
the beginner issues with the following labels:

* [`Severity: Low`](/labels/Severity%3A%20Low): The issue concerns a new feature 
or any addition to the project
* [`Severity: Medium`](/labels/Severity%3A%20Medium): The issue reports cosmetic 
items, formatting, spelling, colors, etc.

If you just want to add non-existing apps in the script, please feel free to
update `apps.sh` and create a [pull request using the required template](#pull-requests).

### Pull Requests

* Fill in [the required template](/.github/PULL_REQUEST_TEMPLATE.md)
* Do not include issue numbers in the PR title
* Use `Closes` keyword, when it actually fixes the related issue
* Include screenshots and animated GIFs in your pull request whenever possible
* Give credit to those who inspired you
* Remove empty sections when using the pull request template
* Document new code based on the [Documentation Styleguide](#documentation)
* Add `changelog: [KEYWORD] DESCRIPTION` to the merging commit message to update the CHANGELOG
* Pull requests must be reviewed by at least 2 collaborators
* Continuous integration tool must validate the pull requests before merging

### Design Decisions

* Each significant decision in how we structure the project and what 
architecture we are using, should be documented it in the 
[ADR (Architecture Decision Record) folder](/ADR)
* ADR documents should follow the format described in the [ADR README file](/ADR/README.md)
* All decisions should be ensured by automated tests.

## Quality Assurance

`setup.sh` is running using Travis.CI to ensure the quality of the product.

Currently, it will be overkilled to add unit tests for command lines. However, 
we should ensure the quality of the documentation, the project structure and
the collaboration (git commit, Github issues and pull requests, CHANGELOG) through
automated tests.

Every time the `CONTRIBUTING.md` file is updated or a new ADR file is created, 
we should update the automated tests.

## Styleguides

### Git Commit Messages

Git commit messages should help reviewers to do better reviews. It is based on the
[Nigh Shift git commit message styleguide](https://github.com/nshift/github-guidelines#git-commit-messages).

You should configure your git hooks path, before writing a commit message:

```
git config core.hooksPath .githooks
```

The commit message hook tends to follow these rules:

* Write short messages (we recommend 80 characters or less)
* Add more details in [description commit section](https://stackoverflow.com/a/36427485)
* Use the present tense
* Use the imperative mood
* Reference issues and pull requests liberally after the first line
* Start your commit using emojis to describe the nature of the commit:
	* :computer: `:computer:` when writing new lines of code
	* :art: `:art:` when improving the format/structure of the code
	* :construction_worker: `:construction_worker:` when improving the format/structure of the project
	* :racehorse: `:racehorse:` when improving performance
	* :non-potable_water: `:non-potable_water:` when plugging memory leaks
	* :memo: `:memo:` when writing docs
	* :bug: `:bug:` when fixing a bug
	* :fire: `:fire:` when removing code or files
	* :green_heart: `:green_heart:` when fixing the CI build
	* :white_check_mark: `:white_check_mark:` when adding tests
	* :lock: `:lock:` when dealing with security
	* :arrow_up: `:arrow_up:` when upgrading dependencies
	* :arrow_down: `:arrow_down:` when downgrading dependencies
	* :shirt: `:shirt:` when removing linter warnings

**Example:**
```markdown
commit fake6d5abaeadfake84848l5c1f91fb6pe7fa06b
Author: Damien Fraud <damien.fraud@gmail.com>
Date:   Tue Jan 1 13:31:42 2018 +0200

    :memo: Add CONTRIBUTING.md.
 
 	Related to #42.

commit fake60990a7fg05db36j9f83da321se76e368422
Author: Romain ASNAR <romain.asnar@gmail.com>
Date:   Tue Jan 2 13:31:42 2018 +0200

	:white_check_mark: Add linter to ensure the quality of documentation.

	Related to #43.

commit fake1361c1772f85abeba255b01c0sd72067828f
Author: Abderrahim Benmakhlouf <abderrahim.benmakhlouf@gmail.com>
Date:   Tue Jan 3 13:31:42 2018 +0200

	:bug: Fix issue when installing bundler.

	Related to #43.
```

### Documentation

* Use `##` to document the code
* A comment should be wrapped if it exceed 80 columns
* Group and document all the command line related to a specific subject
* Group should contain few command lines
* Provide enough information related to the group:
	* Title
	* Short description
	* Related resources.
* Make sure a report can be generated:
	* Use `step` function before executing group command lines
	* Use `success` function when command lines have been successfuly executed
	* Use `error` function when command lines failed.

**Example:**
```markdown
##
## Xcode.
##
## Xcode is an integrated development environment for macOS containing a suite 
## of software development tools developed by Apple for developing software 
## for macOS, iOS, watchOS, and tvOS.
##
## See more: https://developer.apple.com/xcode/.
##
step "Install Xcode"

mas lucky xcode

if [ $? -eq 0 ]; then
	success "Sucessfully installed Xcode."
else
	error "Fail to install Xcode."
fi

##
## Slack.
##
## Slack is the collaboration hub that brings the right people together with all 
## the right information and tools to get work done.
##
## See more: https://slack.com.
##
step "Install Slack"

mas lucky slack

if [ $? -eq 0 ]; then
	success "Sucessfully installed Slack."
else
	error "Fail to install Slack."
fi
```

## Issues And Pull Requests Labels

Labels help reviewers identify issues and pull requests quickly. Only one type of 
each category should be assigned at the same time.

### Type Of Change

| Label name       | Description                                                     |
| ---------------- | --------------------------------------------------------------- |
| `Change: Minor`  | Less than 64 lines changed, or less than 8 core lines changed   |
| `Change: Medium` | Less than 256 lines changed, or less than 64 core lines changed |
| `Change: Master` | More than 256 lines changed, or more than 64 core lines changed |
| `Change: Expert` | Needs specialized, in-depth review                              |

### Severity

| Label name           | Description                                                          |
| -------------------- | -------------------------------------------------------------------- |
| `Severity: Blocker`  | The issue is blocking an impending release                           |
| `Severity: Critical` | The issue causes data loss, crashes or hangs salt processes, makes the system unresponsive, etc. |
| `Severity: High`     | The issue reports incorrect functionality, bad functionality, a confusing user experience, etc. |
| `Severity: Strong`   | The issue concerns changes to the core areas of the project          |
| `Severity: Medium`   | The issue reports cosmetic items, formatting, spelling, colors, etc. |
| `Severity: Low`      | The issue concerns a new feature or any addition to the project      |

### Type

| Label name            | Description                                                   |
| --------------------- | ------------------------------------------------------------- |
| `Type: Feature`       | The issue is the development of a new feature of your project |
| `Type: Bug`           | The issue is an identified bug that needs to be fixed         |
| `Type: Enhancement`   | The issue is a suggestion of enhancement to your project.     |
| `Type: Documentation` | The issue is the creation or refinement of a document         |

## CHANGELOG

* Changelogs are for humans, not machines
* The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
* Each entry should correspond to a new version
* The latest version comes first
* The release date of each versions is displayed
* Add pull request number at the end of each entry
* Add Github author at the end of each entry, only if the contributor is not a 
collaborator
* The same types of changes should be grouped
* Use keywords to use for a complete changelog:
	* `Added` for new features
	* `Changed` for changes in existing functionality
	* `Deprecated` for soon-to-be removed features
	* `Removed` for now removed features
	* `Fixed` for any bug fixes
	* `Security` in case of vulnerabilities.

**Example:**
 ```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## 1.2.0 - 2018-07-28

### Added

- Syntax highlighting for Cake files - #4935. Thanks @say25!
- WebStorm support for macOS - #4841. Thanks @mrsimonfletcher!

### Fixed

- Pressing 'Enter' on filtered Pull Request does not checkout - #4673
- Syntax highlighting not working for files with upper-case file extension - #4462. Thanks @say25!

### Changed

- Always fast-forward the default branch - #4506

## 1.1.0 - 2018-07-21

### Fixed

- Escape behavior for Pull Request list does not match Branch List - #3597
- Potential race condition when opening a fork pull request - #4149
 ```