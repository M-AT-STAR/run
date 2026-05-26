from setuptools import setup, find_packages

setup(
    name='m0scan',               # The name people will pip install
    version='1.0.0',             # Update this number when you make changes
    packages=find_packages(),
    entry_points={
        'console_scripts': [
            'm0scan=m0scan.main:run',  # This lets users just type 'm0scan' in terminal
        ],
    },
    description='M0scan installation wrapper',
    author='Your Name',
    url='https://github.com/yourusername/m0scan', # Your GitHub link goes here
)

