# Official InvenTree Chart
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/MIT)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/inventree/helm-charts)](https://github.com/inventree/helm-charts/tags)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/inventree)](https://artifacthub.io/packages/search?repo=inventree)
![GitHub Commit Activity](https://img.shields.io/github/commit-activity/m/inventree/helm-charts)


This repository holds the source and artifacts for the InvenTree Helm chart.

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add inventree https://inventree.github.io/helm-charts

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
inventree` to see the charts.

To install the inventree chart:

    helm install my-inventree inventree/inventree

To uninstall the chart:

    helm uninstall my-inventree

Read the official documentation regarding [configuration keys](https://docs.inventree.org/en/stable/start/config/). See `charts/` for chart specific documentation.