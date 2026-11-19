A site for song lyrics.

## Requirements
- [Hugo](https://gohugo.io) (extended)
- [Node.js](https://nodejs.org)

## Build and preview

### Quick preview

```bash
hugo server
```

### Rebuild search index

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


Finally, build the site locally and copy to the server with rsync:
```bash
hugo --cleanDestinationDir --minify
npx pagefind --site public
rsync -av --delete public/ user@server:/var/www/lyrics-site/
```

(Make sure the nginx is set to serve the site from that folder)