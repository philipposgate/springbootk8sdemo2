# springbootk8sdemo2

This project is **CHAPTER 2** of a **Demo Spring Boot API with Docker containerization and Kubernetes deployment**.  

* See the developer's [JOURNAL](JOURNAL.md) for this project.


## BASIC USAGE

Build and deploy the app with the following commands...

```
./gradlew clean build
docker build -t springbootk8sdemo2:0.0.1-SNAPSHOT .
kubectl create ns local-springbootk8sdemo2-ns
kubectl apply -k kubernetes/overlays/local
```

Now it's running on your local cluster in the "local-springbootk8sdemo2-ns" namespace.  You should be able to inspect it with the following commands..

```
kubectl describe ns local-springbootk8sdemo2-ns
kubectl -n local-springbootk8sdemo2-ns get all
kubectl -n local-springbootk8sdemo2-ns logs <podName>
```

If you want to make a http call to the Spring Boot API, you first need to execute a **port-forward** command to expose the app on your local on port 8080, like this: ```kubectl -n local-springbootk8sdemo2-ns port-forward <podName> 8080:8080```

e.g.
```
kubectl -n local-springbootk8sdemo2-ns port-forward springbootk8sdemo2-6466fd4956-ptbp8 8080:8080
```

...then you should be able to hit the API at http://localhost:8080/actuator

<br>

## TO UNINSTALL

e.g. delete all resources in namespace
```
kubectl -n local-springbootk8sdemo2-ns delete all --all
```

e.g. delete namespace
```
kubectl delete ns local-springbootk8sdemo2-ns
```
