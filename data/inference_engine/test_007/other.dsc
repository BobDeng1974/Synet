<?xml version="1.0" ?>
<net batch="1" name="ICV-RMNet-PD-ReID-Middle" version="4">
	<layers>
		<layer id="0" name="data" precision="FP32" type="Input">
			<output>
				<port id="0">
					<dim>1</dim>
					<dim>3</dim>
					<dim>160</dim>
					<dim>64</dim>
				</port>
			</output>
		</layer>
		<layer id="1" name="Mul_1954/Fused_Mul_/FusedScaleShift_" precision="FP32" type="ScaleShift">
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>3</dim>
					<dim>160</dim>
					<dim>64</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>3</dim>
					<dim>160</dim>
					<dim>64</dim>
				</port>
			</output>
			<blobs>
				<weights offset="0" size="12"/>
				<biases offset="12" size="12"/>
			</blobs>
		</layer>
		<layer id="2" name="init_block1/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="32" pads_begin="1,1" pads_end="1,1" strides="2,2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>3</dim>
					<dim>160</dim>
					<dim>64</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
			<blobs>
				<weights offset="24" size="3456"/>
				<biases offset="3480" size="128"/>
			</blobs>
		</layer>
		<layer id="3" name="init_block1/dim_inc/fn" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="4" name="bottleneck1_1/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="8" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3608" size="1024"/>
				<biases offset="4632" size="32"/>
			</blobs>
		</layer>
		<layer id="5" name="bottleneck1_1/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="6" name="bottleneck1_1/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="8" kernel="3,3" output="8" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4664" size="288"/>
				<biases offset="4952" size="32"/>
			</blobs>
		</layer>
		<layer id="7" name="bottleneck1_1/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="8" name="bottleneck1_1/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="32" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4984" size="1024"/>
				<biases offset="6008" size="128"/>
			</blobs>
		</layer>
		<layer id="9" name="bottleneck1_1/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="10" name="bottleneck1_1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="11" name="bottleneck1_2/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="8" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
			<blobs>
				<weights offset="6136" size="1024"/>
				<biases offset="7160" size="32"/>
			</blobs>
		</layer>
		<layer id="12" name="bottleneck1_2/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="13" name="bottleneck1_2/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="8" kernel="3,3" output="8" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
			<blobs>
				<weights offset="7192" size="288"/>
				<biases offset="7480" size="32"/>
			</blobs>
		</layer>
		<layer id="14" name="bottleneck1_2/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="15" name="bottleneck1_2/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="32" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
			<blobs>
				<weights offset="7512" size="1024"/>
				<biases offset="8536" size="128"/>
			</blobs>
		</layer>
		<layer id="16" name="bottleneck1_2/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="17" name="bottleneck1_2/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="18" name="bottleneck1_3/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="8" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
			<blobs>
				<weights offset="8664" size="1024"/>
				<biases offset="9688" size="32"/>
			</blobs>
		</layer>
		<layer id="19" name="bottleneck1_3/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="20" name="bottleneck1_3/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="8" kernel="3,3" output="8" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
			<blobs>
				<weights offset="9720" size="288"/>
				<biases offset="10008" size="32"/>
			</blobs>
		</layer>
		<layer id="21" name="bottleneck1_3/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="22" name="bottleneck1_3/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="32" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
			<blobs>
				<weights offset="10040" size="1024"/>
				<biases offset="11064" size="128"/>
			</blobs>
		</layer>
		<layer id="23" name="bottleneck1_3/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="24" name="bottleneck1_3/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="25" name="bottleneck1_4/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="8" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
			<blobs>
				<weights offset="11192" size="1024"/>
				<biases offset="12216" size="32"/>
			</blobs>
		</layer>
		<layer id="26" name="bottleneck1_4/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="27" name="bottleneck1_4/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="8" kernel="3,3" output="8" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
			<blobs>
				<weights offset="12248" size="288"/>
				<biases offset="12536" size="32"/>
			</blobs>
		</layer>
		<layer id="28" name="bottleneck1_4/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="29" name="bottleneck1_4/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="32" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
			<blobs>
				<weights offset="12568" size="1024"/>
				<biases offset="13592" size="128"/>
			</blobs>
		</layer>
		<layer id="30" name="bottleneck1_4/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="31" name="bottleneck1_4/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="32" name="bottleneck2_0/skip/pooling" precision="FP32" type="Pooling">
			<data exclude-pad="true" kernel="2,2" pads_begin="0,0" pads_end="0,0" pool-method="max" rounding_type="ceil" strides="2,2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="33" name="bottleneck2_0/skip/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="13720" size="8192"/>
				<biases offset="21912" size="256"/>
			</blobs>
		</layer>
		<layer id="34" name="bottleneck2_0/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="16" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
			<blobs>
				<weights offset="22168" size="2048"/>
				<biases offset="24216" size="64"/>
			</blobs>
		</layer>
		<layer id="35" name="bottleneck2_0/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="36" name="bottleneck2_0/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="16" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="2,2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>80</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="24280" size="576"/>
				<biases offset="24856" size="64"/>
			</blobs>
		</layer>
		<layer id="37" name="bottleneck2_0/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="38" name="bottleneck2_0/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="24920" size="4096"/>
				<biases offset="29016" size="256"/>
			</blobs>
		</layer>
		<layer id="39" name="bottleneck2_0/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="40" name="bottleneck2_0/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="41" name="bottleneck2_1/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="16" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="29272" size="4096"/>
				<biases offset="33368" size="64"/>
			</blobs>
		</layer>
		<layer id="42" name="bottleneck2_1/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="43" name="bottleneck2_1/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="16" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="33432" size="576"/>
				<biases offset="34008" size="64"/>
			</blobs>
		</layer>
		<layer id="44" name="bottleneck2_1/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="45" name="bottleneck2_1/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="34072" size="4096"/>
				<biases offset="38168" size="256"/>
			</blobs>
		</layer>
		<layer id="46" name="bottleneck2_1/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="47" name="bottleneck2_1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="48" name="bottleneck2_2/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="16" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="38424" size="4096"/>
				<biases offset="42520" size="64"/>
			</blobs>
		</layer>
		<layer id="49" name="bottleneck2_2/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="50" name="bottleneck2_2/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="16" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="42584" size="576"/>
				<biases offset="43160" size="64"/>
			</blobs>
		</layer>
		<layer id="51" name="bottleneck2_2/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="52" name="bottleneck2_2/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="43224" size="4096"/>
				<biases offset="47320" size="256"/>
			</blobs>
		</layer>
		<layer id="53" name="bottleneck2_2/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="54" name="bottleneck2_2/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="55" name="bottleneck2_3/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="16" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="47576" size="4096"/>
				<biases offset="51672" size="64"/>
			</blobs>
		</layer>
		<layer id="56" name="bottleneck2_3/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="57" name="bottleneck2_3/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="16" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="51736" size="576"/>
				<biases offset="52312" size="64"/>
			</blobs>
		</layer>
		<layer id="58" name="bottleneck2_3/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="59" name="bottleneck2_3/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="52376" size="4096"/>
				<biases offset="56472" size="256"/>
			</blobs>
		</layer>
		<layer id="60" name="bottleneck2_3/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="61" name="bottleneck2_3/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="62" name="bottleneck2_4/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="16" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="56728" size="4096"/>
				<biases offset="60824" size="64"/>
			</blobs>
		</layer>
		<layer id="63" name="bottleneck2_4/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="64" name="bottleneck2_4/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="16" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="60888" size="576"/>
				<biases offset="61464" size="64"/>
			</blobs>
		</layer>
		<layer id="65" name="bottleneck2_4/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="66" name="bottleneck2_4/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="61528" size="4096"/>
				<biases offset="65624" size="256"/>
			</blobs>
		</layer>
		<layer id="67" name="bottleneck2_4/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="68" name="bottleneck2_4/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="69" name="bottleneck2_5/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="16" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="65880" size="4096"/>
				<biases offset="69976" size="64"/>
			</blobs>
		</layer>
		<layer id="70" name="bottleneck2_5/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="71" name="bottleneck2_5/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="16" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="70040" size="576"/>
				<biases offset="70616" size="64"/>
			</blobs>
		</layer>
		<layer id="72" name="bottleneck2_5/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="73" name="bottleneck2_5/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="70680" size="4096"/>
				<biases offset="74776" size="256"/>
			</blobs>
		</layer>
		<layer id="74" name="bottleneck2_5/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="75" name="bottleneck2_5/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="76" name="bottleneck2_6/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="16" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="75032" size="4096"/>
				<biases offset="79128" size="64"/>
			</blobs>
		</layer>
		<layer id="77" name="bottleneck2_6/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="78" name="bottleneck2_6/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="16" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="79192" size="576"/>
				<biases offset="79768" size="64"/>
			</blobs>
		</layer>
		<layer id="79" name="bottleneck2_6/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="80" name="bottleneck2_6/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="79832" size="4096"/>
				<biases offset="83928" size="256"/>
			</blobs>
		</layer>
		<layer id="81" name="bottleneck2_6/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="82" name="bottleneck2_6/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="83" name="bottleneck2_7/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="16" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="84184" size="4096"/>
				<biases offset="88280" size="64"/>
			</blobs>
		</layer>
		<layer id="84" name="bottleneck2_7/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="85" name="bottleneck2_7/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="16" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="88344" size="576"/>
				<biases offset="88920" size="64"/>
			</blobs>
		</layer>
		<layer id="86" name="bottleneck2_7/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="87" name="bottleneck2_7/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="88984" size="4096"/>
				<biases offset="93080" size="256"/>
			</blobs>
		</layer>
		<layer id="88" name="bottleneck2_7/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="89" name="bottleneck2_7/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="90" name="bottleneck2_8/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="16" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="93336" size="4096"/>
				<biases offset="97432" size="64"/>
			</blobs>
		</layer>
		<layer id="91" name="bottleneck2_8/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="92" name="bottleneck2_8/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="16" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="97496" size="576"/>
				<biases offset="98072" size="64"/>
			</blobs>
		</layer>
		<layer id="93" name="bottleneck2_8/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="94" name="bottleneck2_8/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="98136" size="4096"/>
				<biases offset="102232" size="256"/>
			</blobs>
		</layer>
		<layer id="95" name="bottleneck2_8/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="96" name="bottleneck2_8/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="97" name="bottleneck3_0/skip/pooling" precision="FP32" type="Pooling">
			<data exclude-pad="true" kernel="2,2" pads_begin="0,0" pads_end="0,0" pool-method="max" rounding_type="ceil" strides="2,2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="98" name="bottleneck3_0/skip/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="128" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="102488" size="32768"/>
				<biases offset="135256" size="512"/>
			</blobs>
		</layer>
		<layer id="99" name="bottleneck3_0/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="32" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
			<blobs>
				<weights offset="135768" size="8192"/>
				<biases offset="143960" size="128"/>
			</blobs>
		</layer>
		<layer id="100" name="bottleneck3_0/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="101" name="bottleneck3_0/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="32" kernel="3,3" output="32" pads_begin="1,1" pads_end="1,1" strides="2,2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>40</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="144088" size="1152"/>
				<biases offset="145240" size="128"/>
			</blobs>
		</layer>
		<layer id="102" name="bottleneck3_0/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="103" name="bottleneck3_0/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="128" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="145368" size="16384"/>
				<biases offset="161752" size="512"/>
			</blobs>
		</layer>
		<layer id="104" name="bottleneck3_0/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="105" name="bottleneck3_0/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="106" name="bottleneck3_1/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="32" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="162264" size="16384"/>
				<biases offset="178648" size="128"/>
			</blobs>
		</layer>
		<layer id="107" name="bottleneck3_1/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="108" name="bottleneck3_1/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="32" kernel="3,3" output="32" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="178776" size="1152"/>
				<biases offset="179928" size="128"/>
			</blobs>
		</layer>
		<layer id="109" name="bottleneck3_1/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="110" name="bottleneck3_1/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="128" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="180056" size="16384"/>
				<biases offset="196440" size="512"/>
			</blobs>
		</layer>
		<layer id="111" name="bottleneck3_1/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="112" name="bottleneck3_1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="113" name="bottleneck3_2/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="32" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="196952" size="16384"/>
				<biases offset="213336" size="128"/>
			</blobs>
		</layer>
		<layer id="114" name="bottleneck3_2/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="115" name="bottleneck3_2/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="32" kernel="3,3" output="32" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="213464" size="1152"/>
				<biases offset="214616" size="128"/>
			</blobs>
		</layer>
		<layer id="116" name="bottleneck3_2/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="117" name="bottleneck3_2/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="128" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="214744" size="16384"/>
				<biases offset="231128" size="512"/>
			</blobs>
		</layer>
		<layer id="118" name="bottleneck3_2/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="119" name="bottleneck3_2/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="120" name="bottleneck3_3/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="32" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="231640" size="16384"/>
				<biases offset="248024" size="128"/>
			</blobs>
		</layer>
		<layer id="121" name="bottleneck3_3/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="122" name="bottleneck3_3/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="32" kernel="3,3" output="32" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="248152" size="1152"/>
				<biases offset="249304" size="128"/>
			</blobs>
		</layer>
		<layer id="123" name="bottleneck3_3/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="124" name="bottleneck3_3/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="128" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="249432" size="16384"/>
				<biases offset="265816" size="512"/>
			</blobs>
		</layer>
		<layer id="125" name="bottleneck3_3/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="126" name="bottleneck3_3/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="127" name="bottleneck3_4/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="32" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="266328" size="16384"/>
				<biases offset="282712" size="128"/>
			</blobs>
		</layer>
		<layer id="128" name="bottleneck3_4/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="129" name="bottleneck3_4/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="32" kernel="3,3" output="32" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="282840" size="1152"/>
				<biases offset="283992" size="128"/>
			</blobs>
		</layer>
		<layer id="130" name="bottleneck3_4/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="131" name="bottleneck3_4/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="128" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="284120" size="16384"/>
				<biases offset="300504" size="512"/>
			</blobs>
		</layer>
		<layer id="132" name="bottleneck3_4/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="133" name="bottleneck3_4/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="134" name="bottleneck3_5/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="32" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="301016" size="16384"/>
				<biases offset="317400" size="128"/>
			</blobs>
		</layer>
		<layer id="135" name="bottleneck3_5/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="136" name="bottleneck3_5/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="32" kernel="3,3" output="32" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="317528" size="1152"/>
				<biases offset="318680" size="128"/>
			</blobs>
		</layer>
		<layer id="137" name="bottleneck3_5/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="138" name="bottleneck3_5/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="128" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="318808" size="16384"/>
				<biases offset="335192" size="512"/>
			</blobs>
		</layer>
		<layer id="139" name="bottleneck3_5/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="140" name="bottleneck3_5/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="141" name="bottleneck3_6/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="32" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="335704" size="16384"/>
				<biases offset="352088" size="128"/>
			</blobs>
		</layer>
		<layer id="142" name="bottleneck3_6/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="143" name="bottleneck3_6/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="32" kernel="3,3" output="32" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="352216" size="1152"/>
				<biases offset="353368" size="128"/>
			</blobs>
		</layer>
		<layer id="144" name="bottleneck3_6/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="145" name="bottleneck3_6/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="128" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="353496" size="16384"/>
				<biases offset="369880" size="512"/>
			</blobs>
		</layer>
		<layer id="146" name="bottleneck3_6/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="147" name="bottleneck3_6/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="148" name="bottleneck3_7/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="32" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="370392" size="16384"/>
				<biases offset="386776" size="128"/>
			</blobs>
		</layer>
		<layer id="149" name="bottleneck3_7/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="150" name="bottleneck3_7/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="32" kernel="3,3" output="32" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="386904" size="1152"/>
				<biases offset="388056" size="128"/>
			</blobs>
		</layer>
		<layer id="151" name="bottleneck3_7/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="152" name="bottleneck3_7/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="128" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="388184" size="16384"/>
				<biases offset="404568" size="512"/>
			</blobs>
		</layer>
		<layer id="153" name="bottleneck3_7/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="154" name="bottleneck3_7/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="155" name="bottleneck3_8/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="32" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="405080" size="16384"/>
				<biases offset="421464" size="128"/>
			</blobs>
		</layer>
		<layer id="156" name="bottleneck3_8/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="157" name="bottleneck3_8/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="32" kernel="3,3" output="32" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="421592" size="1152"/>
				<biases offset="422744" size="128"/>
			</blobs>
		</layer>
		<layer id="158" name="bottleneck3_8/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="159" name="bottleneck3_8/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="128" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="422872" size="16384"/>
				<biases offset="439256" size="512"/>
			</blobs>
		</layer>
		<layer id="160" name="bottleneck3_8/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="161" name="bottleneck3_8/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="162" name="bottleneck3_9/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="32" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="439768" size="16384"/>
				<biases offset="456152" size="128"/>
			</blobs>
		</layer>
		<layer id="163" name="bottleneck3_9/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="164" name="bottleneck3_9/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="32" kernel="3,3" output="32" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="456280" size="1152"/>
				<biases offset="457432" size="128"/>
			</blobs>
		</layer>
		<layer id="165" name="bottleneck3_9/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="166" name="bottleneck3_9/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="128" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="457560" size="16384"/>
				<biases offset="473944" size="512"/>
			</blobs>
		</layer>
		<layer id="167" name="bottleneck3_9/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="168" name="bottleneck3_9/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="169" name="bottleneck3_10/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="32" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="474456" size="16384"/>
				<biases offset="490840" size="128"/>
			</blobs>
		</layer>
		<layer id="170" name="bottleneck3_10/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="171" name="bottleneck3_10/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="32" kernel="3,3" output="32" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="490968" size="1152"/>
				<biases offset="492120" size="128"/>
			</blobs>
		</layer>
		<layer id="172" name="bottleneck3_10/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="173" name="bottleneck3_10/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="128" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>32</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="492248" size="16384"/>
				<biases offset="508632" size="512"/>
			</blobs>
		</layer>
		<layer id="174" name="bottleneck3_10/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="175" name="bottleneck3_10/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="176" name="bottleneck4_0/skip/pooling" precision="FP32" type="Pooling">
			<data exclude-pad="true" kernel="2,2" pads_begin="0,0" pads_end="0,0" pool-method="max" rounding_type="ceil" strides="2,2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="177" name="bottleneck4_0/skip/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="256" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="509144" size="131072"/>
				<biases offset="640216" size="1024"/>
			</blobs>
		</layer>
		<layer id="178" name="bottleneck4_0/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
			<blobs>
				<weights offset="641240" size="32768"/>
				<biases offset="674008" size="256"/>
			</blobs>
		</layer>
		<layer id="179" name="bottleneck4_0/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="180" name="bottleneck4_0/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="64" kernel="3,3" output="64" pads_begin="1,1" pads_end="1,1" strides="2,2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>20</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="674264" size="2304"/>
				<biases offset="676568" size="256"/>
			</blobs>
		</layer>
		<layer id="181" name="bottleneck4_0/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="182" name="bottleneck4_0/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="256" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="676824" size="65536"/>
				<biases offset="742360" size="1024"/>
			</blobs>
		</layer>
		<layer id="183" name="bottleneck4_0/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="184" name="bottleneck4_0/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="185" name="bottleneck4_1/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="743384" size="65536"/>
				<biases offset="808920" size="256"/>
			</blobs>
		</layer>
		<layer id="186" name="bottleneck4_1/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="187" name="bottleneck4_1/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="64" kernel="3,3" output="64" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="809176" size="2304"/>
				<biases offset="811480" size="256"/>
			</blobs>
		</layer>
		<layer id="188" name="bottleneck4_1/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="189" name="bottleneck4_1/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="256" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="811736" size="65536"/>
				<biases offset="877272" size="1024"/>
			</blobs>
		</layer>
		<layer id="190" name="bottleneck4_1/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="191" name="bottleneck4_1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="192" name="bottleneck4_2/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="878296" size="65536"/>
				<biases offset="943832" size="256"/>
			</blobs>
		</layer>
		<layer id="193" name="bottleneck4_2/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="194" name="bottleneck4_2/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="64" kernel="3,3" output="64" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="944088" size="2304"/>
				<biases offset="946392" size="256"/>
			</blobs>
		</layer>
		<layer id="195" name="bottleneck4_2/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="196" name="bottleneck4_2/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="256" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="946648" size="65536"/>
				<biases offset="1012184" size="1024"/>
			</blobs>
		</layer>
		<layer id="197" name="bottleneck4_2/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="198" name="bottleneck4_2/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="199" name="bottleneck4_3/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1013208" size="65536"/>
				<biases offset="1078744" size="256"/>
			</blobs>
		</layer>
		<layer id="200" name="bottleneck4_3/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="201" name="bottleneck4_3/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="64" kernel="3,3" output="64" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1079000" size="2304"/>
				<biases offset="1081304" size="256"/>
			</blobs>
		</layer>
		<layer id="202" name="bottleneck4_3/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="203" name="bottleneck4_3/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="256" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1081560" size="65536"/>
				<biases offset="1147096" size="1024"/>
			</blobs>
		</layer>
		<layer id="204" name="bottleneck4_3/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="205" name="bottleneck4_3/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="206" name="bottleneck4_4/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1148120" size="65536"/>
				<biases offset="1213656" size="256"/>
			</blobs>
		</layer>
		<layer id="207" name="bottleneck4_4/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="208" name="bottleneck4_4/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="64" kernel="3,3" output="64" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1213912" size="2304"/>
				<biases offset="1216216" size="256"/>
			</blobs>
		</layer>
		<layer id="209" name="bottleneck4_4/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="210" name="bottleneck4_4/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="256" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1216472" size="65536"/>
				<biases offset="1282008" size="1024"/>
			</blobs>
		</layer>
		<layer id="211" name="bottleneck4_4/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="212" name="bottleneck4_4/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="213" name="bottleneck4_5/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1283032" size="65536"/>
				<biases offset="1348568" size="256"/>
			</blobs>
		</layer>
		<layer id="214" name="bottleneck4_5/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="215" name="bottleneck4_5/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="64" kernel="3,3" output="64" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1348824" size="2304"/>
				<biases offset="1351128" size="256"/>
			</blobs>
		</layer>
		<layer id="216" name="bottleneck4_5/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="217" name="bottleneck4_5/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="256" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1351384" size="65536"/>
				<biases offset="1416920" size="1024"/>
			</blobs>
		</layer>
		<layer id="218" name="bottleneck4_5/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="219" name="bottleneck4_5/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="220" name="bottleneck4_6/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1417944" size="65536"/>
				<biases offset="1483480" size="256"/>
			</blobs>
		</layer>
		<layer id="221" name="bottleneck4_6/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="222" name="bottleneck4_6/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="64" kernel="3,3" output="64" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1483736" size="2304"/>
				<biases offset="1486040" size="256"/>
			</blobs>
		</layer>
		<layer id="223" name="bottleneck4_6/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="224" name="bottleneck4_6/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="256" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1486296" size="65536"/>
				<biases offset="1551832" size="1024"/>
			</blobs>
		</layer>
		<layer id="225" name="bottleneck4_6/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="226" name="bottleneck4_6/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="227" name="bottleneck4_7/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1552856" size="65536"/>
				<biases offset="1618392" size="256"/>
			</blobs>
		</layer>
		<layer id="228" name="bottleneck4_7/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="229" name="bottleneck4_7/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="64" kernel="3,3" output="64" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1618648" size="2304"/>
				<biases offset="1620952" size="256"/>
			</blobs>
		</layer>
		<layer id="230" name="bottleneck4_7/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="231" name="bottleneck4_7/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="256" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1621208" size="65536"/>
				<biases offset="1686744" size="1024"/>
			</blobs>
		</layer>
		<layer id="232" name="bottleneck4_7/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="233" name="bottleneck4_7/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="234" name="bottleneck4_8/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1687768" size="65536"/>
				<biases offset="1753304" size="256"/>
			</blobs>
		</layer>
		<layer id="235" name="bottleneck4_8/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="236" name="bottleneck4_8/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="64" kernel="3,3" output="64" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1753560" size="2304"/>
				<biases offset="1755864" size="256"/>
			</blobs>
		</layer>
		<layer id="237" name="bottleneck4_8/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="238" name="bottleneck4_8/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="256" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1756120" size="65536"/>
				<biases offset="1821656" size="1024"/>
			</blobs>
		</layer>
		<layer id="239" name="bottleneck4_8/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="240" name="bottleneck4_8/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="241" name="bottleneck4_9/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1822680" size="65536"/>
				<biases offset="1888216" size="256"/>
			</blobs>
		</layer>
		<layer id="242" name="bottleneck4_9/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="243" name="bottleneck4_9/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="64" kernel="3,3" output="64" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1888472" size="2304"/>
				<biases offset="1890776" size="256"/>
			</blobs>
		</layer>
		<layer id="244" name="bottleneck4_9/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="245" name="bottleneck4_9/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="256" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1891032" size="65536"/>
				<biases offset="1956568" size="1024"/>
			</blobs>
		</layer>
		<layer id="246" name="bottleneck4_9/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="247" name="bottleneck4_9/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="248" name="bottleneck4_10/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1957592" size="65536"/>
				<biases offset="2023128" size="256"/>
			</blobs>
		</layer>
		<layer id="249" name="bottleneck4_10/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="250" name="bottleneck4_10/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="64" kernel="3,3" output="64" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2023384" size="2304"/>
				<biases offset="2025688" size="256"/>
			</blobs>
		</layer>
		<layer id="251" name="bottleneck4_10/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="252" name="bottleneck4_10/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="256" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2025944" size="65536"/>
				<biases offset="2091480" size="1024"/>
			</blobs>
		</layer>
		<layer id="253" name="bottleneck4_10/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="254" name="bottleneck4_10/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="255" name="bottleneck4_11/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2092504" size="65536"/>
				<biases offset="2158040" size="256"/>
			</blobs>
		</layer>
		<layer id="256" name="bottleneck4_11/dim_red/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="257" name="bottleneck4_11/inner/dw1/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="64" kernel="3,3" output="64" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2158296" size="2304"/>
				<biases offset="2160600" size="256"/>
			</blobs>
		</layer>
		<layer id="258" name="bottleneck4_11/inner/dw1/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="259" name="bottleneck4_11/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="256" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2160856" size="65536"/>
				<biases offset="2226392" size="1024"/>
			</blobs>
		</layer>
		<layer id="260" name="bottleneck4_11/add" precision="FP32" type="Eltwise">
			<data coeff="" operation="sum"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="261" name="bottleneck4_11/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</output>
		</layer>
		<layer id="262" name="pooling/out" precision="FP32" type="Pooling">
			<data exclude-pad="true" kernel="10,4" pads_begin="0,0" pads_end="0,0" pool-method="max" rounding_type="ceil" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>10</dim>
					<dim>4</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>256</dim>
					<dim>1</dim>
					<dim>1</dim>
				</port>
			</output>
		</layer>
		<layer id="263" name="embd/dim_inc/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="512" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>256</dim>
					<dim>1</dim>
					<dim>1</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>512</dim>
					<dim>1</dim>
					<dim>1</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2227416" size="524288"/>
				<biases offset="2751704" size="2048"/>
			</blobs>
		</layer>
		<layer id="264" name="embd/dim_inc/fn" precision="FP32" type="Activation">
			<data alpha="1.0" type="elu"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>512</dim>
					<dim>1</dim>
					<dim>1</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>512</dim>
					<dim>1</dim>
					<dim>1</dim>
				</port>
			</output>
		</layer>
		<layer id="265" name="embd/dim_red/conv" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="256" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>512</dim>
					<dim>1</dim>
					<dim>1</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>256</dim>
					<dim>1</dim>
					<dim>1</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2753752" size="524288"/>
				<biases offset="3278040" size="1024"/>
			</blobs>
		</layer>
	</layers>
	<edges>
		<edge from-layer="0" from-port="0" to-layer="1" to-port="0"/>
		<edge from-layer="1" from-port="3" to-layer="2" to-port="0"/>
		<edge from-layer="2" from-port="3" to-layer="3" to-port="0"/>
		<edge from-layer="3" from-port="1" to-layer="4" to-port="0"/>
		<edge from-layer="4" from-port="3" to-layer="5" to-port="0"/>
		<edge from-layer="5" from-port="1" to-layer="6" to-port="0"/>
		<edge from-layer="6" from-port="3" to-layer="7" to-port="0"/>
		<edge from-layer="7" from-port="1" to-layer="8" to-port="0"/>
		<edge from-layer="3" from-port="1" to-layer="9" to-port="0"/>
		<edge from-layer="8" from-port="3" to-layer="9" to-port="1"/>
		<edge from-layer="9" from-port="2" to-layer="10" to-port="0"/>
		<edge from-layer="10" from-port="1" to-layer="11" to-port="0"/>
		<edge from-layer="11" from-port="3" to-layer="12" to-port="0"/>
		<edge from-layer="12" from-port="1" to-layer="13" to-port="0"/>
		<edge from-layer="13" from-port="3" to-layer="14" to-port="0"/>
		<edge from-layer="14" from-port="1" to-layer="15" to-port="0"/>
		<edge from-layer="10" from-port="1" to-layer="16" to-port="0"/>
		<edge from-layer="15" from-port="3" to-layer="16" to-port="1"/>
		<edge from-layer="16" from-port="2" to-layer="17" to-port="0"/>
		<edge from-layer="17" from-port="1" to-layer="18" to-port="0"/>
		<edge from-layer="18" from-port="3" to-layer="19" to-port="0"/>
		<edge from-layer="19" from-port="1" to-layer="20" to-port="0"/>
		<edge from-layer="20" from-port="3" to-layer="21" to-port="0"/>
		<edge from-layer="21" from-port="1" to-layer="22" to-port="0"/>
		<edge from-layer="17" from-port="1" to-layer="23" to-port="0"/>
		<edge from-layer="22" from-port="3" to-layer="23" to-port="1"/>
		<edge from-layer="23" from-port="2" to-layer="24" to-port="0"/>
		<edge from-layer="24" from-port="1" to-layer="25" to-port="0"/>
		<edge from-layer="25" from-port="3" to-layer="26" to-port="0"/>
		<edge from-layer="26" from-port="1" to-layer="27" to-port="0"/>
		<edge from-layer="27" from-port="3" to-layer="28" to-port="0"/>
		<edge from-layer="28" from-port="1" to-layer="29" to-port="0"/>
		<edge from-layer="24" from-port="1" to-layer="30" to-port="0"/>
		<edge from-layer="29" from-port="3" to-layer="30" to-port="1"/>
		<edge from-layer="30" from-port="2" to-layer="31" to-port="0"/>
		<edge from-layer="31" from-port="1" to-layer="32" to-port="0"/>
		<edge from-layer="32" from-port="1" to-layer="33" to-port="0"/>
		<edge from-layer="31" from-port="1" to-layer="34" to-port="0"/>
		<edge from-layer="34" from-port="3" to-layer="35" to-port="0"/>
		<edge from-layer="35" from-port="1" to-layer="36" to-port="0"/>
		<edge from-layer="36" from-port="3" to-layer="37" to-port="0"/>
		<edge from-layer="37" from-port="1" to-layer="38" to-port="0"/>
		<edge from-layer="33" from-port="3" to-layer="39" to-port="0"/>
		<edge from-layer="38" from-port="3" to-layer="39" to-port="1"/>
		<edge from-layer="39" from-port="2" to-layer="40" to-port="0"/>
		<edge from-layer="40" from-port="1" to-layer="41" to-port="0"/>
		<edge from-layer="41" from-port="3" to-layer="42" to-port="0"/>
		<edge from-layer="42" from-port="1" to-layer="43" to-port="0"/>
		<edge from-layer="43" from-port="3" to-layer="44" to-port="0"/>
		<edge from-layer="44" from-port="1" to-layer="45" to-port="0"/>
		<edge from-layer="40" from-port="1" to-layer="46" to-port="0"/>
		<edge from-layer="45" from-port="3" to-layer="46" to-port="1"/>
		<edge from-layer="46" from-port="2" to-layer="47" to-port="0"/>
		<edge from-layer="47" from-port="1" to-layer="48" to-port="0"/>
		<edge from-layer="48" from-port="3" to-layer="49" to-port="0"/>
		<edge from-layer="49" from-port="1" to-layer="50" to-port="0"/>
		<edge from-layer="50" from-port="3" to-layer="51" to-port="0"/>
		<edge from-layer="51" from-port="1" to-layer="52" to-port="0"/>
		<edge from-layer="47" from-port="1" to-layer="53" to-port="0"/>
		<edge from-layer="52" from-port="3" to-layer="53" to-port="1"/>
		<edge from-layer="53" from-port="2" to-layer="54" to-port="0"/>
		<edge from-layer="54" from-port="1" to-layer="55" to-port="0"/>
		<edge from-layer="55" from-port="3" to-layer="56" to-port="0"/>
		<edge from-layer="56" from-port="1" to-layer="57" to-port="0"/>
		<edge from-layer="57" from-port="3" to-layer="58" to-port="0"/>
		<edge from-layer="58" from-port="1" to-layer="59" to-port="0"/>
		<edge from-layer="54" from-port="1" to-layer="60" to-port="0"/>
		<edge from-layer="59" from-port="3" to-layer="60" to-port="1"/>
		<edge from-layer="60" from-port="2" to-layer="61" to-port="0"/>
		<edge from-layer="61" from-port="1" to-layer="62" to-port="0"/>
		<edge from-layer="62" from-port="3" to-layer="63" to-port="0"/>
		<edge from-layer="63" from-port="1" to-layer="64" to-port="0"/>
		<edge from-layer="64" from-port="3" to-layer="65" to-port="0"/>
		<edge from-layer="65" from-port="1" to-layer="66" to-port="0"/>
		<edge from-layer="61" from-port="1" to-layer="67" to-port="0"/>
		<edge from-layer="66" from-port="3" to-layer="67" to-port="1"/>
		<edge from-layer="67" from-port="2" to-layer="68" to-port="0"/>
		<edge from-layer="68" from-port="1" to-layer="69" to-port="0"/>
		<edge from-layer="69" from-port="3" to-layer="70" to-port="0"/>
		<edge from-layer="70" from-port="1" to-layer="71" to-port="0"/>
		<edge from-layer="71" from-port="3" to-layer="72" to-port="0"/>
		<edge from-layer="72" from-port="1" to-layer="73" to-port="0"/>
		<edge from-layer="68" from-port="1" to-layer="74" to-port="0"/>
		<edge from-layer="73" from-port="3" to-layer="74" to-port="1"/>
		<edge from-layer="74" from-port="2" to-layer="75" to-port="0"/>
		<edge from-layer="75" from-port="1" to-layer="76" to-port="0"/>
		<edge from-layer="76" from-port="3" to-layer="77" to-port="0"/>
		<edge from-layer="77" from-port="1" to-layer="78" to-port="0"/>
		<edge from-layer="78" from-port="3" to-layer="79" to-port="0"/>
		<edge from-layer="79" from-port="1" to-layer="80" to-port="0"/>
		<edge from-layer="75" from-port="1" to-layer="81" to-port="0"/>
		<edge from-layer="80" from-port="3" to-layer="81" to-port="1"/>
		<edge from-layer="81" from-port="2" to-layer="82" to-port="0"/>
		<edge from-layer="82" from-port="1" to-layer="83" to-port="0"/>
		<edge from-layer="83" from-port="3" to-layer="84" to-port="0"/>
		<edge from-layer="84" from-port="1" to-layer="85" to-port="0"/>
		<edge from-layer="85" from-port="3" to-layer="86" to-port="0"/>
		<edge from-layer="86" from-port="1" to-layer="87" to-port="0"/>
		<edge from-layer="82" from-port="1" to-layer="88" to-port="0"/>
		<edge from-layer="87" from-port="3" to-layer="88" to-port="1"/>
		<edge from-layer="88" from-port="2" to-layer="89" to-port="0"/>
		<edge from-layer="89" from-port="1" to-layer="90" to-port="0"/>
		<edge from-layer="90" from-port="3" to-layer="91" to-port="0"/>
		<edge from-layer="91" from-port="1" to-layer="92" to-port="0"/>
		<edge from-layer="92" from-port="3" to-layer="93" to-port="0"/>
		<edge from-layer="93" from-port="1" to-layer="94" to-port="0"/>
		<edge from-layer="89" from-port="1" to-layer="95" to-port="0"/>
		<edge from-layer="94" from-port="3" to-layer="95" to-port="1"/>
		<edge from-layer="95" from-port="2" to-layer="96" to-port="0"/>
		<edge from-layer="96" from-port="1" to-layer="97" to-port="0"/>
		<edge from-layer="97" from-port="1" to-layer="98" to-port="0"/>
		<edge from-layer="96" from-port="1" to-layer="99" to-port="0"/>
		<edge from-layer="99" from-port="3" to-layer="100" to-port="0"/>
		<edge from-layer="100" from-port="1" to-layer="101" to-port="0"/>
		<edge from-layer="101" from-port="3" to-layer="102" to-port="0"/>
		<edge from-layer="102" from-port="1" to-layer="103" to-port="0"/>
		<edge from-layer="98" from-port="3" to-layer="104" to-port="0"/>
		<edge from-layer="103" from-port="3" to-layer="104" to-port="1"/>
		<edge from-layer="104" from-port="2" to-layer="105" to-port="0"/>
		<edge from-layer="105" from-port="1" to-layer="106" to-port="0"/>
		<edge from-layer="106" from-port="3" to-layer="107" to-port="0"/>
		<edge from-layer="107" from-port="1" to-layer="108" to-port="0"/>
		<edge from-layer="108" from-port="3" to-layer="109" to-port="0"/>
		<edge from-layer="109" from-port="1" to-layer="110" to-port="0"/>
		<edge from-layer="105" from-port="1" to-layer="111" to-port="0"/>
		<edge from-layer="110" from-port="3" to-layer="111" to-port="1"/>
		<edge from-layer="111" from-port="2" to-layer="112" to-port="0"/>
		<edge from-layer="112" from-port="1" to-layer="113" to-port="0"/>
		<edge from-layer="113" from-port="3" to-layer="114" to-port="0"/>
		<edge from-layer="114" from-port="1" to-layer="115" to-port="0"/>
		<edge from-layer="115" from-port="3" to-layer="116" to-port="0"/>
		<edge from-layer="116" from-port="1" to-layer="117" to-port="0"/>
		<edge from-layer="112" from-port="1" to-layer="118" to-port="0"/>
		<edge from-layer="117" from-port="3" to-layer="118" to-port="1"/>
		<edge from-layer="118" from-port="2" to-layer="119" to-port="0"/>
		<edge from-layer="119" from-port="1" to-layer="120" to-port="0"/>
		<edge from-layer="120" from-port="3" to-layer="121" to-port="0"/>
		<edge from-layer="121" from-port="1" to-layer="122" to-port="0"/>
		<edge from-layer="122" from-port="3" to-layer="123" to-port="0"/>
		<edge from-layer="123" from-port="1" to-layer="124" to-port="0"/>
		<edge from-layer="119" from-port="1" to-layer="125" to-port="0"/>
		<edge from-layer="124" from-port="3" to-layer="125" to-port="1"/>
		<edge from-layer="125" from-port="2" to-layer="126" to-port="0"/>
		<edge from-layer="126" from-port="1" to-layer="127" to-port="0"/>
		<edge from-layer="127" from-port="3" to-layer="128" to-port="0"/>
		<edge from-layer="128" from-port="1" to-layer="129" to-port="0"/>
		<edge from-layer="129" from-port="3" to-layer="130" to-port="0"/>
		<edge from-layer="130" from-port="1" to-layer="131" to-port="0"/>
		<edge from-layer="126" from-port="1" to-layer="132" to-port="0"/>
		<edge from-layer="131" from-port="3" to-layer="132" to-port="1"/>
		<edge from-layer="132" from-port="2" to-layer="133" to-port="0"/>
		<edge from-layer="133" from-port="1" to-layer="134" to-port="0"/>
		<edge from-layer="134" from-port="3" to-layer="135" to-port="0"/>
		<edge from-layer="135" from-port="1" to-layer="136" to-port="0"/>
		<edge from-layer="136" from-port="3" to-layer="137" to-port="0"/>
		<edge from-layer="137" from-port="1" to-layer="138" to-port="0"/>
		<edge from-layer="133" from-port="1" to-layer="139" to-port="0"/>
		<edge from-layer="138" from-port="3" to-layer="139" to-port="1"/>
		<edge from-layer="139" from-port="2" to-layer="140" to-port="0"/>
		<edge from-layer="140" from-port="1" to-layer="141" to-port="0"/>
		<edge from-layer="141" from-port="3" to-layer="142" to-port="0"/>
		<edge from-layer="142" from-port="1" to-layer="143" to-port="0"/>
		<edge from-layer="143" from-port="3" to-layer="144" to-port="0"/>
		<edge from-layer="144" from-port="1" to-layer="145" to-port="0"/>
		<edge from-layer="140" from-port="1" to-layer="146" to-port="0"/>
		<edge from-layer="145" from-port="3" to-layer="146" to-port="1"/>
		<edge from-layer="146" from-port="2" to-layer="147" to-port="0"/>
		<edge from-layer="147" from-port="1" to-layer="148" to-port="0"/>
		<edge from-layer="148" from-port="3" to-layer="149" to-port="0"/>
		<edge from-layer="149" from-port="1" to-layer="150" to-port="0"/>
		<edge from-layer="150" from-port="3" to-layer="151" to-port="0"/>
		<edge from-layer="151" from-port="1" to-layer="152" to-port="0"/>
		<edge from-layer="147" from-port="1" to-layer="153" to-port="0"/>
		<edge from-layer="152" from-port="3" to-layer="153" to-port="1"/>
		<edge from-layer="153" from-port="2" to-layer="154" to-port="0"/>
		<edge from-layer="154" from-port="1" to-layer="155" to-port="0"/>
		<edge from-layer="155" from-port="3" to-layer="156" to-port="0"/>
		<edge from-layer="156" from-port="1" to-layer="157" to-port="0"/>
		<edge from-layer="157" from-port="3" to-layer="158" to-port="0"/>
		<edge from-layer="158" from-port="1" to-layer="159" to-port="0"/>
		<edge from-layer="154" from-port="1" to-layer="160" to-port="0"/>
		<edge from-layer="159" from-port="3" to-layer="160" to-port="1"/>
		<edge from-layer="160" from-port="2" to-layer="161" to-port="0"/>
		<edge from-layer="161" from-port="1" to-layer="162" to-port="0"/>
		<edge from-layer="162" from-port="3" to-layer="163" to-port="0"/>
		<edge from-layer="163" from-port="1" to-layer="164" to-port="0"/>
		<edge from-layer="164" from-port="3" to-layer="165" to-port="0"/>
		<edge from-layer="165" from-port="1" to-layer="166" to-port="0"/>
		<edge from-layer="161" from-port="1" to-layer="167" to-port="0"/>
		<edge from-layer="166" from-port="3" to-layer="167" to-port="1"/>
		<edge from-layer="167" from-port="2" to-layer="168" to-port="0"/>
		<edge from-layer="168" from-port="1" to-layer="169" to-port="0"/>
		<edge from-layer="169" from-port="3" to-layer="170" to-port="0"/>
		<edge from-layer="170" from-port="1" to-layer="171" to-port="0"/>
		<edge from-layer="171" from-port="3" to-layer="172" to-port="0"/>
		<edge from-layer="172" from-port="1" to-layer="173" to-port="0"/>
		<edge from-layer="168" from-port="1" to-layer="174" to-port="0"/>
		<edge from-layer="173" from-port="3" to-layer="174" to-port="1"/>
		<edge from-layer="174" from-port="2" to-layer="175" to-port="0"/>
		<edge from-layer="175" from-port="1" to-layer="176" to-port="0"/>
		<edge from-layer="176" from-port="1" to-layer="177" to-port="0"/>
		<edge from-layer="175" from-port="1" to-layer="178" to-port="0"/>
		<edge from-layer="178" from-port="3" to-layer="179" to-port="0"/>
		<edge from-layer="179" from-port="1" to-layer="180" to-port="0"/>
		<edge from-layer="180" from-port="3" to-layer="181" to-port="0"/>
		<edge from-layer="181" from-port="1" to-layer="182" to-port="0"/>
		<edge from-layer="177" from-port="3" to-layer="183" to-port="0"/>
		<edge from-layer="182" from-port="3" to-layer="183" to-port="1"/>
		<edge from-layer="183" from-port="2" to-layer="184" to-port="0"/>
		<edge from-layer="184" from-port="1" to-layer="185" to-port="0"/>
		<edge from-layer="185" from-port="3" to-layer="186" to-port="0"/>
		<edge from-layer="186" from-port="1" to-layer="187" to-port="0"/>
		<edge from-layer="187" from-port="3" to-layer="188" to-port="0"/>
		<edge from-layer="188" from-port="1" to-layer="189" to-port="0"/>
		<edge from-layer="184" from-port="1" to-layer="190" to-port="0"/>
		<edge from-layer="189" from-port="3" to-layer="190" to-port="1"/>
		<edge from-layer="190" from-port="2" to-layer="191" to-port="0"/>
		<edge from-layer="191" from-port="1" to-layer="192" to-port="0"/>
		<edge from-layer="192" from-port="3" to-layer="193" to-port="0"/>
		<edge from-layer="193" from-port="1" to-layer="194" to-port="0"/>
		<edge from-layer="194" from-port="3" to-layer="195" to-port="0"/>
		<edge from-layer="195" from-port="1" to-layer="196" to-port="0"/>
		<edge from-layer="191" from-port="1" to-layer="197" to-port="0"/>
		<edge from-layer="196" from-port="3" to-layer="197" to-port="1"/>
		<edge from-layer="197" from-port="2" to-layer="198" to-port="0"/>
		<edge from-layer="198" from-port="1" to-layer="199" to-port="0"/>
		<edge from-layer="199" from-port="3" to-layer="200" to-port="0"/>
		<edge from-layer="200" from-port="1" to-layer="201" to-port="0"/>
		<edge from-layer="201" from-port="3" to-layer="202" to-port="0"/>
		<edge from-layer="202" from-port="1" to-layer="203" to-port="0"/>
		<edge from-layer="198" from-port="1" to-layer="204" to-port="0"/>
		<edge from-layer="203" from-port="3" to-layer="204" to-port="1"/>
		<edge from-layer="204" from-port="2" to-layer="205" to-port="0"/>
		<edge from-layer="205" from-port="1" to-layer="206" to-port="0"/>
		<edge from-layer="206" from-port="3" to-layer="207" to-port="0"/>
		<edge from-layer="207" from-port="1" to-layer="208" to-port="0"/>
		<edge from-layer="208" from-port="3" to-layer="209" to-port="0"/>
		<edge from-layer="209" from-port="1" to-layer="210" to-port="0"/>
		<edge from-layer="205" from-port="1" to-layer="211" to-port="0"/>
		<edge from-layer="210" from-port="3" to-layer="211" to-port="1"/>
		<edge from-layer="211" from-port="2" to-layer="212" to-port="0"/>
		<edge from-layer="212" from-port="1" to-layer="213" to-port="0"/>
		<edge from-layer="213" from-port="3" to-layer="214" to-port="0"/>
		<edge from-layer="214" from-port="1" to-layer="215" to-port="0"/>
		<edge from-layer="215" from-port="3" to-layer="216" to-port="0"/>
		<edge from-layer="216" from-port="1" to-layer="217" to-port="0"/>
		<edge from-layer="212" from-port="1" to-layer="218" to-port="0"/>
		<edge from-layer="217" from-port="3" to-layer="218" to-port="1"/>
		<edge from-layer="218" from-port="2" to-layer="219" to-port="0"/>
		<edge from-layer="219" from-port="1" to-layer="220" to-port="0"/>
		<edge from-layer="220" from-port="3" to-layer="221" to-port="0"/>
		<edge from-layer="221" from-port="1" to-layer="222" to-port="0"/>
		<edge from-layer="222" from-port="3" to-layer="223" to-port="0"/>
		<edge from-layer="223" from-port="1" to-layer="224" to-port="0"/>
		<edge from-layer="219" from-port="1" to-layer="225" to-port="0"/>
		<edge from-layer="224" from-port="3" to-layer="225" to-port="1"/>
		<edge from-layer="225" from-port="2" to-layer="226" to-port="0"/>
		<edge from-layer="226" from-port="1" to-layer="227" to-port="0"/>
		<edge from-layer="227" from-port="3" to-layer="228" to-port="0"/>
		<edge from-layer="228" from-port="1" to-layer="229" to-port="0"/>
		<edge from-layer="229" from-port="3" to-layer="230" to-port="0"/>
		<edge from-layer="230" from-port="1" to-layer="231" to-port="0"/>
		<edge from-layer="226" from-port="1" to-layer="232" to-port="0"/>
		<edge from-layer="231" from-port="3" to-layer="232" to-port="1"/>
		<edge from-layer="232" from-port="2" to-layer="233" to-port="0"/>
		<edge from-layer="233" from-port="1" to-layer="234" to-port="0"/>
		<edge from-layer="234" from-port="3" to-layer="235" to-port="0"/>
		<edge from-layer="235" from-port="1" to-layer="236" to-port="0"/>
		<edge from-layer="236" from-port="3" to-layer="237" to-port="0"/>
		<edge from-layer="237" from-port="1" to-layer="238" to-port="0"/>
		<edge from-layer="233" from-port="1" to-layer="239" to-port="0"/>
		<edge from-layer="238" from-port="3" to-layer="239" to-port="1"/>
		<edge from-layer="239" from-port="2" to-layer="240" to-port="0"/>
		<edge from-layer="240" from-port="1" to-layer="241" to-port="0"/>
		<edge from-layer="241" from-port="3" to-layer="242" to-port="0"/>
		<edge from-layer="242" from-port="1" to-layer="243" to-port="0"/>
		<edge from-layer="243" from-port="3" to-layer="244" to-port="0"/>
		<edge from-layer="244" from-port="1" to-layer="245" to-port="0"/>
		<edge from-layer="240" from-port="1" to-layer="246" to-port="0"/>
		<edge from-layer="245" from-port="3" to-layer="246" to-port="1"/>
		<edge from-layer="246" from-port="2" to-layer="247" to-port="0"/>
		<edge from-layer="247" from-port="1" to-layer="248" to-port="0"/>
		<edge from-layer="248" from-port="3" to-layer="249" to-port="0"/>
		<edge from-layer="249" from-port="1" to-layer="250" to-port="0"/>
		<edge from-layer="250" from-port="3" to-layer="251" to-port="0"/>
		<edge from-layer="251" from-port="1" to-layer="252" to-port="0"/>
		<edge from-layer="247" from-port="1" to-layer="253" to-port="0"/>
		<edge from-layer="252" from-port="3" to-layer="253" to-port="1"/>
		<edge from-layer="253" from-port="2" to-layer="254" to-port="0"/>
		<edge from-layer="254" from-port="1" to-layer="255" to-port="0"/>
		<edge from-layer="255" from-port="3" to-layer="256" to-port="0"/>
		<edge from-layer="256" from-port="1" to-layer="257" to-port="0"/>
		<edge from-layer="257" from-port="3" to-layer="258" to-port="0"/>
		<edge from-layer="258" from-port="1" to-layer="259" to-port="0"/>
		<edge from-layer="254" from-port="1" to-layer="260" to-port="0"/>
		<edge from-layer="259" from-port="3" to-layer="260" to-port="1"/>
		<edge from-layer="260" from-port="2" to-layer="261" to-port="0"/>
		<edge from-layer="261" from-port="1" to-layer="262" to-port="0"/>
		<edge from-layer="262" from-port="1" to-layer="263" to-port="0"/>
		<edge from-layer="263" from-port="3" to-layer="264" to-port="0"/>
		<edge from-layer="264" from-port="1" to-layer="265" to-port="0"/>
	</edges>
	<meta_data>
		<MO_version value="1.5.4.dacdc0a0"/>
		<cli_parameters>
			<data_type value="FP32"/>
			<disable_fusing value="False"/>
			<disable_gfusing value="False"/>
			<disable_nhwc_to_nchw value="False"/>
			<disable_omitting_optional value="False"/>
			<disable_resnet_optimization value="False"/>
			<enable_flattening_nested_params value="False"/>
			<extensions value="DIR"/>
			<framework value="caffe"/>
			<generate_deprecated_IR_V2 value="False"/>
			<input value="data"/>
			<input_model value="DIR/weights.caffemodel"/>
			<input_model_is_text value="False"/>
			<input_proto value="DIR/deploy.prototxt"/>
			<input_shape value="[1,3,160,64]"/>
			<k value="DIR/CustomLayersMapping.xml"/>
			<legacy_mxnet_model value="False"/>
			<log_level value="ERROR"/>
			<mean_values value="()"/>
			<model_name value="person-reidentification-retail-0079"/>
			<move_to_preprocess value="False"/>
			<offload_unsupported_operations_to_tf value="False"/>
			<output value="embd/dim_red/scale"/>
			<output_dir value="DIR"/>
			<remove_output_softmax value="False"/>
			<reverse_input_channels value="False"/>
			<save_params_from_nd value="False"/>
			<scale_values value="()"/>
			<silent value="False"/>
			<version value="False"/>
			<unset unset_cli_parameters="batch, counts, finegrain_fusing, freeze_placeholder_with_value, input_checkpoint, input_meta_graph, input_symbol, mean_file, mean_file_offsets, nd_prefix_name, pretrained_model_name, saved_model_dir, saved_model_tags, scale, tensorboard_logdir, tensorflow_custom_layer_libraries, tensorflow_custom_operations_config_update, tensorflow_object_detection_api_pipeline_config, tensorflow_operation_patterns, tensorflow_subgraph_patterns, tensorflow_use_custom_operations_config"/>
		</cli_parameters>
	</meta_data>
</net>
