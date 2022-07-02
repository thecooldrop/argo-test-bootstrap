kubectl apply -k bootstrap
kubectl get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d
kubectl port-forward service/argocd-server :80 -n argocd