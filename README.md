# Internal-tide-displacements-enhance-surface-interior-heat-exchange-in-the-Indonesian-Seas
This project provides the raw data and codes to reproduce the figures of a paper submitted to GRL The raw data are saved in Matlab data format. Plsese download all files into a folder and run the Script_GRL.m under MATLAB. The code and data to reproduce key results are shown below. Full model outputs are available upon request to the corresponding author.
## Raw Data

### `Figure_1.mat`:
 
`Figure_1.mat` is the raw data to produce the sea surface temperature (SST) of the region model (Figure 1a) and the bar plot of heat budget terms (Figure 1b). The `XC`, `YC` and `D` is the longitude, latitude and the bathymetry and `SST` is the SST. `Tide` and `Notide` provide the value of each annual mean heat budget terms (Advection, Eddy, Mixing, Forcing) of the tidal and no-tide models.

### `Figure_2.mat`:
 
`Figure_2.mat` is the raw data to the time-series of eddy heat fluxes, diffusivity heat fluxes, vertical diffuisivity and mixed layer depths in Figure 2, respectively.
`eddy` (`eddy_nt`) and `mix` (`mix_nt`) are the monthly eddy and diffusive heat fluxes of tidal (no-tide) model from December to November. `MLD` and `Kv` are the monthly mixed layer depth and averaged mixed layer vertical diffisvity of the tidal model from December to November. `w_u` and `w_v` are the monthly wind velocity.

### `Figure_3.mat`:

Using this data file can reproduce the T-S diagram (Figure 3) in the paper. `T_10km`, `T_4km`, and `T_2km` represents the temprature of tidal model with 3 different resolution. `T_2km_nt` represents the temperature 2 km no-tide model. `T_ACCESS` and `T_CARS` represent the data of the access model and CARS climatology. Salinity is named in similar format.
CARS climatology can be accessed through link (http://www.marine.csiro.au/~dunn/cars2009/).

### `Figure_4.mat`:

`T26_N` and `T26_S` are the time-averaged temperature variability (◦C) at the mixed layer base during the Northwest (JFM) and Southeast (JAS) monsoons. 
`MLD_N` (`MLD_S`) and `T26_N` (`T26_S`) are the time-averaged mixed layer and isotherm 26 ◦C depths during the Northwest (Southeast) monsoon.

### `colormaps.mat`:

This file provides 4 colormaps used to make the figures.

## Code

### `Script_GRL.m`：

`Script_GRL.m` includes 4 parts which, in turn, provide the code to produce the 4 figures in the paper.
