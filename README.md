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

### Quick Start with Notebooks

To run the example notebooks locally with `uv`:

```bash
# Clone the repository
git clone https://github.com/mggg/ecological-inference.git
cd ecological-inference

# Set up development environment (requires Python 3.11+)
make setup

# Start Jupyter notebook server
make notebook
```

Then open your browser to `http://localhost:8888` and use the token provided in the terminal.


### Example notebooks

Check out the [intro notebooks](https://github.com/mggg/ecological-inference/tree/main/intro_notebooks) and [example notebooks](https://github.com/mggg/ecological-inference/tree/main/examples) for sample code
that shows how to run and adjust the various models in PyEI on datasets.  

If you are new to ecological inference generally, start with [`intro_notebooks/Introduction_to_EI.ipynb`](https://github.com/mggg/ecological-inference/blob/main/intro_notebooks/Introduction_to_EI.ipynb).

If you are familiar with ecological inference and want an overview of PyEI and how to use it (with examples), then start with [`intro_notebooks/PyEI_overview.ipynb`](https://github.com/mggg/ecological-inference/blob/main/intro_notebooks/PyEI_overview.ipynb).

To explore EI's plotting functionality, check out [`intro_notebooks/Plotting_with_PyEI.ipynb`](https://github.com/mggg/ecological-inference/blob/main/intro_notebooks/Plotting_with_PyEI.ipynb).

For more work with two-by-two examples, see in [`examples/santa_clara_demo.ipynb`](https://github.com/mggg/ecological-inference/blob/main/examples/santa_clara_demo.ipynb).

For more work with r-by-c examples, see [`examples/santa_clara_demo_r_by_c.ipynb`](https://github.com/mggg/ecological-inference/blob/main/examples/santa_clara_demo_r_by_c.ipynb).

For examples of model comparison and checking steps with PyEI, see [`examples/model_eval_and_comparison_demo.ipynb`](https://github.com/mggg/ecological-inference/blob/main/examples/model_eval_and_comparison_demo.ipynb).

### Issues

Feel free to file an issue if you are running into trouble or if there is a feature you'd particularly like to see, and we will do our best to get to it!


## Want to contribute to PyEI? Start here.

Contributions are welcome! 

Uses Python 3.11. We provide multiple ways to set up your development environment.

## Development

### Prerequisites

- Python 3.11 or later
- [uv](https://docs.astral.sh/uv/) package manager

### Setting up Development Environment

1. **Install uv** (if not already installed):
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

2. **Clone and setup**:
   ```bash
   git clone https://github.com/mggg/ecological-inference.git
   cd ecological-inference
   make setup
   ```

3. **Activate virtual environment**:
   ```bash
   source .venv/bin/activate
   ```

### Development Commands

```bash
# Run tests
make test

# Run linting
make lint

# Format code
make format

# Type checking
make type-check

# Run all checks
make check

# Start Jupyter notebook
make notebook

# Clean up
make clean
```

### Dependency Management

PyEI uses dependency groups in `pyproject.toml`:

- **Core dependencies**: Automatically installed with the package
- **Dev dependencies**: `uv pip install -e ".[dev]"` (includes testing, linting, Jupyter)
- **Docs dependencies**: `uv pip install -e ".[docs]"` (includes Sphinx documentation tools)

### Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Run tests: `make test`
5. Run linting: `make lint`
6. Commit your changes: `git commit -m "Add feature"`
7. Push to your fork: `git push origin feature-name`
8. Create a Pull Request

## Requirements

PyEI requires Python 3.11 or later. Key dependencies include:

- **Scientific Computing**: NumPy, SciPy, Pandas, Matplotlib, Seaborn
- **Machine Learning**: Scikit-learn
- **Bayesian Inference**: PyMC, ArviZ, PyTensor
- **High-Performance Computing**: JAX, NumPyro
- **Data I/O**: NetCDF4, HDF5, XArray
- **Utilities**: Tqdm, Graphviz


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