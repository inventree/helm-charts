## Official InvenTree Chart

Chart for The Open Source Inventory and PLM Solution

[Helm](https://helm.sh/docs)) must be installed to use this chart.

Add the repo as follows:

  helm repo add inventree https://inventree.github.io/helm-chart

To install the inventree chart:

    helm install my-inventree inventree/inventree

To uninstall the chart:

    helm uninstall my-inventree


Make sure to read the documentation regarding [configuration keys](https://docs.inventree.org/en/stable/start/config/).

Issues regrading docker deployment should be reported to [inventree/helm-charts](https://github.com/inventree/helm-charts/issues) all other issues / feature requests should be routed to the primary issue tracker [inventree/inventree](https://github.com/inventree/InvenTree/issues)

InvenTree suports a wiede variety of plugins, find a list on the [dedicated web page](https://inventree.org/plugins).
