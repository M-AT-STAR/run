from setuptools import setup, find_packages

setup(
    name='M-AT-STAR-Tools',
    version='1.0.3',
    packages=find_packages(),
    entry_points={
        'console_scripts': [
            'm0scan=m0scan.main:run',
        ],
    },
    description='M0scan installation wrapper',
    author='M-AT-STAR',
    url='https://github.com/M-AT-STAR/run',
)
