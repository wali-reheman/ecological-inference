# Migration Notes

This document describes breaking changes and migration instructions for the PyEI package.

## Version 1.2.0 - Code Refactoring (Breaking Changes)

### Overview
This release includes significant internal refactoring to improve code organization and maintainability. While the public API remains largely unchanged, some internal functions have been renamed and import patterns have been updated.

### Breaking Changes

#### 1. Private Function Renaming
Several internal helper functions have been renamed to follow Python conventions for private functions (leading underscore).

**Affected Functions:**
- `size_ticks()` → `_size_ticks()`
- `size_yticklabels()` → `_size_yticklabels()`
- `plot_single_ridgeplot()` → `_plot_single_ridgeplot()`
- `plot_single_histogram()` → `_plot_single_histogram()`
- `log_binom_sum()` → `_log_binom_sum()`
- `binom_conv_log_p()` → `_binom_conv_log_p()`
- `goodmans_er_bayes_model()` → `_goodmans_er_bayes_model()`
- `goodmans_er_bayes_pop_weighted_model()` → `_goodmans_er_bayes_pop_weighted_model()`
- `r_function()` → `_r_function()`
- `sample_low_to_high()` → `_sample_low_to_high()`
- `sample_high_to_low()` → `_sample_high_to_low()`
- `sample_Sigma()` → `_sample_Sigma()`
- `sample_mu()` → `_sample_mu()`
- `proposal_dist_generate_sample()` → `_proposal_dist_generate_sample()`
- `log_unnormalized_pdf()` → `_log_unnormalized_pdf()`
- `theta_to_omega()` → `_theta_to_omega()`
- `sample_theta()` → `_sample_theta()`
- `omega_to_theta()` → `_omega_to_theta()`
- `sample_internal_cell_counts()` → `_sample_internal_cell_counts()`
- `get_initial_internal_count_sample()` → `_get_initial_internal_count_sample()`

**Migration Required:** If you were directly importing or calling any of these functions, update your code to use the new names with leading underscores.

**Example:**
```python
# Before (v1.1.x)
from pyei.plot_utils import size_ticks
size_ticks(ax, "x")

# After (v1.2.0+)
from pyei.plot_utils import _size_ticks
_size_ticks(ax, "x")
```

#### 2. Import Pattern Changes
All relative imports within the package have been converted to absolute imports.

**Migration Required:** If you were copying import patterns from the PyEI source code, update them to use absolute imports.

**Example:**
```python
# Before (internal PyEI code)
from .plot_utils import plot_kdes
from .r_by_c_models import ei_multinom_dirichlet

# After (internal PyEI code)
from pyei.plot_utils import plot_kdes
from pyei.r_by_c_models import ei_multinom_dirichlet
```

#### 3. Removed `__all__` Specifiers
All `__all__` specifiers have been removed from module files.

**Impact:** This affects `from module import *` statements. While not recommended, if you were using wildcard imports, you may need to import specific functions explicitly.

**Example:**
```python
# Before (if using wildcard imports)
from pyei.plot_utils import *
# This would import only functions listed in __all__

# After (recommended approach)
from pyei.plot_utils import plot_kdes, plot_summary
# Import only what you need explicitly
```

### Non-Breaking Changes

#### 1. Public API Unchanged
All public classes and methods remain unchanged:
- `TwoByTwoEI`
- `TwoByTwoEIBaseBayes`
- `GoodmansER`
- `GoodmansERBayes`
- `RowByColumnEI`
- `Datasets`

#### 2. Functionality Preserved
All existing functionality works exactly the same way. Only internal implementation details have changed.

### Migration Checklist

- [ ] Search your codebase for any direct imports of the renamed private functions
- [ ] Update function calls to use the new names with leading underscores
- [ ] Replace any wildcard imports (`from module import *`) with explicit imports
- [ ] Test your code to ensure it still works as expected

### Need Help?

If you encounter issues during migration:
1. Check this migration guide for the specific function you're using
2. Look at the updated PyEI source code for correct import patterns
3. Open an issue on GitHub if you need assistance

### Future Considerations

- Private functions (those with leading underscores) are considered internal implementation details
- Future versions may change or remove private functions without notice
- Always use public APIs when possible for better compatibility across versions