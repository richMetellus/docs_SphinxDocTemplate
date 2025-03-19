# Sphinx Documentation Template

This is a very useful template I used for creating documentation using
python sphinx.

## Get Started

You only need to install `python` and install `pipenv` as the initial requirements.

1. Install python and `pip`
2. Then use `pip` to install `pipenv`

   ```console
   pip install pipenv --user
   ```

3. Additionally, install GNU make on your host machine

Once these two are install. To build the document you need to run the following commands

1. Install the python packages and start a python virtual environment:

    ```python
    pipenv install
    pipenv shell
    ```

2. then build the document: open a terminal at the root folder of the document
   and then type the following command to build a live document

    ```python
    make livehtml
    ```

For more information, see the file

```{eval-rst}
- :doc:`index`
```
