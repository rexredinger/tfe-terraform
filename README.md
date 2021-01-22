# my-tfe

Clone this repo to your local machine.

## Setup Vars
```
cp terraform.tfvars.example terraform.tfvars
```

### Oauth Token
Go to github and create a [personal access token](https://github.com/settings/tokens/new)
with the `repo` and `admin:repo_hook` scopes. Use this generated value for your
`oauth_token` value in `terraform.tfvars`.

### Hostname
```
rake tfe:local:info
```
Use the hostname portion of the url returned in the above command as your
`hostname` value in `terraform.tfvars`.


## Usage
After nuking, you will need to create a new API token in the TFE UI and set it
up properly with a [terraform credentials file](https://www.terraform.io/docs/commands/cli-config.html#available-settings). Also be certain to remove the state file (`terraform.tfstate`) and the (`.terraform`) file to refresh Terraform state. In the future, we may be able
to write a script to handle this automatically.

I personally setup branches for each environment I regularly use like:
* prod/duckduck
* prod/duckduck-with-queue-manager
* oasis/duckduck
* local/duckduck
* ...
