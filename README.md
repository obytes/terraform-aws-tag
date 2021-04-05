## Summary
A Terraform open-source module to automate the creation of `tags`, the `Name` key  and other attributes across resources in AWS, the `Name` prefix is based on a customizable order passed by the `prefix_order` variable with a default value of `["enviroemnt", "project_name", "region", "name", "attributes"]` and a configurable `delimiter` variable with value of `-`.

## Features

The module supports the following:
 - Optionally limiting the `id` variable length to a specific number of chars by modifying the `prefix_lenght_limit` variable, defaulted to 0 which means no limit.
 - Optionally configure the case letter of `tag_key_case` and `tag_value_case`, defaults to `title`, `lower` respectively.
 - A random string will be created using the `random` provider that will be used in case of creating a truncated id, `prefix_legnth_limit` !=0.
 - Supporting a configurable `regex_substitute_chars` variable which will replace any non-alphanumeric chars passed to `enviroment`, `project_name`, `region` and, `name`, defaulted to `"/[^(a-z)(A-Z)(0-9)$]/"`.
 - A validation mechanism to validate some input variables e.g. `tag_key_case`, `tag_value_case`, `region`
 - Optional `attributes` which will be added automatically to `tags` variable and `id`

## Usage
### Example 1
```hcl
module "label" {
  source = "github.com/obytes/terraform-aws-tag.git?ref=v1.0.1"
  environment = "dev"
  project_name = "obytes"
  region = "me-south-1"
  delimiter = "+"
  attributes  = ["private"]
  enabled = true
  prefix_length_limit = 10
}
```
The above example will generate the below output that can be passed to another `label` module to create a new `id` that has the base values used on `label_1` module 

```hcl
context = {
  "additional_tags" = {}
  "attributes" = [
    "private",
  ]
  "delimiter" = "+"
  "enabled" = "true"
  "environment" = "dev"
  "prefix_length_limit" = 10
  "prefix_order" = [
    "environment",
    "project_name",
    "region",
    "name",
  ]
  "project_name" = "obytes"
  "region" = "me-south-1"
  "tag_key_case" = "title"
  "tag_value_case" = "lower"
  "tags" = {}
}
id = dev+n4rnkc
tags = {
  "Attributes" = "private"
  "Environment" = "dev"
  "Name" = "dev+n4rnkc"
  "Project_name" = "obytes"
  "Region" = "mesouth1"
}
```
### Example 2

```hcl
module "label2" {
  source = "github.com/obytes/terraform-aws-tag.git?ref=v1.0.1"
  context = module.label1.context
  name = "label2"
  environment = "prd"
  delimiter = "-"
  random_string = module.label1.random_string
}
```
This would generate the below output, as you can see we are using the same values from `label` module such as `attributes`, `prefix_length_limit`, `random_string` and changing `delimiter` and `region`
```hcl
context_label2 = {
  "additional_tags" = {}
  "attributes" = [
    "private",
  ]
  "delimiter" = "-"
  "enabled" = "true"
  "environment" = "prd"
  "name" = "label2"
  "prefix_length_limit" = 10
  "prefix_order" = [
    "environment",
    "project_name",
    "region",
    "name",
  ]
  "project_name" = "obytes"
  "random_string" = "n4rnkc98ht4g"
  "region" = "us-east-1"
  "tag_key_case" = "title"
  "tag_value_case" = "lower"
  "tags" = {}
}
id_label2 = prd-n4rnkc
tags_label2 = {
  "Attributes" = "private"
  "Environment" = "prd"
  "Name" = "prd-n4rnkc"
  "Project_name" = "obytes"
  "Region" = "useast1"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/3.1.0/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | Additional Tags, tags which can be accessed by module.<name>.tags\_as\_list not added to <module>.<name>.<tags> | `map(string)` | `{}` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | A list of attributes e.g. `private`, `shared`, `cost_center` | `list(string)` | `null` | no |
| <a name="input_context"></a> [context](#input\_context) | n/a | `any` | <pre>{<br>  "additional_tags": {},<br>  "attributes": null,<br>  "delimiter": null,<br>  "enabled": true,<br>  "environment": null,<br>  "name": null,<br>  "prefix_length_limit": 0,<br>  "prefix_order": [<br>    "environment",<br>    "project_name",<br>    "region",<br>    "name"<br>  ],<br>  "project_name": null,<br>  "random_string": null,<br>  "regex_substitute_chars": null,<br>  "region": null,<br>  "tag_key_case": "title",<br>  "tag_value_case": "lower",<br>  "tags": {}<br>}</pre> | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `project_name`, `environment`, `region` and, `name`.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | A boolean to enable or disable tagging/labeling module | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment, the environment name such as 'stg', 'prd', 'dev' | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the service/solution such as vpc, ec2 | `string` | `null` | no |
| <a name="input_prefix_length_limit"></a> [prefix\_length\_limit](#input\_prefix\_length\_limit) | The minimum number of chars required for the id/Name desired (minimum =7)<br>Set it to `0` for unlimited number of chars, `full_id` | `number` | `null` | no |
| <a name="input_prefix_order"></a> [prefix\_order](#input\_prefix\_order) | The order of the Name tag<br>Defaults to, `["environment", "project_name", "region", "name"]`<br>at least one should be provided | `list(string)` | `null` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project name or organization name, could be fullName or abbreviation such as `ex` | `string` | `null` | no |
| <a name="input_random_string"></a> [random\_string](#input\_random\_string) | A Random string, that will be appended to `id` in case of using `prefix_length_limit`<br>Using the default value which is `null`, the string will be created using the `random` terraform provider | `string` | `null` | no |
| <a name="input_regex_substitute_chars"></a> [regex\_substitute\_chars](#input\_regex\_substitute\_chars) | a regex to replace empty chars in `project_name`, `environment`, `region` and, `name`<br>defaults to `"\[a-zA-Z0-9]\"`, replacing any chars other than chars and digits | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Environment name such as us-east-1, ap-west-1, eu-central-1 | `string` | `null` | no |
| <a name="input_tag_key_case"></a> [tag\_key\_case](#input\_tag\_key\_case) | The letter case of output tag keys<br>Possible values are `lower', `upper` and `title`<br>defaults to `title`<br>` | `string` | `null` | no |
| <a name="input_tag_value_case"></a> [tag\_value\_case](#input\_tag\_value\_case) | The letter case of output tag values<br>Possible values are `lower', `upper` and `title`<br>defaults to `lower`<br>` | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags, Tags to be generated by this module which can be access by module.<name>.tags e.g. map('CostCenter', 'Production') | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_additional_tags"></a> [additional\_tags](#output\_additional\_tags) | Additional Tags, tags which can be accessed by module.<name>.tags\_as\_list not added to <module>.<name>.<tags> |
| <a name="output_attributes"></a> [attributes](#output\_attributes) | A list of attributes e.g. `private`, `shared`, `cost_center` |
| <a name="output_context"></a> [context](#output\_context) | A context to be used as an input for other modules |
| <a name="output_delimiter"></a> [delimiter](#output\_delimiter) | Delimiter to be used between `project_name`, `environment`, `region` and, `name`. |
| <a name="output_enabled"></a> [enabled](#output\_enabled) | A boolean to enable or disable tagging/labeling module |
| <a name="output_environment"></a> [environment](#output\_environment) | Environment name passed to module such as us-east-1, ap-west-1, eu-central-1 |
| <a name="output_id"></a> [id](#output\_id) | ID, restricted to `prefix_length_limit` if set otherwise, full ID |
| <a name="output_id_full"></a> [id\_full](#output\_id\_full) | Full ID, not restricted to prefix\_length\_limit |
| <a name="output_name"></a> [name](#output\_name) | The name of the service/solution such as vpc, ec2 |
| <a name="output_prefix_order"></a> [prefix\_order](#output\_prefix\_order) | an ordered list of strings that forms the `ID` attribute |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | The project name or organization name, could be fullName or abbreviation such as `ex` |
| <a name="output_random_string"></a> [random\_string](#output\_random\_string) | A random string, used in `id` and `id_short` in case of setting `prefix_lenght_limit` |
| <a name="output_regex_substitute_chars"></a> [regex\_substitute\_chars](#output\_regex\_substitute\_chars) | Regex, to be used for id substitution in case of using `prefix_length_limit` |
| <a name="output_tags"></a> [tags](#output\_tags) | Tags, Tags to be generated by this module which can be access by module.<name>.tags e.g. map('CostCenter', 'Production') |
