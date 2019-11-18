function [ output_args ] = launch_VERDICT_AMICOoriginal(data_path_input,subject_name,dwiFilename,data_path_output)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
% example data used
% data_path_input='./example_data/';
% data_path_output='./example_data/output/';
% subject_name='test1';
% dwiFilename='VerdictVolume_Registered_test1.nii';



%% SETUP AMICO

    schemeFilename_path='./schemefiles/';
    shcemeFilename_name='NOptimisedV_IN.scheme';
    study_name='VERDICT-AMICOoriginal';
    model_name='VerdictProstate';

    global AMICO_code_path AMICO_data_path CAMINO_path CONFIG
    global niiSIGNAL niiMASK
    global KERNELS bMATRIX

% Path definition: adapt these to your needs, current paths are just to illustrate what goes there.
% ==========================================
    AMICO_code_path = '../Projects/XNAT-codes/AMICO/matlab';
    CAMINO_path     = '../Projects/codes/CaminoVERDICT/bin';
    SPAMS_path      = '../Projects/VERDICTprostate/codes/spams-matlab';
    AMICO_data_path = data_path_input;

    
    if ~isdeployed
        addpath( genpath(CAMINO_path) )
        addpath( fullfile(SPAMS_path,'build') )
        addpath( fullfile(AMICO_code_path,'kernels') )
        addpath( fullfile(AMICO_code_path,'models') )
        addpath( fullfile(AMICO_code_path,'optimization') )
        addpath( fullfile(AMICO_code_path,'other') )
        addpath( fullfile(AMICO_code_path,'vendor','NIFTI') )
    end


% Precompute Matrices
% ==========================================
    AMICO_PrecomputeRotationMatrices();

% Subject setup
% ==========================================

	CONFIG = [];

	CONFIG.protocol			= study_name;
	CONFIG.subject			= subject_name;

	CONFIG.DATA_path		= AMICO_data_path;
	CONFIG.dwiFilename		= fullfile( CONFIG.DATA_path, dwiFilename );
	CONFIG.maskFilename     = []; % now we are doning the analysis without any mask
	CONFIG.dim              = [];
	CONFIG.pixdim           = [];
    CONFIG.OUTPUT_path      = fullfile(data_path_output,'AMICO',model_name);

	CONFIG.schemeFilename	= fullfile(schemeFilename_path,shcemeFilename_name);
    
    CONFIG.scheme			= [];
    CONFIG.b0_thr           = 1;

	CONFIG.OPTIMIZATION     = [];


%% LAUNCH AMICO
%1. Original AMICO-VERDICT (k=18) but diving R,fIC and cell maps - Model: VerdictProstate_Rmaps

    AMICO_LoadData
    AMICO_SetModel( 'VerdictProstate',17);
    AMICO_GenerateKernels();
    AMICO_ResampleKernels();
    AMICO_Fit_xs(17+2); %the xs version has the b0 normalization correction


end

