# [local-npm](https://github.com/nolanlawson/local-npm) for Docker
[local-npm](https://github.com/nolanlawson/local-npm) in iron.io's very small iron/node

## Quick-start
```bash
$ docker run -d -v "$PWD/data":/data -p 5080:5080 klowner/local-npm
```
Pretty straight-forward, after running the above command you should have a functioning `npm` mirror.
You can tell `npm` to use it by running ```npm set registry http://127.0.0.1:5080```.

Check out the full [local-npm documentation](https://github.com/nolanlawson/local-npm).
