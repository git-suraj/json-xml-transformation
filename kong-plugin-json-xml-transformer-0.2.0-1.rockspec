package = "kong-plugin-json-xml-transformer"
version = "0.2.0-1"
supported_platforms = {"linux", "macosx"}
source = {
   url = ".",
   dir = "."
}
description = {
   summary = "json-xml-transformer is a Kong plugin to transform JSON request to XML",
   detailed = [[
## Configuration parameters
|FORM PARAMETER|DEFAULT|DESCRIPTION|
|:----|:------:|------:|
|config.ignore_content_type|false|This parameter can be used if any traffic (not only application/xml) shall be tried to convert|
]],
   homepage = "https://github.com/svenwal/kong-plugin-json-xml-transformer",
   license = "BSD 2-Clause License"
}
dependencies = {
   "xml2lua >= 1.4",
}

build = {
  type = "builtin",
  modules = {
    -- TODO: add any additional files that the plugin consists of
    ["kong.plugins.json-xml-transformer.handler"] = "kong/plugins/json-xml-transformer/handler.lua",
    ["kong.plugins.json-xml-transformer.schema"] = "kong/plugins/json-xml-transformer/schema.lua",
  }
}
