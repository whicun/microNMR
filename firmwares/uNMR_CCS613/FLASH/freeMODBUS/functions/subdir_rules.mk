################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
freeMODBUS/functions/%.obj: ../freeMODBUS/functions/%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs920/ccs/tools/compiler/ti-cgt-c2000_18.12.3.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 -Ooff --include_path="/Applications/ti/ccs920/ccs/tools/compiler/ti-cgt-c2000_18.12.3.LTS/include" --include_path="/Users/ysong/ti_workspace_v9/uNMR_CCS613/DSP2833x/include" --include_path="/Users/ysong/ti_workspace_v9/uNMR_CCS613/DSP2833x_common/include" --include_path="/Users/ysong/ti_workspace_v9/uNMR_CCS613/freeMODBUS/include" --include_path="/Users/ysong/ti_workspace_v9/uNMR_CCS613/INCLUDE" --advice:performance=all -g --define=FLASH --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="freeMODBUS/functions/$(basename $(<F)).d_raw" --obj_directory="freeMODBUS/functions" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


