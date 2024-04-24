## VTP-dev-env
Something to hold the VoteTracker+ software development environment

A few _meta_ notes on working with VoteTracker+ software:

This repo contains four git submodules that comprise a complete VTP election instance.  They are:

| Git Repository | Contents | Development Notes |
| --- | --- | --- |
| [VTP-mock-election.US.16](https://github.com/TrustTheVote-Project/VTP-mock-election.US.16) | Contains the ElectionData - the definition of the election (address, contest, and tally information etc); all blank ballots; all Cast Vote Records (contest CVR's) and ballot receipts | See [VTP-mock-election.US.16](https://github.com/TrustTheVote-Project/VTP-mock-election.US.16) |
| [VTP-web-api](https://github.com/TrustTheVote-Project/VTP-web-api) | Contains the python FastAPI & uvicorn based web API | main branch has linear history with signed commits |
| [VTP-web-client](https://github.com/TrustTheVote-Project/VTP-web-client) | Contains the html/css/javascript client front end | main branch has linear history with signed commits |
| [VoteTrackerPlus](https://github.com/TrustTheVote-Project/VoteTrackerPlus) | Contains the python based backend | main branch has linear history with signed commits |

The point of this repo is basically to track work that spans multiple repos and in particular when a specific set of the VTP repos are in a working state, such as at the end of a milestone or significant cross repo effort.

If one is working primarily in just one repo, then this repo can more or less be ignored.

Regarding python, poetry is primarly used to manage python environments and as such there is a pyproject.toml file in the VTP-web-api and VoteTracker+ repos.  Each python repo has its own python environment; however, the VTP-web-api poetry environment is a superset of the VoteTrackerPlus poetry environment.

Regarding javascript, the javascript is entirely for the client side frontend and so the browser determines the version of javascript in play, etc.  Best practices are recommended for writing and testing the javascript, namely it need to work on the Chrome, Mozilla, and WebKit engines.  It also needs to be usable on mobile and desktop devices.

All commits across all the repos need to be signed - see [Signing commits](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits)

Finally, a few GitHub status/reference links:

[GitHub status](https://www.githubstatus.com/)

[GitHub public key fingerprints](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints)

[GitHub meta endpoint](https://api.github.com/meta)
