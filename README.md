# PyEI

[![DOI](https://joss.theoj.org/papers/10.21105/joss.03397/status.svg)](https://doi.org/10.21105/joss.03397)

PyEI is a Python library for ecological inference. The target audience is the analyst with an interest in the phenomenon called Racially Polarized Voting.

Racially Polarized Voting is a legal concept developed through case law under the Voting Rights Act of 1965; its genesis is in the majority opinion of ***Thornburg v. Gingles (1982)***. Considered the “evidentiary linchpin” for vote dilution cases, RPV is a necessary, but not sufficient, condition that plaintiffs must satisfy for a valid claim. 

Toward that end, ecological inference uses observed data (historical election results), pairing voting outcomes with demographic information
for each precinct in a given polity, to infer voting patterns for each demographic group.

PyEI brings together a variety of ecological inference methods in one place and facilitates reporting and plotting results; quantifying the uncertainty associated with results under a given model; making comparisons between methods; and bringing relevant diagnostic tools to bear on ecological inference methods.

PyEI is relatively new and under active development, so expect rough edges and bugs -- and for additional features and documentation to be coming quickly!

## Want to use PyEI? Start here.

### Installation
You can install the latest release from `PyPi` with:

```
pip install pyei
```

Or, install directly from GitHub for the most up-to-date (but potentially less stable) version:

```
pip install git+https://github.com/mggg/ecological-inference.git
 ```
 
If you would like to explore PyEI without installation, you can explore this [interactive Colab notebook](https://colab.research.google.com/drive/1Vr1kKAAHgdcUhPrpFsYc1Kz31nbcpZjP#scrollTo=_ASEm5L3UUAS) (just note that inference might be slow!)


### Example notebooks

Check out the [intro notebooks](https://github.com/mggg/ecological-inference/tree/main/intro_notebooks) and [example notebooks](https://github.com/mggg/ecological-inference/tree/main/examples) for sample code
that shows how to run and adjust the various models in PyEI on datesets.  

If you are new to ecological inference generally, start with [`pyei/intro_notebooks/Introduction_to_EI.ipynb`](https://github.com/mggg/ecological-inference/blob/main/intro_notebooks/Introduction_to_EI.ipynb).

If you are familiar with ecological inference and want an overview of PyEI and how to use it (with examples), then start with [`intro_notebooks/PyEI_overview.ipynb`](https://github.com/mggg/ecological-inference/blob/main/intro_notebooks/PyEI_overview.ipynb).

To explore EI's plotting functionality, check out [`pyei/intro_notebooks/Plotting_with_PyEI.ipynb`](https://github.com/mggg/ecological-inference/blob/main/intro_notebooks/Plotting_with_PyEI.ipynb).

For more work with two-by-two examples, see in [`pyei/examples/santa_clara_demo.ipynb`](https://github.com/mggg/ecological-inference/blob/main/examples/santa_clara_demo.ipynb).

For more work with r-by-c examples, see [`pyei/examples/santa_clara_demo_r_by_c.ipynb`](https://github.com/mggg/ecological-inference/blob/main/examples/santa_clara_demo_r_by_c.ipynb).

For examples of model comparison and checking steps with PyEI, see [`pyei/examples/model_eval_and_comparison_demo.ipynb`](https://github.com/mggg/ecological-inference/blob/main/examples/model_eval_and_comparison_demo.ipynb).

### Issues

Feel free to file an issue if you are running into trouble or if there is a feature you'd particularly like to see, and we will do our best to get to it!


## Want to contribute to PyEI? Start here.

Contributions are welcome! 

Uses Python 3.10. We provide multiple ways to set up your development environment.

### Development with Docker (Recommended)

The easiest way to get started is using Docker with our Makefile:

```bash
# Build the Docker image and run tests
make test

# Run linting
make lint

# Start an interactive development session
make bash

# Run pre-commit hooks
make pre-commit

# See all available commands
make help
```

### Local Development

If you prefer to work without Docker, you can set up your environment locally:

#### Install with virtualenv

```bash
virtualenv pyei_venv           # create virtualenv
source pyei_venv/bin/activate  # activate virtualenv
python -m pip install -U pip   # upgrade pip
python -m pip install -e .     # install project locally
python -m pip install -r requirements-dev.txt  # install dev requirements
```

#### Install with conda

```bash
conda create --name pyei --channel conda-forge python=3.10 --file requirements.txt --file requirements-dev.txt # create conda environment and install requirements
conda activate pyei
pip install -e . #install project locally
```

### Testing and Linting

After making changes, make sure everything works by running:

**With Docker (recommended):**
```bash
make lint
make test
```

**Without Docker:**
```bash
# Run linting
ruff check .
ruff format --check .
mypy --ignore-missing-imports pyei

# Run tests  
pytest -vx --cov pyei
```

This will also run automatically when you make a pull request, so if you have trouble getting that to run, just open the PR, and we can help!

### Pre-commit Hooks

We use pre-commit hooks to ensure code quality. Install them with:

```bash
# With Docker
make pre-commit

# Without Docker (after local setup)
pre-commit install
pre-commit run --all-files
```

### Requirements Management

Dependencies are pinned for reproducible builds:

- `requirements.txt` - Production dependencies with pinned versions
- `requirements-dev.txt` - Development dependencies with pinned versions  
- `requirements.lock` - Complete dependency tree with exact versions

To update dependencies:

```bash
# Check current versions
make freeze-requirements

# Update the lock file after changing requirements.txt
make update-requirements
```

## Citation

If you are using PyEI, please cite it as: 

Knudson et al., (2021). PyEI: A Python package for ecological inference. Journal of Open Source Software, 6(64), 3397, https://doi.org/10.21105/joss.03397

BibTeX:

```
@article{Knudson2021,
  doi = {10.21105/joss.03397},
  url = {https://doi.org/10.21105/joss.03397},
  year = {2021},
  publisher = {The Open Journal},
  volume = {6},
  number = {64},
  pages = {3397},
  author = {Karin C. Knudson and Gabe Schoenbach and Amariah Becker},
  title = {PyEI: A Python package for ecological inference},
  journal = {Journal of Open Source Software}
}
```


