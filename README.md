This repository contains the documentation for the Climate Adaptation 
Data Platform, which is available online at https://docs.hottertimes.com.

# Contributions

Documentation is critical for onboarding people quickly onto the project.
All contributions are welcome (some are useful :).

You can fork the repository and submit a pull request (PR) to have your
contribution merged and deployed.

## Building the documentation

The documentation can be built locally using the included shell script
`make_book.sh`.
This script requires 

- R
- the `bookdown` package,
- pandoc
- latex

Alternatively, the documentation can be made using Docker. 
Then you only need the same dependencies as required for the CADP itself.

```
make build doc
```


## Deploying the documentation

The latest commit on master will automatically be deployed. 
Only trusted committers should be able to push to the master branch.

