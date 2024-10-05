# Minikube DevOps Tools Installation Script

This repository provides a script and Helm charts to easily install various DevOps open-source tools (e.g., Airflow, Grafana, Prometheus) on a local [Minikube](https://minikube.sigs.k8s.io/docs/) cluster. It simplifies the process of setting up Kubernetes resources using `kustomize` and `helm` with environment-specific overlays.

## Purpose

The goal of this project is to help users quickly deploy and experiment with popular DevOps tools in a local development environment using Minikube. This script streamlines the installation process, making it easier to set up and manage tools like Airflow, Grafana, and Prometheus with minimal manual configuration.

## Features

- Easily build and deploy Kubernetes resources for multiple DevOps tools.
- Supports overlays for different environments (e.g., `dev`, `prod`).
- Uses `kustomize` with `helm` to manage complex Kubernetes configurations.
- Can target a specific tool's directory or process all available tools in the project.

## Prerequisites

Before running this script, make sure you have the following tools installed:

- [Minikube](https://minikube.sigs.k8s.io/docs/) - A tool to run Kubernetes locally.
- [Kustomize](https://kustomize.io/) - Kubernetes native configuration management tool.
- [Helm](https://helm.sh/) - A package manager for Kubernetes.
- [yq](https://github.com/mikefarah/yq) - A lightweight and portable command-line YAML processor.

Ensure that these dependencies are properly installed and available in your `PATH`.

### Installation

You can install these dependencies using Homebrew or follow the installation instructions on their respective websites.

#### Install Dependencies with Homebrew
```bash
brew install kustomize
brew install helm
brew install yq
```

## Usage
### Clone the Repository
```bash
git clone git@github.com:bench87/devops-charts.git
```
### Run the script for all components
```bash
/.build.sh
```
### Run the script for a specific component
```bash
.build.sh <<component name>>
```
## Example Directory Structure
```bash
charts/
├── airflow/
│   └── overlays/
│       ├── local/
├── grafana/
│   └── overlays/
│       ├── local/
└── prometheus/
    └── overlays/
        ├── local/
```
