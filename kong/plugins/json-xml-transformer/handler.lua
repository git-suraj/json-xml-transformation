local plugin_name = "json-xml-transformer"
local cjson = require "cjson"
local xml2lua = require("xml2lua")
local xmlhandler = require("xmlhandler.tree")
local xmlwriter = require("xml2lua.xmlwriter")

-- load the base plugin object and create a subclass
local json_xml_transformer = require("kong.plugins.base_plugin"):extend()

-- constructor
function json_xml_transformer:new()
  json_xml_transformer.super.new(self, plugin_name)
end

function json_xml_transformer:access(config)
  json_xml_transformer.super.access(self)

  ngx.req.read_body()
  local body = ngx.req.get_body_data()
  
  if body then
    local json_body = cjson.decode(body)
    local writer = xmlwriter:new()
    xml2lua.toXml(writer, json_body)
    local xml_body = writer:toString()
    
    ngx.req.set_header("content-type", "application/xml")
    ngx.req.set_header("content-length", #xml_body)
    ngx.req.set_body_data(xml_body)
  end
end

-- set the plugin priority, which determines plugin execution order
json_xml_transformer.PRIORITY = 990

-- return our plugin object
return json_xml_transformer
