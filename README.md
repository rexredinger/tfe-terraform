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
Hostname of your TFC/E installation

### tfe_token
TFE_TOKEN for tfe-provider auth

Branches here are used to represent different projects and may reference each other.
