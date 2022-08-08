This branch is meant to provision a TFE workspace that provisions other workspaces.
The default is to use another branch in this repo to define what workspaces are 
created and managed by the workspace created in this branch.

## Setup Vars
```
cp terraform.tfvars.example terraform.tfvars
```

Also establish token values in your env or rpfix plan/apply with

```
TF_VAR_github_oauth_token="<SECRET_TOKEN> TF_VAR_tfe_token="<TFE_ADMIN_TOKEN>"
```

### Oauth Token
Go to github and create a [personal access token](https://github.com/settings/tokens/new)
with the `repo` and `admin:repo_hook` scopes. Use this generated value for your
`oauth_token` value in `terraform.tfvars`.
