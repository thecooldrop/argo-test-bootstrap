kubectl apply -k bootstrap
kubectl get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' -n argocd | base64 -d
kubectl port-forward service/argocd-server 1234:80 -n argocd