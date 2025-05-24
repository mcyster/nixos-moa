
# Nixos config for `emu`

This is the `/etc/nixos` directory on  `emu`.


## Restore Backup

```
PAT=XXXXXXXXXXXXX   # PAT key from github

cd /etc
git clone "https://mcyster:$PAT@github.com/mcyster/nixos-emu.git" nixos
```

## Update Backup

```
PAT=XXXXXXXXXXXXX   # PAT key from github

cd /etc/nixos
# make changes
# git add -A
# git commit -m "Message"

git push "https://mcyster:$PAT@github.com/mcyster/nixos-emu.git"
```

## Generate a PAT

Goto [github tokens](https://github.com/settings/tokens)
- Generate New Token
  - Geneate new token (classic)
    - Note: nixos-backup
    - Expiration: 30 days
    - Selected scopes: repo
    - Generate Token
  - Copy token put in environment variable PAT

