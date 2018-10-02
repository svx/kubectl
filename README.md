# Kubernetes Command-line Tool In Docker

Kubectl In A Container

For remote interacting with k8.

## Dependencies

- kube config file
- Docker

## Usage

```bash
docker run -v $PATH/TO/CONFIG:/root/.kube/config dersvens/kubectl:latest cluster-info
```

Or as function in `bash`

```bash
# kubectl container
kube_ctl(){
    docker run -v /home/svx/.config/kube/config:/root/.kube/config dersvens/kubectl:latest "$@"
}
alias kubectl="kube_ctl"

Reload your bash configuration

```bash
source .bashrc
```

Niw you can do things like: `kubectl cluster-info`


## Contributing

Pull requests are welcome.

For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)