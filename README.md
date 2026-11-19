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
```bash
hugo --cleanDestinationDir --minify
npx pagefind --site public
rsync -av --delete public/ user@server:/var/www/lyrics/
```
