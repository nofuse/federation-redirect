# Matrix well-known via Coolify environment variables

This version lets you set the Matrix host values from Coolify environment variables instead of hardcoding them in files.

## Coolify variables to set

- `PUBLIC_MATRIX_DOMAIN=example.org`
- `MATRIX_HOST=matrix.nofuse.org`
- `MATRIX_PORT=443`

or

## Coolify variables to set

- `PUBLIC_MATRIX_DOMAIN=m.example.org`
- `MATRIX_HOST=matrix.m.nofuse.org`
- `MATRIX_PORT=443`

## How it works

The container starts nginx and uses `envsubst` to render the nginx config from `default.conf.template`.
The JSON responses are generated directly by nginx, so you do not need to mount separate client/server JSON files.

## Deploy in Coolify

1. Create a Dockerfile-based app or Docker Compose app.
2. Add the three variables in the **Environment Variables** section.
3. Set the domain in Coolify to `https://m.nofuse.org`.
4. Deploy.

## Result

The app will serve:

- `/.well-known/matrix/client` -> `https://$MATRIX_HOST`
- `/.well-known/matrix/server` -> `$MATRIX_HOST:$MATRIX_PORT`
