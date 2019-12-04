import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="latolog-fabioqcorreia", # Replace with your own username
    version="0.0.1",
    author="Fábio Correia",
    author_email="fabioqcorreia@gmail.com",
    description="A package that makes customizing logs easier than expected",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/fabioqcorreia/LatoLog",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
)