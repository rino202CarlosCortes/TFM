// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Mon Jul 23 19:27:39 2018
// Host        : siig running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim {c:/Users/Carlos/TFM/Nueva
//               carpeta/ADCUART/ADCUART/ADCUART.srcs/sources_1/ip/c_counter_binary_0/c_counter_binary_0_sim_netlist.v}
// Design      : c_counter_binary_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_0,c_counter_binary_v12_0_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_10,Vivado 2017.2" *) 
(* NotValidForBitStream *)
module c_counter_binary_0
   (CLK,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) output [0:0]Q;

  wire CLK;
  wire [0:0]Q;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_COUNT_BY = "1" *) 
  (* C_COUNT_MODE = "0" *) 
  (* C_COUNT_TO = "1" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_LOAD = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_HAS_THRESH0 = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_LOAD_LOW = "0" *) 
  (* C_RESTRICT_COUNT = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_THRESH0_VALUE = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "1" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_0_c_counter_binary_v12_0_10 U0
       (.CE(1'b1),
        .CLK(CLK),
        .L(1'b0),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "0" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "1" *) 
(* C_XDEVICEFAMILY = "spartan7" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_10" *) (* downgradeipidentifiedwarnings = "yes" *) 
module c_counter_binary_0_c_counter_binary_v12_0_10
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [0:0]L;
  output THRESH0;
  output [0:0]Q;

  wire \<const1> ;
  wire CLK;
  wire [0:0]Q;
  wire NLW_i_synth_THRESH0_UNCONNECTED;

  assign THRESH0 = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_COUNT_BY = "1" *) 
  (* C_COUNT_MODE = "0" *) 
  (* C_COUNT_TO = "1" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_LOAD = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_HAS_THRESH0 = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_LOAD_LOW = "0" *) 
  (* C_RESTRICT_COUNT = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_THRESH0_VALUE = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "1" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_0_c_counter_binary_v12_0_10_viv i_synth
       (.CE(1'b0),
        .CLK(CLK),
        .L(1'b0),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_i_synth_THRESH0_UNCONNECTED),
        .UP(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
OMuhAFqEIDJP0xdMiWI6RjtlV4+Iejn0Ueify41Co19vXzbUpp/RgrWWmTx/n9IaxVrx2JsjdfwW
VTad5WGg3A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
GYQX2mGHh7zxAw4+XH9l7QfbFrflPBxdHW+OnKQiXFp0+28ZkGWHlpF+rFs6t1H14Jbn8YD9XAJ6
kpH0/Er3X/miL4kGOQYQF/ZNuZ+keJDSTsqLqHoc6nGS8vJObzXX7H7RDUBDAb4onG+KpQHI5gYO
8HTx4haBrxIMGXHLTc8=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
CVZj2XmJb5KhF7Oi/o3kx2pVB9sNhzj2nZftrtERaP5pQQsaoUJNUwYboJOMfqcAGrBzTHIa6+tH
EtFw65bRtXeQm8YIH1h1JeDvBkyy1uRmVc5JMclUUUL11ZlKKgKAaaejugb6LjRpL5uts3z2DXAt
Th1TBr8ZS+4XvKTT1g8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ZIdW+sFnmQLg5LFAczPAXPe07PLb6V8ihc+tUcKPcVKc1BeSLy/IH+Fa/nL4eSdE5TtFt5DcxZF5
6AsKp0qxmQZr2bRyPVNe+tcBsprw2keIOjnbZ0J98nHiOSVvYLIvdok5/0z3eXhxNSafXY4FQfMP
52p/2pTNpsot5sHB2pj5AOagCHPA43vFdUG0kBMymKHvcsa1i0b5hHZ+Y6vIyWm85EDY/g2evmtc
b6mj9bITsP3iur5Xi7QPBHsNUgvW/72OetP0JNDX4KZEM7EYu/hTtbMxTCAbB+flltw82T74wsUx
bRgIDMceqr9n0HvofFqefU9t/LhY5OphGwLBew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
sZD8C54fUjXkYBw37pXq4tpZgU2xqw3R8W6ujH/6dmGDDu5tNFdgB9xWa4z7QGBveo+Jr85HsJrP
Uiw3BD24o86KOiWJZgBhUXn4hki7cCd6HcPhleTEoIBISTRgVkHArmio0mtxCKorwFbpBdz/TsFR
7MfWkuvak6bEedhLloGhFhUVVW5xuM5lLr10MpLT00hOXcmXcGngDITtOdQmwOck88t7nE7RMnIV
QfaUd1i56Ff9xkp57BgYwJVQh7gdX+J4yE3Y1DyWxMyo8wE9FaKN5FA/NO+Yq4rG3CSKaSeUi7gp
PnibvUYxxRo7CqnF7sJzpXa55kXNd84F4WZjyQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jLAwV8S8Tbspc1wazwKotE71H2eMwGRdf7q0P1KcQaq6dTBOkhzmWS3pHK6ssM/xMtbx8PzWtfIU
2pBoU2ihe+EPqYbCkhSwd2gamf/zau/IAmCjefZjGXvQfnoZHr7ysnHyrSTkvc77FyKKpDUCT+oX
CEE+xUqJ4G3vPpmF4DK3uLEz6ysVZNEP7dQhc/Xi/98ALAM6PcXboXMitr3XMsr0ZgtTrs8zaiN7
gdzMQnl0xWdJftuxrmXgCO+HBvzTjFQk92QWsebbPUZQUQ6OxzXtnD9OQrowbKD2s/D15Xmv2S5R
KUiAL4DmXvIjrgqodVVx9bQWDc9hlVDsAinCjg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
C7akVFrrFsR2slQxtcYqc5mucpLiYQaAGnqhdxWXRj5DI5O5RMr9rIiV/zIh8uQq2GL2NEUUtVdi
XpDTneZtNj6Ym/Qk1EfVf+3rJP4JIALyzJTdC8/nr9czgg3wAQfbKAqvkKLhVrONRixkdjym9PvW
SJYXlFvB115RT7G58xNmkIDLYSgCdrngcrHVcsNSNNVRWC7xN4u0JC+38YlDLQhglrO5G8qQXrVN
EP1iWdmDSfxCygZdsVA0HluirogJXl1iKE1Sui33lHeD3dpHfr68OLPodJmD1eCjqxwuRIKWpKra
G7p1QqCoOfinC1fbd02afaIXEAKEJtnlv99F9w==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
DCbpB9RPxZ12U5gKiPNiCgCGt3GRnc7iDCBc7fMo+0a6wiBttlnq5XNHWG3+R7ThZsZPRRNVdNzk
3vCM529XezTM2G5bJh6+Mb5+TeUbpGVatevU5Fw9UJ88i8N5q08ecEcxjitHvXCKKyf2x5vMj3vh
yQuXyfxfVq668DMrbKL5qV430tyZCFUL6UwrVWVNrAubqvg8rCHgqGGebJTvr8OKgerUm7pZIOi3
A8YoLFDVZVs7k13eGALuY9LatTJv1KkgMPhA6+kFUJYlIlho7hc8XtsTnhTTs10YddZ5Smz52S8/
sr46vRxfqBeIollHCq1qB6MUlmNQD2Pe1geepw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2544)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
