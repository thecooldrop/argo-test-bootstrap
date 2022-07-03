kind delete cluster && \
kind create cluster && \
kubectl apply -k bootstrap/argocd
kubectl wait --for condition=established --timeout=60s crd/applications.argoproj.io -n argocd
kubectl apply -k bootstrap
while true; do
  kubectl get secret argocd-initial-admin-secret -n argocd;
  if [[ "$?" -eq 0 ]]; then
    break
  fi
  sleep 5
done
kubectl get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' -n argocd| base64 -d | xclip -selection c
kubectl port-forward service/argocd-server 1234:80 -n argocd