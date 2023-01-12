build:
    mkdir -p dist
    podman run -e LANG=C.UTF-8 -e LC_ALL=C.UTF-8 --tmpfs /tmp -v $PWD:/data sridca/emanote emanote -L "/data" gen /data/dist

deploy: build
    rsync --delete-excluded -r ./dist/* turgot:fiatjaf.com/zettelkasten/
