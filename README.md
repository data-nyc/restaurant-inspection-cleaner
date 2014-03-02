restaurant-inspection-cleaner
=============================

The inspection data provided on
[data.cityofnewyork.us](https://data.cityofnewyork.us/Health/Restaurant-Inspection-Results/4vkw-7nck) is not in the proper
comma separated values format. This script was created to correct the
current set of data in Restaurant Inspection Results.


## Requirements

- Ruby installed on a unix computer.
- Make installed


## Setup

Clone the git repository

    > git@github.com:data-nyc/restaurant-inspection-cleaner.git


## Howto

Run actions within Makefile.  After this has been run, a set of cleaned files will be located in ./cleaned in the main directory.

    > make


## Contributing

- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
- Fork the project
- Start a feature/bugfix branch
- Commit and push until you are happy with your contribution
- Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
- Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

