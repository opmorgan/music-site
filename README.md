A site for song lyrics.

## Requirements
- [Hugo](https://gohugo.io) (extended)
- [Node.js](https://nodejs.org)

## Build and preview

```bash
hugo --cleanDestinationDir --minify
npx pagefind --site public --output-path static/pagefind
hugo server
```

or:
```bash
hugo --cleanDestinationDir --minify
npx pagefind --site public
npx serve public
```

## Deploy

Deploy with rsync (https://gohugo.io/host-and-deploy/deploy-with-rsync/)

First, add your public key to .ssh/authorized_keys:
```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub USER@SERVER
```

Test that you can access the server without entering a password:
```bash
ssh USER@SERVER
```

Give your user root ownership of the target folder:
```bash
sudo chown -R USER:USER /var/www/lyrics-site
ls -ld /var/www/lyrics-site
```

Finally, build the site locally and copy to the server with rsync:
```bash
set -a && source .env && set +a
hugo --cleanDestinationDir --minify
npx pagefind --site public
rsync -av --delete public/ "${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_PATH}/"
```

Or use the script:
```bash
./deploy.sh
```

(Make sure the nginx is set to serve the site from that folder)