
# VERDICT-AMICO
VERDICT-AMICO is an adaptation of the accelerated microstructure imaging via convex optimization (AMICO) framework to linearize the estimation of VERDICT parameters for the prostate gland. The details can be found here:
   ```
   VERDICT‐AMICO: Ultrafast fitting algorithm for non‐invasive prostate microstructure characterization
   Elisenda Bonet‐Carne, Edward Johnston, Alessandro Daducci, Joseph G. Jacobs, Alex Freeman, David Atkinson, David J. Hawkes, Shonit Punwani, Daniel C. Alexander, Eleftheria Panagiotaki
   NMR in Biomedicine 2019; 32:e4019. https://doi.org/10.1002/nbm.4019
 ```

# AMICO
 The original work developed by `Daducci et al.`. and the implementation of the linear framework for Accelerated Microstructure Imaging via Convex Optimization (AMICO) can be found here:
    ```
Accelerated Microstructure Imaging via Convex Optimization (AMICO) from diffusion MRI data
Alessandro Daducci, Erick Canales-Rodriguez, Hui Zhang, Tim Dyrby, Daniel Alexander, Jean-Philippe Thiran
NeuroImage 105, pp. 32-44 (2015)
    ```
# Matlab Installation
Adapted from the orignal AMICO README file:

## Download and install external software

- **CAMINO toolkit**. [Download](http://cmic.cs.ucl.ac.uk/camino//index.php?n=Main.Download) the software and follow the instructions provided [here](http://cmic.cs.ucl.ac.uk/camino//index.php?n=Main.Installation) to install it.  

- **SPArse Modeling Software (SPAMS)**. [Download](http://spams-devel.gforge.inria.fr/downloads.html) the software and follow the instructions provided [here](http://spams-devel.gforge.inria.fr/doc/html/doc_spams003.html) to install it.  

## Setup paths/variables in MATLAB

Add the folder containing the source code of AMICO to your `MATLAB PATH`.

Modify the content of  `launch_VERDICT_AMICOoriginal.m` to set the paths to your specific needs, as follows:

- `AMICO_code_path` : path to the folder containing the *MATLAB source code* of AMICO (this repository). E.g. `/home/user/AMICO/code/matlab`.

- `NODDI_path` : path to the folder containing the *source code* of the NODDI toolbox (in case you want to use NODDI, not needed for ActiveAx). E.g. `/home/user/NODDI_toolbox_v0.9`.

- `CAMINO_path` : path to the `bin` folder containing the *executables* of the Camino toolkit (in case you want to use ActiveAx, not needed for NODDI). E.g. `/home/user/camino/bin`.

- `SPAMS_path` : path to the folder containing the *source code* of the SPAMS Library. E.g. `/home/user/spams`.

- `AMICO_data_path` : path to the folder where you store all your datasets. E.g. `/home/user/AMICO/data`. Then, the software assumes the folder structure is the following:

    ```
    ├── data
        ├── Study_01                 --> all subjects acquired with protocol "Study_01"
            ├── Subject_01
            ├── Subject_02
            ├── ...
        ├── Study_02                 --> all subjects acquired with protocol "Study_02"
            ├── Subject_01
            ├── Subject_02
            ├── ...
        ├── ...
    ```
  This way, the kernels need to be computed only *once per each study*, i.e. same protocol (number of shells, b-values etc), and subsequently adapted to each subject (specific gradient directions) very efficiently.


# Getting started

You can use the data on the example_data folder to try that everything works fine. Just uncomment from `launch_VERDICT_AMICOoriginal.m`  the following:
    ```
        data_path_input='./example_data/';
        data_path_output='./example_data/output/';
        subject_name='test1';
        dwiFilename='VerdictVolume_Registered_test1.nii';
    ```
and run the code.
