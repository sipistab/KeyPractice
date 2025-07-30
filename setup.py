from setuptools import setup, find_packages

setup(
    name='keypractice',
    version='0.1.11',
    description='A slim, cross-platform terminal-based typing trainer with YAML-based exercises and analytics.',
    author='Stephen',
    packages=find_packages(),
    install_requires=[
        'PyYAML>=6.0',
    ],
    entry_points={
        'console_scripts': [
            'keypractice=keypractice.__main__:main',
        ],
    },
    include_package_data=True,
    package_data={
        'keypractice': ['data/*.json', 'exercises/*.yaml'],
    },
    python_requires='>=3.7',
    scripts_dir='Scripts',
) 