################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
DSP2833x_common/source/%.obj: ../DSP2833x_common/source/%.asm $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs920/ccs/tools/compiler/ti-cgt-c2000_18.12.3.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 -Ooff --include_path="/Applications/ti/ccs920/ccs/tools/compiler/ti-cgt-c2000_18.12.3.LTS/include" --include_path="/Users/ysong/ti_workspace_v9/uNMR_CCS613/INCLUDE" --include_path="/Users/ysong/ti_workspace_v9/uNMR_CCS613/DSP2833x/include" --include_path="/Users/ysong/ti_workspace_v9/uNMR_CCS613/DSP2833x_common/include" --include_path="/Users/ysong/ti_workspace_v9/uNMR_CCS613/freeMODBUS/include" --advice:performance=all -g --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="DSP2833x_common/source/$(basename $(<F)).d_raw" --obj_directory="DSP2833x_common/source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

DSP2833x_common/source/%.obj: ../DSP2833x_common/source/%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs920/ccs/tools/compiler/ti-cgt-c2000_18.12.3.LTS/bin/cl2000" -v28 -ml -mt --float_support=fpu32 -Ooff --include_path="/Applications/ti/ccs920/ccs/tools/compiler/ti-cgt-c2000_18.12.3.LTS/include" --include_path="/Users/ysong/ti_workspace_v9/uNMR_CCS613/INCLUDE" --include_path="/Users/ysong/ti_workspace_v9/uNMR_CCS613/DSP2833x/include" --include_path="/Users/ysong/ti_workspace_v9/uNMR_CCS613/DSP2833x_common/include" --include_path="/Users/ysong/ti_workspace_v9/uNMR_CCS613/freeMODBUS/include" --advice:performance=all -g --display_error_number --diag_warning=225 --diag_wrap=off --preproc_with_compile --preproc_dependency="DSP2833x_common/source/$(basename $(<F)).d_raw" --obj_directory="DSP2833x_common/source" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


