# STAGE-1
# Build the kong plugin
FROM kong/kong-gateway:3.4.1.1 AS plugin-builder

USER root

ENV DEBIAN_FRONTEND noninteractive

COPY kong-plugin-json-xml-transformer-0.2.0-1.rockspec /tmp/kong-plugin-json-xml-transformer-0.2.0-1.rockspec
RUN luarocks install /tmp/kong-plugin-json-xml-transformer-0.2.0-1.rockspec

# Copy your plugin directory into the image
COPY kong /usr/local/share/lua/5.1/kong
