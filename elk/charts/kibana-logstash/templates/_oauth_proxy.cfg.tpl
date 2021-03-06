## OAuth2 Proxy Config File

## <addr>:<port> to listen on for HTTP/HTTPS clients
http_address = ":4180"

## the OAuth Redirect URL.
redirect_url = "https://{{ .Values.kibana.ingress.host }}/oauth2/callback"

## the http url(s) of the upstream endpoint. If multiple, routing is based on path
upstreams = [
    # Kibana service 
    "http://localhost:5601/"
]

## Log requests to stdout
request_logging = true

## Email Domains to allow authentication for (this authorizes any email on this domain)
authenticated_emails_file = "/authorization/oauth2_emails.cfg"

## The OAuth Client ID, Secret
client_id = "{{ .Values.oauth.client.id }}"
client_secret = "{{ .Values.oauth.client.secret }}"

## Pass OAuth Access token to upstream via "X-Forwarded-Access-Token"
pass_basic_auth = false

## Cookie Settings
## Name     - the cookie name
## Secret   - the seed string for secure cookies; should be 16, 24, or 32 bytes
##            for use with an AES cipher when cookie_refresh or pass_access_token
##            is set
## Domain   - (optional) cookie domain to force cookies to (ie: .yourcompany.com)
## Expire   - (duration) expire timeframe for cookie
## Refresh  - (duration) refresh the cookie when duration has elapsed after cookie was initially set.
##            Should be less than cookie_expire; set to 0 to disable.
##            On refresh, OAuth token is re-validated.
##            (ie: 1h means tokens are refreshed on request 1hr+ after it was set)
## Secure   - secure cookies are only sent by the browser of a HTTPS connection (recommended)
## HttpOnly - httponly cookies are not readable by javascript (recommended)
cookie_name = "kibana_sso_cookie"
cookie_secret = "{{ .Values.oauth.cookie.secret }}"
cookie_domain = "{{ .Values.kibana.ingress.host }}"
cookie_expire = "{{ .Values.oauth.cookie.expire }}"
cookie_refresh = "{{ .Values.oauth.cookie.refresh }}"
cookie_secure = true
cookie_httponly = true

## Provider Specific Configurations
provider="azure"
skip_provider_button = true