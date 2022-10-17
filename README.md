# springbootk8sdemo2

This project is **CHAPTER 2** of a **Demo Spring Boot API with Docker containerization and Kubernetes deployment**.  

* See the developer's [JOURNAL](JOURNAL.md) for this project.


## BASIC USAGE

```
$ ./gradlew clean build
$ ./gradlew bootBuildImage
$ kubectl apply -k kubernetes/overlays/local
$ kubectl get all
$ kubectl port-forward svc/springbootk8sdemo2 8080:8080
```
...then hit http://localhost:8080/actuator