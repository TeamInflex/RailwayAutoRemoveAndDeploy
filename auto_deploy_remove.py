import os
import time

# Your actual Python deployment and removal logic goes here
def deploy_and_remove():
    os.system("railway link")
    os.system("railway destroy --all -y")
    os.system("railway deploy")

# Example usage
deploy_and_remove()
