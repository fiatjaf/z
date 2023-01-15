build:
    mkdir -p dist
    rm -rf dist/*
    podman run -e LANG=C.UTF-8 -e LC_ALL=C.UTF-8 --tmpfs /tmp -v $PWD:/data sridca/emanote emanote gen /data/dist

deploy: build
    rsync --delete-excluded -r ./dist/* turgot:fiatjaf.com/zettelkasten/

new:
    #!/usr/bin/env python
    import random
    import datetime
    filename = bytes([int(random.random()*256) for n in range(4)]).hex() + '.md'
    file = open(filename, 'w')
    now = datetime.datetime.now().isoformat()[0:-10]
    file.write(f"""---
    date: {now}
    ---

    #

    """)
    print(filename)
