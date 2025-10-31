# Internal-tide-displacements-enhance-surface-interior-heat-exchange-in-the-Indonesian-Seas

This project provides the raw data and codes to reproduce the figures of a paper submitted to GRL The raw data are saved in Matlab data format. Plsese download all files into a folder and run the Script_GRL.m under MATLAB. The code and data to reproduce key results are shown below. Full model outputs are available upon request to the corresponding author.

## Raw Data

### `Figure_1.mat`:
 
`Figure_1.mat` is the raw data to produce the sea surface temperature (SST) of the region model (Figure 1a) and the bar plot of heat budget terms (Figure 1b). The `XC`, `YC` and `D` is the longitude, latitude and the bathymetry and `SST` is the SST. `Tide` and `Notide` provide the value of each annual mean heat budget terms (Advection, Eddy, Mixing, Forcing) of the tidal and no-tide models.

### `Figure_2.mat`:
 
`Figure_2.mat` is the raw data to the time-series of eddy heat fluxes, diffusivity heat fluxes, vertical diffuisivity and mixed layer depths in Figure 2, respectively.
`eddy` (`eddy_nt`) and `mix` (`mix_nt`) are the monthly eddy and diffusive heat fluxes of tidal (no-tide) model from December to November. `MLD` and `Kv` are the monthly mixed layer depth and averaged mixed layer vertical diffisvity of the tidal model from December to November. `w_u` and `w_v` are the monthly wind velocity.

### `Figure_3.mat`:

`Figure_3` provides the diagnosed tidal displacements and high-frequency (3 hourly) "virtual mooring" data in the regional model. 
`displacments` is the time-averaged tidal displacements at 100 m in the model.
`Kv_3h` and `T_3h` are the 3 hourly time-series of vertical diffusivity and temperature. 

### `Figure_4.mat`:

`Figure_4` is the raw data to make the Figure 4 in the paper.
`TV_N` and `TV_S` are the time-averaged temperature variability (◦C) at the mixed layer base during the Northwest (JFM) and Southeast (JAS) monsoons. 
`MLD_N` (`MLD_S`) and `T26_N` (`T26_S`) are the time-averaged mixed layer and isotherm 26 ◦C depths during the Northwest (Southeast) monsoon.
`san_eddy` and `ban_eddy` are the monthly-averaged eddy heat fluxes (TW) across the mixed layer base in the Sangihe Island Chain and the Banda Sea.
`san_MLD` (`ban_MLD`) and `san_T26` (`ban_T26`) are the monthly-averaged mixed layer and isotherm 26 ◦C depths in the Sangihe Island Chain (the Banda Sea).

### `colormaps.mat`:

This file provides 4 colormaps used to make the figures.

## Code

### `Script_GRL.m`：

`Script_GRL.m` includes 4 sections which provide the code to produce the 4 figures in the paper.
