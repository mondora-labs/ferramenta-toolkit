FROM vault as vault-source
FROM hashicorp/terraform:light as terraform-source

FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install ca-certificates jq -y

COPY --from=terraform-source /bin/terraform /usr/local/bin/terraform
COPY --from=vault-source /bin/vault /usr/local/bin/vault
