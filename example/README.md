### Example1
This is a basic example where  the `id` is created in the form of `["environment", "project_name", "region", "attributes"]` with a `prefix_length_limit` is 10, a random string resource will be created and will be appended to the `id` attribute, the random_length is fixed to 5 where the total `id` is limited to 10.  

```hcl
Outputs:

additional_tags = {}
attributes = tolist([
  "private",
])
context = {
  "additional_tags" = {}
  "attributes" = tolist([
    "private",
  ])
  "delimiter" = "+"
  "enabled" = "true"
  "environment" = "dev"
  "name" = tostring(null)
  "prefix_length_limit" = 10
  "prefix_order" = tolist([
    "environment",
    "project_name",
    "region",
    "name",
    "attributes",
  ])
  "project_name" = "obytes"
  "random_string" = tostring(null)
  "regex_substitute_chars" = tostring(null)
  "region" = "me-south-1"
  "tag_key_case" = "title"
  "tag_value_case" = "lower"
  "tags" = {}
}
delimiter = "+"
enabled = "true"
environment = "dev"
id = "dev+77cdci"
id_full = "dev+obytes+mesouth1+private"
name = ""
prefix_order = tolist([
  "environment",
  "project_name",
  "region",
  "name",
  "attributes",
])
project_name = "obytes"
random_string = "77cdci4sg71q"
regex_substitute_chars = "/[^(a-z)(A-Z)(0-9)$]/"
tags = {
  "Attributes" = "private"
  "Environment" = "dev"
  "Name" = "dev+77cdci"
  "Project_name" = "obytes"
  "Region" = "mesouth1"
}

```

### Example 2

In This example we are creating a new label based on the outputs of `module.label1` outputs with modifying some attributes such as `var.delimiter`  
As shown in the output, the `module.label3` is using the same inputs from `module.label1` such as random_string 
```hcl
Outputs:

additional_tags_label3 = {}
attributes_label3 = tolist([
  "private",
])

context_label3 = {
  "additional_tags" = {}
  "attributes" = tolist([
    "private",
  ])
  "delimiter" = "-"
  "enabled" = "true"
  "environment" = "prd"
  "name" = "prv"
  "prefix_length_limit" = 10
  "prefix_order" = tolist([
    "environment",
    "project_name",
    "region",
    "name",
    "attributes",
  ])
  "project_name" = "obytes"
  "random_string" = "77cdci4sg71q"
  "regex_substitute_chars" = tostring(null)
  "region" = "us-east-1"
  "tag_key_case" = "title"
  "tag_value_case" = "lower"
  "tags" = {}
}
delimiter_label3 = "-"
enabled_label3 = "true"
environment_label3 = "prd"
id_full_label3 = "prd-obytes-useast1-prv-private"
id_label3 = "prd-77cdci"
name_label3 = "prv"
prefix_order_label3 = tolist([
  "environment",
  "project_name",
  "region",
  "name",
  "attributes",
])
project_name_label3 = "obytes"
random_string_label3 = "f46k1x2szgfz"
regex_substitute_chars_label3 = "/[^(a-z)(A-Z)(0-9)$]/"
tags_label3 = {
  "Attributes" = "private"
  "Environment" = "prd"
  "Name" = "prd-77cdci"
  "Project_name" = "obytes"
  "Region" = "useast1"

```