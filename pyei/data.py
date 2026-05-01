"""Helpers for managing data files."""

from dataclasses import dataclass

import pandas as pd

__all__ = ["Datasets"]


@dataclass
class _DataSet:
    """Class to hold datasets and related information.

    Attributes:
        url: URL to the CSV file.

    Each dataset includes the following metadata (populated on first access):
        name: Human-readable name of the dataset.
        description: Brief description of the dataset's origin and contents.
        citation: Recommended citation for the dataset.
        source_url: Original source of the data.
        group_names: Column name(s) for demographic group vote shares.
        candidate_names: Column name(s) for candidate vote totals.
        precinct_col: Name of the precinct identifier column.
    """

    url: str

    # Optional metadata fields
    name: str = ""
    description: str = ""
    citation: str = ""
    source_url: str = ""
    group_names: tuple = ()
    candidate_names: tuple = ()
    precinct_col: str = ""

    def to_dataframe(self) -> pd.DataFrame:
        """Materialize as a pandas dataframe."""
        return pd.read_csv(self.url)


class Datasets:  # pylint: disable=too-few-public-methods
    """Available datasets related to ecological inference.

    These support examples in the library. Please open an issue or pull request if you would
    like to see other specific examples, or have questions about these."""

    Santa_Clara = _DataSet(
        url="https://raw.githubusercontent.com/gerrymandr/ei-app/master/santaClara.csv",
        name="Santa Clara County, CA",
        description=(
            "Voting and demographic data for Santa Clara County precincts, "
            "used for demonstrating ecological inference on California election data."
        ),
        citation=(
            "MGGG (Metric Geometry and Gerrymandering Group). "
            "https://github.com/gerrymandr/ei-app"
        ),
        source_url="https://github.com/gerrymandr/ei-app",
        group_names=("white", "latino"),
        candidate_names=("burton", "pete", "soto"),
        precinct_col="precinct",
    )
    Waterbury = _DataSet(
        url="https://raw.githubusercontent.com/gerrymandr/ei-app/master/waterbury.csv",
        name="Waterbury, CT",
        description=(
            "Voting and demographic data for Waterbury, Connecticut precincts, "
            "used as a canonical example in ecological inference literature "
            "(e.g., Freedman et al., 1998)."
        ),
        citation=(
            "MGGG (Metric Geometry and Gerrymandering Group). "
            "https://github.com/gerrymandr/ei-app"
        ),
        source_url="https://github.com/gerrymandr/ei-app",
        group_names=("white", "black"),
        candidate_names=("wright", "sherman"),
        precinct_col="precinct",
    )
