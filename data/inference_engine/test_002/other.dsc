<?xml version="1.0" ?>
<net batch="1" name="mobilenet_ssd_672x384" version="4">
	<layers>
		<layer id="0" name="data" precision="FP32" type="Input">
			<output>
				<port id="0">
					<dim>1</dim>
					<dim>3</dim>
					<dim>384</dim>
					<dim>672</dim>
				</port>
			</output>
		</layer>
		<layer id="1" name="Mul_/Fused_Mul_/FusedScaleShift_" precision="FP32" type="ScaleShift">
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>3</dim>
					<dim>384</dim>
					<dim>672</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>3</dim>
					<dim>384</dim>
					<dim>672</dim>
				</port>
			</output>
			<blobs>
				<weights offset="0" size="12"/>
				<biases offset="12" size="12"/>
			</blobs>
		</layer>
		<layer id="2" name="conv1" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="24" pads_begin="1,1" pads_end="1,1" strides="2,2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>3</dim>
					<dim>384</dim>
					<dim>672</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>24</dim>
					<dim>192</dim>
					<dim>336</dim>
				</port>
			</output>
			<blobs>
				<weights offset="24" size="2592"/>
				<biases offset="2616" size="96"/>
			</blobs>
		</layer>
		<layer id="3" name="relu1" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>24</dim>
					<dim>192</dim>
					<dim>336</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>24</dim>
					<dim>192</dim>
					<dim>336</dim>
				</port>
			</output>
		</layer>
		<layer id="4" name="conv2_1/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="24" kernel="3,3" output="24" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>24</dim>
					<dim>192</dim>
					<dim>336</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>24</dim>
					<dim>192</dim>
					<dim>336</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2712" size="864"/>
				<biases offset="3576" size="96"/>
			</blobs>
		</layer>
		<layer id="5" name="relu2_1/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>24</dim>
					<dim>192</dim>
					<dim>336</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>24</dim>
					<dim>192</dim>
					<dim>336</dim>
				</port>
			</output>
		</layer>
		<layer id="6" name="conv2_1/sep" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="56" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>24</dim>
					<dim>192</dim>
					<dim>336</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>56</dim>
					<dim>192</dim>
					<dim>336</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3672" size="5376"/>
				<biases offset="9048" size="224"/>
			</blobs>
		</layer>
		<layer id="7" name="relu2_1/sep" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>56</dim>
					<dim>192</dim>
					<dim>336</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>56</dim>
					<dim>192</dim>
					<dim>336</dim>
				</port>
			</output>
		</layer>
		<layer id="8" name="conv2_2/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="56" kernel="3,3" output="56" pads_begin="1,1" pads_end="1,1" strides="2,2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>56</dim>
					<dim>192</dim>
					<dim>336</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>56</dim>
					<dim>96</dim>
					<dim>168</dim>
				</port>
			</output>
			<blobs>
				<weights offset="9272" size="2016"/>
				<biases offset="11288" size="224"/>
			</blobs>
		</layer>
		<layer id="9" name="relu2_2/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>56</dim>
					<dim>96</dim>
					<dim>168</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>56</dim>
					<dim>96</dim>
					<dim>168</dim>
				</port>
			</output>
		</layer>
		<layer id="10" name="conv2_2/sep" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="104" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>56</dim>
					<dim>96</dim>
					<dim>168</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>104</dim>
					<dim>96</dim>
					<dim>168</dim>
				</port>
			</output>
			<blobs>
				<weights offset="11512" size="23296"/>
				<biases offset="34808" size="416"/>
			</blobs>
		</layer>
		<layer id="11" name="relu2_2/sep" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>104</dim>
					<dim>96</dim>
					<dim>168</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>104</dim>
					<dim>96</dim>
					<dim>168</dim>
				</port>
			</output>
		</layer>
		<layer id="12" name="conv3_1/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="104" kernel="3,3" output="104" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>104</dim>
					<dim>96</dim>
					<dim>168</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>104</dim>
					<dim>96</dim>
					<dim>168</dim>
				</port>
			</output>
			<blobs>
				<weights offset="35224" size="3744"/>
				<biases offset="38968" size="416"/>
			</blobs>
		</layer>
		<layer id="13" name="relu3_1/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>104</dim>
					<dim>96</dim>
					<dim>168</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>104</dim>
					<dim>96</dim>
					<dim>168</dim>
				</port>
			</output>
		</layer>
		<layer id="14" name="conv3_1/sep" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="120" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>104</dim>
					<dim>96</dim>
					<dim>168</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>120</dim>
					<dim>96</dim>
					<dim>168</dim>
				</port>
			</output>
			<blobs>
				<weights offset="39384" size="49920"/>
				<biases offset="89304" size="480"/>
			</blobs>
		</layer>
		<layer id="15" name="relu3_1/sep" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>120</dim>
					<dim>96</dim>
					<dim>168</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>120</dim>
					<dim>96</dim>
					<dim>168</dim>
				</port>
			</output>
		</layer>
		<layer id="16" name="conv3_2/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="120" kernel="3,3" output="120" pads_begin="1,1" pads_end="1,1" strides="2,2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>120</dim>
					<dim>96</dim>
					<dim>168</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>120</dim>
					<dim>48</dim>
					<dim>84</dim>
				</port>
			</output>
			<blobs>
				<weights offset="89784" size="4320"/>
				<biases offset="94104" size="480"/>
			</blobs>
		</layer>
		<layer id="17" name="relu3_2/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>120</dim>
					<dim>48</dim>
					<dim>84</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>120</dim>
					<dim>48</dim>
					<dim>84</dim>
				</port>
			</output>
		</layer>
		<layer id="18" name="conv3_2/sep" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="232" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>120</dim>
					<dim>48</dim>
					<dim>84</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>232</dim>
					<dim>48</dim>
					<dim>84</dim>
				</port>
			</output>
			<blobs>
				<weights offset="94584" size="111360"/>
				<biases offset="205944" size="928"/>
			</blobs>
		</layer>
		<layer id="19" name="relu3_2/sep" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>232</dim>
					<dim>48</dim>
					<dim>84</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>232</dim>
					<dim>48</dim>
					<dim>84</dim>
				</port>
			</output>
		</layer>
		<layer id="20" name="conv4_1/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="232" kernel="3,3" output="232" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>232</dim>
					<dim>48</dim>
					<dim>84</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>232</dim>
					<dim>48</dim>
					<dim>84</dim>
				</port>
			</output>
			<blobs>
				<weights offset="206872" size="8352"/>
				<biases offset="215224" size="928"/>
			</blobs>
		</layer>
		<layer id="21" name="relu4_1/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>232</dim>
					<dim>48</dim>
					<dim>84</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>232</dim>
					<dim>48</dim>
					<dim>84</dim>
				</port>
			</output>
		</layer>
		<layer id="22" name="conv4_1/sep" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="232" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>232</dim>
					<dim>48</dim>
					<dim>84</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>232</dim>
					<dim>48</dim>
					<dim>84</dim>
				</port>
			</output>
			<blobs>
				<weights offset="216152" size="215296"/>
				<biases offset="431448" size="928"/>
			</blobs>
		</layer>
		<layer id="23" name="relu4_1/sep" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>232</dim>
					<dim>48</dim>
					<dim>84</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>232</dim>
					<dim>48</dim>
					<dim>84</dim>
				</port>
			</output>
		</layer>
		<layer id="24" name="conv4_2/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="232" kernel="3,3" output="232" pads_begin="1,1" pads_end="1,1" strides="2,2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>232</dim>
					<dim>48</dim>
					<dim>84</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>232</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="432376" size="8352"/>
				<biases offset="440728" size="928"/>
			</blobs>
		</layer>
		<layer id="25" name="relu4_2/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>232</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>232</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
		</layer>
		<layer id="26" name="conv4_2/sep" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="360" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>232</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>360</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="441656" size="334080"/>
				<biases offset="775736" size="1440"/>
			</blobs>
		</layer>
		<layer id="27" name="relu4_2/sep" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>360</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>360</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
		</layer>
		<layer id="28" name="conv5_1/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="360" kernel="3,3" output="360" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>360</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>360</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="777176" size="12960"/>
				<biases offset="790136" size="1440"/>
			</blobs>
		</layer>
		<layer id="29" name="relu5_1/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>360</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>360</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
		</layer>
		<layer id="30" name="conv5_1/sep" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="328" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>360</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>328</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="791576" size="472320"/>
				<biases offset="1263896" size="1312"/>
			</blobs>
		</layer>
		<layer id="31" name="relu5_1/sep" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>328</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>328</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
		</layer>
		<layer id="32" name="conv5_2/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="328" kernel="3,3" output="328" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>328</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>328</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1265208" size="11808"/>
				<biases offset="1277016" size="1312"/>
			</blobs>
		</layer>
		<layer id="33" name="relu5_2/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>328</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>328</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
		</layer>
		<layer id="34" name="conv5_2/sep" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="304" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>328</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>304</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1278328" size="398848"/>
				<biases offset="1677176" size="1216"/>
			</blobs>
		</layer>
		<layer id="35" name="relu5_2/sep" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>304</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>304</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
		</layer>
		<layer id="36" name="conv5_3/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="304" kernel="3,3" output="304" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>304</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>304</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1678392" size="10944"/>
				<biases offset="1689336" size="1216"/>
			</blobs>
		</layer>
		<layer id="37" name="relu5_3/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>304</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>304</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
		</layer>
		<layer id="38" name="conv5_3/sep" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="248" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>304</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>248</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1690552" size="301568"/>
				<biases offset="1992120" size="992"/>
			</blobs>
		</layer>
		<layer id="39" name="relu5_3/sep" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>248</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>248</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
		</layer>
		<layer id="40" name="conv5_4/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="248" kernel="3,3" output="248" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>248</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>248</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="1993112" size="8928"/>
				<biases offset="2002040" size="992"/>
			</blobs>
		</layer>
		<layer id="41" name="relu5_4/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>248</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>248</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
		</layer>
		<layer id="42" name="conv5_4/sep" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="224" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>248</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>224</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2003032" size="222208"/>
				<biases offset="2225240" size="896"/>
			</blobs>
		</layer>
		<layer id="43" name="relu5_4/sep" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>224</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>224</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
		</layer>
		<layer id="44" name="conv5_5/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="224" kernel="3,3" output="224" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>224</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>224</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2226136" size="8064"/>
				<biases offset="2234200" size="896"/>
			</blobs>
		</layer>
		<layer id="45" name="relu5_5/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>224</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>224</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
		</layer>
		<layer id="46" name="conv5_5/sep" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="184" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>224</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>184</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2235096" size="164864"/>
				<biases offset="2399960" size="736"/>
			</blobs>
		</layer>
		<layer id="47" name="relu5_5/sep" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>184</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>184</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
		</layer>
		<layer id="48" name="conv4_3_0_norm_mbox_loc" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>184</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2400696" size="105984"/>
				<biases offset="2506680" size="64"/>
			</blobs>
		</layer>
		<layer id="49" name="conv4_3_0_norm_mbox_loc_perm" precision="FP32" type="Permute">
			<data order="0,2,3,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>24</dim>
					<dim>42</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="50" name="conv4_3_0_norm_mbox_loc_flat" precision="FP32" type="Flatten">
			<data axis="1" end_axis="-1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>24</dim>
					<dim>42</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16128</dim>
				</port>
			</output>
		</layer>
		<layer id="51" name="conv4_3_norm_mbox_loc" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>184</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2506744" size="105984"/>
				<biases offset="2612728" size="64"/>
			</blobs>
		</layer>
		<layer id="52" name="conv4_3_norm_mbox_loc_perm" precision="FP32" type="Permute">
			<data order="0,2,3,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>24</dim>
					<dim>42</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="53" name="conv4_3_norm_mbox_loc_flat" precision="FP32" type="Flatten">
			<data axis="1" end_axis="-1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>24</dim>
					<dim>42</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16128</dim>
				</port>
			</output>
		</layer>
		<layer id="54" name="conv5_6/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="184" kernel="3,3" output="184" pads_begin="1,1" pads_end="1,1" strides="2,2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>184</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>184</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2612792" size="6624"/>
				<biases offset="2619416" size="736"/>
			</blobs>
		</layer>
		<layer id="55" name="relu5_6/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>184</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>184</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</output>
		</layer>
		<layer id="56" name="conv5_6/sep" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="224" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>184</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>224</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2620152" size="164864"/>
				<biases offset="2785016" size="896"/>
			</blobs>
		</layer>
		<layer id="57" name="relu5_6/sep" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>224</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>224</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</output>
		</layer>
		<layer id="58" name="conv6/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="224" kernel="3,3" output="224" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>224</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>224</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2785912" size="8064"/>
				<biases offset="2793976" size="896"/>
			</blobs>
		</layer>
		<layer id="59" name="relu6/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>224</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>224</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</output>
		</layer>
		<layer id="60" name="conv6/sep" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="128" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>224</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>128</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2794872" size="114688"/>
				<biases offset="2909560" size="512"/>
			</blobs>
		</layer>
		<layer id="61" name="relu6/sep" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</output>
		</layer>
		<layer id="62" name="fc7_mbox_loc" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="24" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>24</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</output>
			<blobs>
				<weights offset="2910072" size="110592"/>
				<biases offset="3020664" size="96"/>
			</blobs>
		</layer>
		<layer id="63" name="fc7_mbox_loc_perm" precision="FP32" type="Permute">
			<data order="0,2,3,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>24</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>12</dim>
					<dim>21</dim>
					<dim>24</dim>
				</port>
			</output>
		</layer>
		<layer id="64" name="fc7_mbox_loc_flat" precision="FP32" type="Flatten">
			<data axis="1" end_axis="-1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>12</dim>
					<dim>21</dim>
					<dim>24</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>6048</dim>
				</port>
			</output>
		</layer>
		<layer id="65" name="conv6_1" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="120" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>120</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3020760" size="61440"/>
				<biases offset="3082200" size="480"/>
			</blobs>
		</layer>
		<layer id="66" name="relu6_1" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>120</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>120</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</output>
		</layer>
		<layer id="67" name="conv6_2/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="120" kernel="3,3" output="120" pads_begin="1,1" pads_end="1,1" strides="2,2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>120</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>120</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3082680" size="4320"/>
				<biases offset="3087000" size="480"/>
			</blobs>
		</layer>
		<layer id="68" name="relu6_2/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>120</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>120</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</output>
		</layer>
		<layer id="69" name="conv6_2_new" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="152" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>120</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>152</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3087480" size="72960"/>
				<biases offset="3160440" size="608"/>
			</blobs>
		</layer>
		<layer id="70" name="relu6_2" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>152</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>152</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</output>
		</layer>
		<layer id="71" name="conv6_2_mbox_loc" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="24" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>152</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>24</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3161048" size="131328"/>
				<biases offset="3292376" size="96"/>
			</blobs>
		</layer>
		<layer id="72" name="conv6_2_mbox_loc_perm" precision="FP32" type="Permute">
			<data order="0,2,3,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>24</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>6</dim>
					<dim>11</dim>
					<dim>24</dim>
				</port>
			</output>
		</layer>
		<layer id="73" name="conv6_2_mbox_loc_flat" precision="FP32" type="Flatten">
			<data axis="1" end_axis="-1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>6</dim>
					<dim>11</dim>
					<dim>24</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>1584</dim>
				</port>
			</output>
		</layer>
		<layer id="74" name="conv7_1" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="112" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>152</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>112</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3292472" size="68096"/>
				<biases offset="3360568" size="448"/>
			</blobs>
		</layer>
		<layer id="75" name="relu7_1" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>112</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>112</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</output>
		</layer>
		<layer id="76" name="conv7_2/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="112" kernel="3,3" output="112" pads_begin="1,1" pads_end="1,1" strides="2,2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>112</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>112</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3361016" size="4032"/>
				<biases offset="3365048" size="448"/>
			</blobs>
		</layer>
		<layer id="77" name="relu7_2/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>112</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>112</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</output>
		</layer>
		<layer id="78" name="conv7_2_new" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="168" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>112</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>168</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3365496" size="75264"/>
				<biases offset="3440760" size="672"/>
			</blobs>
		</layer>
		<layer id="79" name="relu7_2" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>168</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>168</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</output>
		</layer>
		<layer id="80" name="conv7_2_mbox_loc" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="24" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>168</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>24</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3441432" size="145152"/>
				<biases offset="3586584" size="96"/>
			</blobs>
		</layer>
		<layer id="81" name="conv7_2_mbox_loc_perm" precision="FP32" type="Permute">
			<data order="0,2,3,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>24</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>3</dim>
					<dim>6</dim>
					<dim>24</dim>
				</port>
			</output>
		</layer>
		<layer id="82" name="conv7_2_mbox_loc_flat" precision="FP32" type="Flatten">
			<data axis="1" end_axis="-1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>3</dim>
					<dim>6</dim>
					<dim>24</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>432</dim>
				</port>
			</output>
		</layer>
		<layer id="83" name="conv8_1" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="120" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>168</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>120</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3586680" size="80640"/>
				<biases offset="3667320" size="480"/>
			</blobs>
		</layer>
		<layer id="84" name="relu8_1" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>120</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>120</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</output>
		</layer>
		<layer id="85" name="conv8_2/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="120" kernel="3,3" output="120" pads_begin="1,1" pads_end="1,1" strides="2,2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>120</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>120</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3667800" size="4320"/>
				<biases offset="3672120" size="480"/>
			</blobs>
		</layer>
		<layer id="86" name="relu8_2/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>120</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>120</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</output>
		</layer>
		<layer id="87" name="conv8_2_new" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="200" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>120</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>200</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3672600" size="96000"/>
				<biases offset="3768600" size="800"/>
			</blobs>
		</layer>
		<layer id="88" name="relu8_2" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>200</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>200</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</output>
		</layer>
		<layer id="89" name="conv8_2_mbox_loc" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>200</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3769400" size="115200"/>
				<biases offset="3884600" size="64"/>
			</blobs>
		</layer>
		<layer id="90" name="conv8_2_mbox_loc_perm" precision="FP32" type="Permute">
			<data order="0,2,3,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>2</dim>
					<dim>3</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="91" name="conv8_2_mbox_loc_flat" precision="FP32" type="Flatten">
			<data axis="1" end_axis="-1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>2</dim>
					<dim>3</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>96</dim>
				</port>
			</output>
		</layer>
		<layer id="92" name="conv9_1" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="64" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>200</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3884664" size="51200"/>
				<biases offset="3935864" size="256"/>
			</blobs>
		</layer>
		<layer id="93" name="relu9_1" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</output>
		</layer>
		<layer id="94" name="conv9_2/dw" precision="FP32" type="Convolution">
			<data dilations="1,1" group="64" kernel="3,3" output="64" pads_begin="1,1" pads_end="1,1" strides="2,2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>64</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3936120" size="2304"/>
				<biases offset="3938424" size="256"/>
			</blobs>
		</layer>
		<layer id="95" name="relu9_2/dw" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>64</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</output>
		</layer>
		<layer id="96" name="conv9_2_new" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="128" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>64</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>128</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3938680" size="32768"/>
				<biases offset="3971448" size="512"/>
			</blobs>
		</layer>
		<layer id="97" name="relu9_2" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>128</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</output>
		</layer>
		<layer id="98" name="conv9_2_mbox_loc" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</output>
			<blobs>
				<weights offset="3971960" size="73728"/>
				<biases offset="4045688" size="64"/>
			</blobs>
		</layer>
		<layer id="99" name="conv9_2_mbox_loc_perm" precision="FP32" type="Permute">
			<data order="0,2,3,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>1</dim>
					<dim>2</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="100" name="conv9_2_mbox_loc_flat" precision="FP32" type="Flatten">
			<data axis="1" end_axis="-1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>1</dim>
					<dim>2</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="101" name="mbox_loc" precision="FP32" type="Concat">
			<data axis="1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16128</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>16128</dim>
				</port>
				<port id="2">
					<dim>1</dim>
					<dim>6048</dim>
				</port>
				<port id="3">
					<dim>1</dim>
					<dim>1584</dim>
				</port>
				<port id="4">
					<dim>1</dim>
					<dim>432</dim>
				</port>
				<port id="5">
					<dim>1</dim>
					<dim>96</dim>
				</port>
				<port id="6">
					<dim>1</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="7">
					<dim>1</dim>
					<dim>40448</dim>
				</port>
			</output>
		</layer>
		<layer id="102" name="conv5_5/sep/reduce" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="16" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>184</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4045752" size="11776"/>
				<biases offset="4057528" size="64"/>
			</blobs>
		</layer>
		<layer id="103" name="conv5_5/sep/reduced/relu" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
		</layer>
		<layer id="104" name="pre_conv4_3_0_norm_mbox_conf_64" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4057592" size="9216"/>
				<biases offset="4066808" size="64"/>
			</blobs>
		</layer>
		<layer id="105" name="pre_conv4_3_0_norm_mbox_conf/relu" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
		</layer>
		<layer id="106" name="conv4_3_0_norm_mbox_conf_64" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="8" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>8</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4066872" size="4608"/>
				<biases offset="4071480" size="32"/>
			</blobs>
		</layer>
		<layer id="107" name="conv4_3_0_norm_mbox_conf_perm" precision="FP32" type="Permute">
			<data order="0,2,3,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>24</dim>
					<dim>42</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="108" name="conv4_3_0_norm_mbox_conf_flat" precision="FP32" type="Flatten">
			<data axis="1" end_axis="-1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>24</dim>
					<dim>42</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>8064</dim>
				</port>
			</output>
		</layer>
		<layer id="109" name="pre_conv4_3_norm_mbox_conf_64" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4071512" size="9216"/>
				<biases offset="4080728" size="64"/>
			</blobs>
		</layer>
		<layer id="110" name="pre_conv4_3_norm_mbox_conf/relu" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
		</layer>
		<layer id="111" name="conv4_3_norm_mbox_conf_64" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="8" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>8</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4080792" size="4608"/>
				<biases offset="4085400" size="32"/>
			</blobs>
		</layer>
		<layer id="112" name="conv4_3_norm_mbox_conf_perm" precision="FP32" type="Permute">
			<data order="0,2,3,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>24</dim>
					<dim>42</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="113" name="conv4_3_norm_mbox_conf_flat" precision="FP32" type="Flatten">
			<data axis="1" end_axis="-1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>24</dim>
					<dim>42</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>8064</dim>
				</port>
			</output>
		</layer>
		<layer id="114" name="conv6/sep/reduce" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="16" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4085432" size="8192"/>
				<biases offset="4093624" size="64"/>
			</blobs>
		</layer>
		<layer id="115" name="conv6/sep/reduced/relu" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</output>
		</layer>
		<layer id="116" name="pre_fc7_mbox_conf_64" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4093688" size="9216"/>
				<biases offset="4102904" size="64"/>
			</blobs>
		</layer>
		<layer id="117" name="pre_fc7_mbox_conf/relu" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</output>
		</layer>
		<layer id="118" name="fc7_mbox_conf_64" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="12" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>12</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4102968" size="6912"/>
				<biases offset="4109880" size="48"/>
			</blobs>
		</layer>
		<layer id="119" name="fc7_mbox_conf_perm" precision="FP32" type="Permute">
			<data order="0,2,3,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>12</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>12</dim>
					<dim>21</dim>
					<dim>12</dim>
				</port>
			</output>
		</layer>
		<layer id="120" name="fc7_mbox_conf_flat" precision="FP32" type="Flatten">
			<data axis="1" end_axis="-1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>12</dim>
					<dim>21</dim>
					<dim>12</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>3024</dim>
				</port>
			</output>
		</layer>
		<layer id="121" name="conv6_2/reduce" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="16" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>152</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4109928" size="9728"/>
				<biases offset="4119656" size="64"/>
			</blobs>
		</layer>
		<layer id="122" name="conv6_2/reduced/relu" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</output>
		</layer>
		<layer id="123" name="pre_conv6_2_mbox_conf_64" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4119720" size="9216"/>
				<biases offset="4128936" size="64"/>
			</blobs>
		</layer>
		<layer id="124" name="pre_conv6_2_mbox_conf/relu" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</output>
		</layer>
		<layer id="125" name="conv6_2_mbox_conf_64" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="12" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>12</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4129000" size="6912"/>
				<biases offset="4135912" size="48"/>
			</blobs>
		</layer>
		<layer id="126" name="conv6_2_mbox_conf_perm" precision="FP32" type="Permute">
			<data order="0,2,3,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>12</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>6</dim>
					<dim>11</dim>
					<dim>12</dim>
				</port>
			</output>
		</layer>
		<layer id="127" name="conv6_2_mbox_conf_flat" precision="FP32" type="Flatten">
			<data axis="1" end_axis="-1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>6</dim>
					<dim>11</dim>
					<dim>12</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>792</dim>
				</port>
			</output>
		</layer>
		<layer id="128" name="conv7_2/reduce" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="16" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>168</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4135960" size="10752"/>
				<biases offset="4146712" size="64"/>
			</blobs>
		</layer>
		<layer id="129" name="conv7_2_reduced/relu" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</output>
		</layer>
		<layer id="130" name="pre_conv7_2_mbox_conf_64" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4146776" size="9216"/>
				<biases offset="4155992" size="64"/>
			</blobs>
		</layer>
		<layer id="131" name="pre_conv7_2_mbox_conf/relu" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</output>
		</layer>
		<layer id="132" name="conv7_2_mbox_conf_64" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="12" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>12</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4156056" size="6912"/>
				<biases offset="4162968" size="48"/>
			</blobs>
		</layer>
		<layer id="133" name="conv7_2_mbox_conf_perm" precision="FP32" type="Permute">
			<data order="0,2,3,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>12</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>3</dim>
					<dim>6</dim>
					<dim>12</dim>
				</port>
			</output>
		</layer>
		<layer id="134" name="conv7_2_mbox_conf_flat" precision="FP32" type="Flatten">
			<data axis="1" end_axis="-1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>3</dim>
					<dim>6</dim>
					<dim>12</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>216</dim>
				</port>
			</output>
		</layer>
		<layer id="135" name="conv8_2/reduce" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="16" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>200</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4163016" size="12800"/>
				<biases offset="4175816" size="64"/>
			</blobs>
		</layer>
		<layer id="136" name="conv8_2_reduced/relu" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</output>
		</layer>
		<layer id="137" name="pre_conv8_2_mbox_conf_64" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4175880" size="9216"/>
				<biases offset="4185096" size="64"/>
			</blobs>
		</layer>
		<layer id="138" name="pre_conv8_2_mbox_conf/relu" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</output>
		</layer>
		<layer id="139" name="conv8_2_mbox_conf_64" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="8" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>8</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4185160" size="4608"/>
				<biases offset="4189768" size="32"/>
			</blobs>
		</layer>
		<layer id="140" name="conv8_2_mbox_conf_perm" precision="FP32" type="Permute">
			<data order="0,2,3,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>2</dim>
					<dim>3</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="141" name="conv8_2_mbox_conf_flat" precision="FP32" type="Flatten">
			<data axis="1" end_axis="-1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>2</dim>
					<dim>3</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>48</dim>
				</port>
			</output>
		</layer>
		<layer id="142" name="conv9_2/reduce" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="1,1" output="16" pads_begin="0,0" pads_end="0,0" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4189800" size="8192"/>
				<biases offset="4197992" size="64"/>
			</blobs>
		</layer>
		<layer id="143" name="conv9_2_reduced/relu" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</output>
		</layer>
		<layer id="144" name="pre_conv9_2_mbox_conf_64" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="16" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>16</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4198056" size="9216"/>
				<biases offset="4207272" size="64"/>
			</blobs>
		</layer>
		<layer id="145" name="pre_conv9_2_mbox_conf/relu" precision="FP32" type="ReLU">
			<data negative_slope="0.0"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</output>
		</layer>
		<layer id="146" name="conv9_2_mbox_conf_64" precision="FP32" type="Convolution">
			<data dilations="1,1" group="1" kernel="3,3" output="8" pads_begin="1,1" pads_end="1,1" strides="1,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>16</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>8</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</output>
			<blobs>
				<weights offset="4207336" size="4608"/>
				<biases offset="4211944" size="32"/>
			</blobs>
		</layer>
		<layer id="147" name="conv9_2_mbox_conf_perm" precision="FP32" type="Permute">
			<data order="0,2,3,1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>1</dim>
					<dim>2</dim>
					<dim>8</dim>
				</port>
			</output>
		</layer>
		<layer id="148" name="conv9_2_mbox_conf_flat" precision="FP32" type="Flatten">
			<data axis="1" end_axis="-1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>1</dim>
					<dim>2</dim>
					<dim>8</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>16</dim>
				</port>
			</output>
		</layer>
		<layer id="149" name="mbox_conf_16" precision="FP32" type="Concat">
			<data axis="1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>8064</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>8064</dim>
				</port>
				<port id="2">
					<dim>1</dim>
					<dim>3024</dim>
				</port>
				<port id="3">
					<dim>1</dim>
					<dim>792</dim>
				</port>
				<port id="4">
					<dim>1</dim>
					<dim>216</dim>
				</port>
				<port id="5">
					<dim>1</dim>
					<dim>48</dim>
				</port>
				<port id="6">
					<dim>1</dim>
					<dim>16</dim>
				</port>
			</input>
			<output>
				<port id="7">
					<dim>1</dim>
					<dim>20224</dim>
				</port>
			</output>
		</layer>
		<layer id="150" name="mbox_conf_reshape/DimData_const" precision="FP32" type="Const">
			<output>
				<port id="1">
					<dim>3</dim>
				</port>
			</output>
			<blobs>
				<custom offset="4211976" size="12"/>
			</blobs>
		</layer>
		<layer id="151" name="mbox_conf_reshape" precision="FP32" type="Reshape">
			<data axis="0" num_axes="-1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>20224</dim>
				</port>
				<port id="1">
					<dim>3</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>10112</dim>
					<dim>2</dim>
				</port>
			</output>
		</layer>
		<layer id="152" name="mbox_conf_softmax" precision="FP32" type="SoftMax">
			<data axis="2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>10112</dim>
					<dim>2</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>10112</dim>
					<dim>2</dim>
				</port>
			</output>
		</layer>
		<layer id="153" name="mbox_conf_flatten" precision="FP32" type="Flatten">
			<data axis="1" end_axis="-1"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>10112</dim>
					<dim>2</dim>
				</port>
			</input>
			<output>
				<port id="1">
					<dim>1</dim>
					<dim>20224</dim>
				</port>
			</output>
		</layer>
		<layer id="154" name="conv4_3_0_norm_mbox_priorbox" precision="FP32" type="PriorBox">
			<data aspect_ratio="2.0" clip="0" flip="1" max_size="38.400001525878906" min_size="16.0" offset="0.5" step="16.0" variance="0.10000000149011612,0.10000000149011612,0.20000000298023224,0.20000000298023224"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>184</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>3</dim>
					<dim>384</dim>
					<dim>672</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>2</dim>
					<dim>16128</dim>
				</port>
			</output>
		</layer>
		<layer id="155" name="conv4_3_norm_mbox_priorbox" precision="FP32" type="PriorBox">
			<data aspect_ratio="2.0" clip="0" flip="1" max_size="76.80000305175781" min_size="38.400001525878906" offset="0.5" step="16.0" variance="0.10000000149011612,0.10000000149011612,0.20000000298023224,0.20000000298023224"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>184</dim>
					<dim>24</dim>
					<dim>42</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>3</dim>
					<dim>384</dim>
					<dim>672</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>2</dim>
					<dim>16128</dim>
				</port>
			</output>
		</layer>
		<layer id="156" name="fc7_mbox_priorbox" precision="FP32" type="PriorBox">
			<data aspect_ratio="2.0,3.0" clip="0" flip="1" max_size="142.0800018310547" min_size="76.80000305175781" offset="0.5" step="32.0" variance="0.10000000149011612,0.10000000149011612,0.20000000298023224,0.20000000298023224"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>12</dim>
					<dim>21</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>3</dim>
					<dim>384</dim>
					<dim>672</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>2</dim>
					<dim>6048</dim>
				</port>
			</output>
		</layer>
		<layer id="157" name="conv6_2_mbox_priorbox" precision="FP32" type="PriorBox">
			<data aspect_ratio="2.0,3.0" clip="0" flip="1" max_size="207.36000061035156" min_size="142.0800018310547" offset="0.5" step="64.0" variance="0.10000000149011612,0.10000000149011612,0.20000000298023224,0.20000000298023224"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>152</dim>
					<dim>6</dim>
					<dim>11</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>3</dim>
					<dim>384</dim>
					<dim>672</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>2</dim>
					<dim>1584</dim>
				</port>
			</output>
		</layer>
		<layer id="158" name="conv7_2_mbox_priorbox" precision="FP32" type="PriorBox">
			<data aspect_ratio="2.0,3.0" clip="0" flip="1" max_size="272.6400146484375" min_size="207.36000061035156" offset="0.5" step="100.0" variance="0.10000000149011612,0.10000000149011612,0.20000000298023224,0.20000000298023224"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>168</dim>
					<dim>3</dim>
					<dim>6</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>3</dim>
					<dim>384</dim>
					<dim>672</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>2</dim>
					<dim>432</dim>
				</port>
			</output>
		</layer>
		<layer id="159" name="conv8_2_mbox_priorbox" precision="FP32" type="PriorBox">
			<data aspect_ratio="2.0" clip="0" flip="1" max_size="337.9200134277344" min_size="272.6400146484375" offset="0.5" step="150.0" variance="0.10000000149011612,0.10000000149011612,0.20000000298023224,0.20000000298023224"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>200</dim>
					<dim>2</dim>
					<dim>3</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>3</dim>
					<dim>384</dim>
					<dim>672</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>2</dim>
					<dim>96</dim>
				</port>
			</output>
		</layer>
		<layer id="160" name="conv9_2_mbox_priorbox" precision="FP32" type="PriorBox">
			<data aspect_ratio="2.0" clip="0" flip="1" max_size="403.20001220703125" min_size="337.9200134277344" offset="0.5" step="300.0" variance="0.10000000149011612,0.10000000149011612,0.20000000298023224,0.20000000298023224"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>128</dim>
					<dim>1</dim>
					<dim>2</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>3</dim>
					<dim>384</dim>
					<dim>672</dim>
				</port>
			</input>
			<output>
				<port id="2">
					<dim>1</dim>
					<dim>2</dim>
					<dim>32</dim>
				</port>
			</output>
		</layer>
		<layer id="161" name="mbox_priorbox" precision="FP32" type="Concat">
			<data axis="2"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>2</dim>
					<dim>16128</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>2</dim>
					<dim>16128</dim>
				</port>
				<port id="2">
					<dim>1</dim>
					<dim>2</dim>
					<dim>6048</dim>
				</port>
				<port id="3">
					<dim>1</dim>
					<dim>2</dim>
					<dim>1584</dim>
				</port>
				<port id="4">
					<dim>1</dim>
					<dim>2</dim>
					<dim>432</dim>
				</port>
				<port id="5">
					<dim>1</dim>
					<dim>2</dim>
					<dim>96</dim>
				</port>
				<port id="6">
					<dim>1</dim>
					<dim>2</dim>
					<dim>32</dim>
				</port>
			</input>
			<output>
				<port id="7">
					<dim>1</dim>
					<dim>2</dim>
					<dim>40448</dim>
				</port>
			</output>
		</layer>
		<layer id="162" name="detection_out" precision="FP32" type="DetectionOutput">
			<data background_label_id="0" code_type="caffe.PriorBoxParameter.CENTER_SIZE" confidence_threshold="0.009999999776482582" eta="1.0" input_height="1" input_width="1" keep_top_k="200" nms_threshold="0.44999998807907104" normalized="1" num_classes="2" share_location="1" top_k="400" variance_encoded_in_target="0" visualize="False"/>
			<input>
				<port id="0">
					<dim>1</dim>
					<dim>40448</dim>
				</port>
				<port id="1">
					<dim>1</dim>
					<dim>20224</dim>
				</port>
				<port id="2">
					<dim>1</dim>
					<dim>2</dim>
					<dim>40448</dim>
				</port>
			</input>
			<output>
				<port id="3">
					<dim>1</dim>
					<dim>1</dim>
					<dim>200</dim>
					<dim>7</dim>
				</port>
			</output>
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
		<edge from-layer="8" from-port="3" to-layer="9" to-port="0"/>
		<edge from-layer="9" from-port="1" to-layer="10" to-port="0"/>
		<edge from-layer="10" from-port="3" to-layer="11" to-port="0"/>
		<edge from-layer="11" from-port="1" to-layer="12" to-port="0"/>
		<edge from-layer="12" from-port="3" to-layer="13" to-port="0"/>
		<edge from-layer="13" from-port="1" to-layer="14" to-port="0"/>
		<edge from-layer="14" from-port="3" to-layer="15" to-port="0"/>
		<edge from-layer="15" from-port="1" to-layer="16" to-port="0"/>
		<edge from-layer="16" from-port="3" to-layer="17" to-port="0"/>
		<edge from-layer="17" from-port="1" to-layer="18" to-port="0"/>
		<edge from-layer="18" from-port="3" to-layer="19" to-port="0"/>
		<edge from-layer="19" from-port="1" to-layer="20" to-port="0"/>
		<edge from-layer="20" from-port="3" to-layer="21" to-port="0"/>
		<edge from-layer="21" from-port="1" to-layer="22" to-port="0"/>
		<edge from-layer="22" from-port="3" to-layer="23" to-port="0"/>
		<edge from-layer="23" from-port="1" to-layer="24" to-port="0"/>
		<edge from-layer="24" from-port="3" to-layer="25" to-port="0"/>
		<edge from-layer="25" from-port="1" to-layer="26" to-port="0"/>
		<edge from-layer="26" from-port="3" to-layer="27" to-port="0"/>
		<edge from-layer="27" from-port="1" to-layer="28" to-port="0"/>
		<edge from-layer="28" from-port="3" to-layer="29" to-port="0"/>
		<edge from-layer="29" from-port="1" to-layer="30" to-port="0"/>
		<edge from-layer="30" from-port="3" to-layer="31" to-port="0"/>
		<edge from-layer="31" from-port="1" to-layer="32" to-port="0"/>
		<edge from-layer="32" from-port="3" to-layer="33" to-port="0"/>
		<edge from-layer="33" from-port="1" to-layer="34" to-port="0"/>
		<edge from-layer="34" from-port="3" to-layer="35" to-port="0"/>
		<edge from-layer="35" from-port="1" to-layer="36" to-port="0"/>
		<edge from-layer="36" from-port="3" to-layer="37" to-port="0"/>
		<edge from-layer="37" from-port="1" to-layer="38" to-port="0"/>
		<edge from-layer="38" from-port="3" to-layer="39" to-port="0"/>
		<edge from-layer="39" from-port="1" to-layer="40" to-port="0"/>
		<edge from-layer="40" from-port="3" to-layer="41" to-port="0"/>
		<edge from-layer="41" from-port="1" to-layer="42" to-port="0"/>
		<edge from-layer="42" from-port="3" to-layer="43" to-port="0"/>
		<edge from-layer="43" from-port="1" to-layer="44" to-port="0"/>
		<edge from-layer="44" from-port="3" to-layer="45" to-port="0"/>
		<edge from-layer="45" from-port="1" to-layer="46" to-port="0"/>
		<edge from-layer="46" from-port="3" to-layer="47" to-port="0"/>
		<edge from-layer="47" from-port="1" to-layer="48" to-port="0"/>
		<edge from-layer="48" from-port="3" to-layer="49" to-port="0"/>
		<edge from-layer="49" from-port="1" to-layer="50" to-port="0"/>
		<edge from-layer="47" from-port="1" to-layer="51" to-port="0"/>
		<edge from-layer="51" from-port="3" to-layer="52" to-port="0"/>
		<edge from-layer="52" from-port="1" to-layer="53" to-port="0"/>
		<edge from-layer="47" from-port="1" to-layer="54" to-port="0"/>
		<edge from-layer="54" from-port="3" to-layer="55" to-port="0"/>
		<edge from-layer="55" from-port="1" to-layer="56" to-port="0"/>
		<edge from-layer="56" from-port="3" to-layer="57" to-port="0"/>
		<edge from-layer="57" from-port="1" to-layer="58" to-port="0"/>
		<edge from-layer="58" from-port="3" to-layer="59" to-port="0"/>
		<edge from-layer="59" from-port="1" to-layer="60" to-port="0"/>
		<edge from-layer="60" from-port="3" to-layer="61" to-port="0"/>
		<edge from-layer="61" from-port="1" to-layer="62" to-port="0"/>
		<edge from-layer="62" from-port="3" to-layer="63" to-port="0"/>
		<edge from-layer="63" from-port="1" to-layer="64" to-port="0"/>
		<edge from-layer="61" from-port="1" to-layer="65" to-port="0"/>
		<edge from-layer="65" from-port="3" to-layer="66" to-port="0"/>
		<edge from-layer="66" from-port="1" to-layer="67" to-port="0"/>
		<edge from-layer="67" from-port="3" to-layer="68" to-port="0"/>
		<edge from-layer="68" from-port="1" to-layer="69" to-port="0"/>
		<edge from-layer="69" from-port="3" to-layer="70" to-port="0"/>
		<edge from-layer="70" from-port="1" to-layer="71" to-port="0"/>
		<edge from-layer="71" from-port="3" to-layer="72" to-port="0"/>
		<edge from-layer="72" from-port="1" to-layer="73" to-port="0"/>
		<edge from-layer="70" from-port="1" to-layer="74" to-port="0"/>
		<edge from-layer="74" from-port="3" to-layer="75" to-port="0"/>
		<edge from-layer="75" from-port="1" to-layer="76" to-port="0"/>
		<edge from-layer="76" from-port="3" to-layer="77" to-port="0"/>
		<edge from-layer="77" from-port="1" to-layer="78" to-port="0"/>
		<edge from-layer="78" from-port="3" to-layer="79" to-port="0"/>
		<edge from-layer="79" from-port="1" to-layer="80" to-port="0"/>
		<edge from-layer="80" from-port="3" to-layer="81" to-port="0"/>
		<edge from-layer="81" from-port="1" to-layer="82" to-port="0"/>
		<edge from-layer="79" from-port="1" to-layer="83" to-port="0"/>
		<edge from-layer="83" from-port="3" to-layer="84" to-port="0"/>
		<edge from-layer="84" from-port="1" to-layer="85" to-port="0"/>
		<edge from-layer="85" from-port="3" to-layer="86" to-port="0"/>
		<edge from-layer="86" from-port="1" to-layer="87" to-port="0"/>
		<edge from-layer="87" from-port="3" to-layer="88" to-port="0"/>
		<edge from-layer="88" from-port="1" to-layer="89" to-port="0"/>
		<edge from-layer="89" from-port="3" to-layer="90" to-port="0"/>
		<edge from-layer="90" from-port="1" to-layer="91" to-port="0"/>
		<edge from-layer="88" from-port="1" to-layer="92" to-port="0"/>
		<edge from-layer="92" from-port="3" to-layer="93" to-port="0"/>
		<edge from-layer="93" from-port="1" to-layer="94" to-port="0"/>
		<edge from-layer="94" from-port="3" to-layer="95" to-port="0"/>
		<edge from-layer="95" from-port="1" to-layer="96" to-port="0"/>
		<edge from-layer="96" from-port="3" to-layer="97" to-port="0"/>
		<edge from-layer="97" from-port="1" to-layer="98" to-port="0"/>
		<edge from-layer="98" from-port="3" to-layer="99" to-port="0"/>
		<edge from-layer="99" from-port="1" to-layer="100" to-port="0"/>
		<edge from-layer="50" from-port="1" to-layer="101" to-port="0"/>
		<edge from-layer="53" from-port="1" to-layer="101" to-port="1"/>
		<edge from-layer="64" from-port="1" to-layer="101" to-port="2"/>
		<edge from-layer="73" from-port="1" to-layer="101" to-port="3"/>
		<edge from-layer="82" from-port="1" to-layer="101" to-port="4"/>
		<edge from-layer="91" from-port="1" to-layer="101" to-port="5"/>
		<edge from-layer="100" from-port="1" to-layer="101" to-port="6"/>
		<edge from-layer="47" from-port="1" to-layer="102" to-port="0"/>
		<edge from-layer="102" from-port="3" to-layer="103" to-port="0"/>
		<edge from-layer="103" from-port="1" to-layer="104" to-port="0"/>
		<edge from-layer="104" from-port="3" to-layer="105" to-port="0"/>
		<edge from-layer="105" from-port="1" to-layer="106" to-port="0"/>
		<edge from-layer="106" from-port="3" to-layer="107" to-port="0"/>
		<edge from-layer="107" from-port="1" to-layer="108" to-port="0"/>
		<edge from-layer="103" from-port="1" to-layer="109" to-port="0"/>
		<edge from-layer="109" from-port="3" to-layer="110" to-port="0"/>
		<edge from-layer="110" from-port="1" to-layer="111" to-port="0"/>
		<edge from-layer="111" from-port="3" to-layer="112" to-port="0"/>
		<edge from-layer="112" from-port="1" to-layer="113" to-port="0"/>
		<edge from-layer="61" from-port="1" to-layer="114" to-port="0"/>
		<edge from-layer="114" from-port="3" to-layer="115" to-port="0"/>
		<edge from-layer="115" from-port="1" to-layer="116" to-port="0"/>
		<edge from-layer="116" from-port="3" to-layer="117" to-port="0"/>
		<edge from-layer="117" from-port="1" to-layer="118" to-port="0"/>
		<edge from-layer="118" from-port="3" to-layer="119" to-port="0"/>
		<edge from-layer="119" from-port="1" to-layer="120" to-port="0"/>
		<edge from-layer="70" from-port="1" to-layer="121" to-port="0"/>
		<edge from-layer="121" from-port="3" to-layer="122" to-port="0"/>
		<edge from-layer="122" from-port="1" to-layer="123" to-port="0"/>
		<edge from-layer="123" from-port="3" to-layer="124" to-port="0"/>
		<edge from-layer="124" from-port="1" to-layer="125" to-port="0"/>
		<edge from-layer="125" from-port="3" to-layer="126" to-port="0"/>
		<edge from-layer="126" from-port="1" to-layer="127" to-port="0"/>
		<edge from-layer="79" from-port="1" to-layer="128" to-port="0"/>
		<edge from-layer="128" from-port="3" to-layer="129" to-port="0"/>
		<edge from-layer="129" from-port="1" to-layer="130" to-port="0"/>
		<edge from-layer="130" from-port="3" to-layer="131" to-port="0"/>
		<edge from-layer="131" from-port="1" to-layer="132" to-port="0"/>
		<edge from-layer="132" from-port="3" to-layer="133" to-port="0"/>
		<edge from-layer="133" from-port="1" to-layer="134" to-port="0"/>
		<edge from-layer="88" from-port="1" to-layer="135" to-port="0"/>
		<edge from-layer="135" from-port="3" to-layer="136" to-port="0"/>
		<edge from-layer="136" from-port="1" to-layer="137" to-port="0"/>
		<edge from-layer="137" from-port="3" to-layer="138" to-port="0"/>
		<edge from-layer="138" from-port="1" to-layer="139" to-port="0"/>
		<edge from-layer="139" from-port="3" to-layer="140" to-port="0"/>
		<edge from-layer="140" from-port="1" to-layer="141" to-port="0"/>
		<edge from-layer="97" from-port="1" to-layer="142" to-port="0"/>
		<edge from-layer="142" from-port="3" to-layer="143" to-port="0"/>
		<edge from-layer="143" from-port="1" to-layer="144" to-port="0"/>
		<edge from-layer="144" from-port="3" to-layer="145" to-port="0"/>
		<edge from-layer="145" from-port="1" to-layer="146" to-port="0"/>
		<edge from-layer="146" from-port="3" to-layer="147" to-port="0"/>
		<edge from-layer="147" from-port="1" to-layer="148" to-port="0"/>
		<edge from-layer="108" from-port="1" to-layer="149" to-port="0"/>
		<edge from-layer="113" from-port="1" to-layer="149" to-port="1"/>
		<edge from-layer="120" from-port="1" to-layer="149" to-port="2"/>
		<edge from-layer="127" from-port="1" to-layer="149" to-port="3"/>
		<edge from-layer="134" from-port="1" to-layer="149" to-port="4"/>
		<edge from-layer="141" from-port="1" to-layer="149" to-port="5"/>
		<edge from-layer="148" from-port="1" to-layer="149" to-port="6"/>
		<edge from-layer="149" from-port="7" to-layer="151" to-port="0"/>
		<edge from-layer="150" from-port="1" to-layer="151" to-port="1"/>
		<edge from-layer="151" from-port="2" to-layer="152" to-port="0"/>
		<edge from-layer="152" from-port="1" to-layer="153" to-port="0"/>
		<edge from-layer="47" from-port="1" to-layer="154" to-port="0"/>
		<edge from-layer="1" from-port="3" to-layer="154" to-port="1"/>
		<edge from-layer="47" from-port="1" to-layer="155" to-port="0"/>
		<edge from-layer="1" from-port="3" to-layer="155" to-port="1"/>
		<edge from-layer="61" from-port="1" to-layer="156" to-port="0"/>
		<edge from-layer="1" from-port="3" to-layer="156" to-port="1"/>
		<edge from-layer="70" from-port="1" to-layer="157" to-port="0"/>
		<edge from-layer="1" from-port="3" to-layer="157" to-port="1"/>
		<edge from-layer="79" from-port="1" to-layer="158" to-port="0"/>
		<edge from-layer="1" from-port="3" to-layer="158" to-port="1"/>
		<edge from-layer="88" from-port="1" to-layer="159" to-port="0"/>
		<edge from-layer="1" from-port="3" to-layer="159" to-port="1"/>
		<edge from-layer="97" from-port="1" to-layer="160" to-port="0"/>
		<edge from-layer="1" from-port="3" to-layer="160" to-port="1"/>
		<edge from-layer="154" from-port="2" to-layer="161" to-port="0"/>
		<edge from-layer="155" from-port="2" to-layer="161" to-port="1"/>
		<edge from-layer="156" from-port="2" to-layer="161" to-port="2"/>
		<edge from-layer="157" from-port="2" to-layer="161" to-port="3"/>
		<edge from-layer="158" from-port="2" to-layer="161" to-port="4"/>
		<edge from-layer="159" from-port="2" to-layer="161" to-port="5"/>
		<edge from-layer="160" from-port="2" to-layer="161" to-port="6"/>
		<edge from-layer="101" from-port="7" to-layer="162" to-port="0"/>
		<edge from-layer="153" from-port="1" to-layer="162" to-port="1"/>
		<edge from-layer="161" from-port="7" to-layer="162" to-port="2"/>
	</edges>
	<meta_data>
		<MO_version value="2019.1.0-178-ga427cda"/>
		<cli_parameters>
			<data_type value="FP32"/>
			<disable_fusing value="False"/>
			<disable_gfusing value="False"/>
			<disable_nhwc_to_nchw value="False"/>
			<disable_omitting_optional value="False"/>
			<disable_resnet_optimization value="False"/>
			<enable_concat_optimization value="False"/>
			<enable_flattening_nested_params value="False"/>
			<extensions value="DIR"/>
			<framework value="caffe"/>
			<generate_deprecated_IR_V2 value="False"/>
			<input value="data"/>
			<input_model value="DIR/model.caffemodel"/>
			<input_model_is_text value="False"/>
			<input_proto value="DIR/deploy.prototxt"/>
			<input_shape value="[1,3,384,672]"/>
			<k value="DIR/CustomLayersMapping.xml"/>
			<keep_shape_ops value="False"/>
			<legacy_mxnet_model value="False"/>
			<log_level value="ERROR"/>
			<mean_scale_values value="{'data': {'mean': array([ 88., 107., 102.]), 'scale': array([76.92307692])}}"/>
			<mean_values value="data[88.0,107.0,102.0]"/>
			<model_name value="face-detection-adas-0001"/>
			<move_to_preprocess value="False"/>
			<output value="['detection_out']"/>
			<output_dir value="DIR"/>
			<placeholder_shapes value="{'data': array([  1,   3, 384, 672])}"/>
			<remove_output_softmax value="False"/>
			<reverse_input_channels value="False"/>
			<save_params_from_nd value="False"/>
			<scale_values value="data[76.92307692307692]"/>
			<silent value="False"/>
			<version value="False"/>
			<unset unset_cli_parameters="batch, counts, finegrain_fusing, freeze_placeholder_with_value, input_checkpoint, input_meta_graph, input_symbol, mean_file, mean_file_offsets, nd_prefix_name, pretrained_model_name, saved_model_dir, saved_model_tags, scale, tensorboard_logdir, tensorflow_custom_layer_libraries, tensorflow_custom_operations_config_update, tensorflow_object_detection_api_pipeline_config, tensorflow_operation_patterns, tensorflow_subgraph_patterns, tensorflow_use_custom_operations_config"/>
		</cli_parameters>
	</meta_data>
</net>
