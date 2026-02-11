## Official InvenTree Chart

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

  helm repo add inventree https://inventree.github.io/helm-chart

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
trendmend` to see the charts.

To install the inventree chart:

    helm install my-inventree inventree/inventree

To uninstall the chart:

    helm uninstall my-inventree

Read the documentation regarding [configuration keys](https://docs.inventree.org/en/stable/start/config/).
Issues regrading docker deployment should be reported to [inventree/helm-charts](https://github.com/inventree/helm-charts/issues) all other issues / feature requests should be routed to the primary issue tracker [inventree/inventree](https://github.com/inventree/InvenTree/issues)
