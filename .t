language: node_js
node_js:
- '8'
before_script:
- npm install -g gitbook-cli
script:
- gitbook install
- gitbook build
- git config --global user.email "$GIT_EMAIL"
- git config --global user.name "$GIT_NAME"
- git config --global push.default simple
- mkdir gh-pages
- git clone --depth 1 --branch gh-pages https://$GH_TOKEN@github.com/$GH_REPO gh-pages
- cp -R _book/* gh-pages
- cd gh-pages
- git add -A .
- MESSAGE=`date +\ %Y-%m-%d\ %H:%M:%S`
- git commit -m "Book updated:$MESSAGE"
- git push --quiet
env:
  global:
    secure: ejzf9obdHH3wtl+yX82HV5EnKrffHnmZ3vG1fJTlIwfhGij7kEX6RrDPQygVoQLVVYu80UvlnZNG0IcYBB8VeflNyuM6tuLZ8z7kDrjTEACv2Z0iSK0u6u+md3Lcf3XZo/diSJqPSydXpIHcpHw9Onmybw7kMxWTW7do3VTiA5LxFEsdDb3P9oHQxsnbOxvyGW5g4JvJShev3aCybPjet5MXOKze/OF5FVW0a9Qru7sJ1N/DjJueEonl2gyhdFxTQcvQ4GgFpthfaXlzb6pSM5GQfaFIj1vArBWX8I+xGTwoAKagf2hGdwncEogj9GqfSlc+nsOqVlFCKF4utBZwMkSuoUmZsswe6UJLeD8FEVmkVhJjv+TOv2kM2bTPcnbpRsuBT14GQjvR+3XDZHyY07U5MMJTu6CqmwOET3twKf55c/c0qynFV58UOla2BlAtOgR7OcoH0+ybiG8iWOIkbBDJvQRW2A674xsKGTIF3dPFPW3iXH0E4XqQymmJPCZv29kIYZQ3TewtW8gFFp3SFl2nH+IZU5v7tAM3Q38R5AcxQSmF1Q8nbxbLrWn/zhEl95wBXrflij8aS9Usm1xyDRwug0pjdNOuhhh9JG25Llvc05p5/RWO/i7CWWr7sutAst/uIxXSlAr4LVx7D79hC9kW8+OckwjMp+ZOIMsUU3I=
