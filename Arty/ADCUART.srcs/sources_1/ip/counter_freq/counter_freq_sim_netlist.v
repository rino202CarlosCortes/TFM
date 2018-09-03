// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Tue Aug  7 15:31:51 2018
// Host        : siig running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim {C:/Users/Carlos/TFM/Nueva
//               carpeta/ADCUART/ADCUART/ADCUART.srcs/sources_1/ip/counter_freq/counter_freq_sim_netlist.v}
// Design      : counter_freq
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "counter_freq,c_counter_binary_v12_0_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_10,Vivado 2017.2" *) 
(* NotValidForBitStream *)
module counter_freq
   (CLK,
    CE,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) output [2:0]Q;

  wire CE;
  wire CLK;
  wire [2:0]Q;
  wire SCLR;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "3" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "101" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  counter_freq_c_counter_binary_v12_0_10 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "101" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "1" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "3" *) 
(* C_XDEVICEFAMILY = "spartan7" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_10" *) (* downgradeipidentifiedwarnings = "yes" *) 
module counter_freq_c_counter_binary_v12_0_10
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
  input [2:0]L;
  output THRESH0;
  output [2:0]Q;

  wire \<const1> ;
  wire CE;
  wire CLK;
  wire [2:0]Q;
  wire SCLR;
  wire NLW_i_synth_THRESH0_UNCONNECTED;

  assign THRESH0 = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "3" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "101" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  counter_freq_c_counter_binary_v12_0_10_viv i_synth
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
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
l1NG3g81+vM8a/OECNXckQ6Ih+534PcHu9If3GBzfNiHrQt4ZqWyOCmUfR9HBrKJ6dazleZpBLLQ
VkjiEZOvOw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Z0LH98ijrG2zSKQ428sLNLNN8LOYW53zGTr9NWQ16ZrFJS/8H+Sypz2sLY7sCYpj+gN48UB+J20x
PvOEIxFZVPZNmhrcvIxztIiTduaVtyypOS3Jx8r3YE6fOwVJrfZ9eXRQUIdKvbN0bVZFUcjZ2HOu
2IHyG/UIDoelWrgO0GY=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
QNC1y7mnDIW3BeoEUG5xtIOyuA9VVC6sNeWDOT6S5qoB4e5s9LHwLIGpByH8Fz0PGaafc2Pp1LqC
lzXnevLntdeO+Pz1NMCI4Ojicg8oWhR3msMyGBNzheYZMtUoYnT2zC0eafrxC+G2D8yNbUPHtf++
Y0MP0FYlKg8jJhDSX3w=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bRemsiwW6AApgQWC90BqiBlMFD2jEWM37Ph/oR3/T151pMQpEWD3gu3SGbUebLL6tc97cE/PgSCy
KS0n/kkTjP8yz3D6tbz01kj9QAWvzzWfukcjy4U1p/TuuIIUFcvoH/P+MznfeFrHL11ZwDgOg40p
h2VhrJPIbdfbr6mfhPFTBuWKYDGmQfgZeWyn7BSTLS+wvNUS+AvTJnaPj6O9Szcq/v+sphPqX1F0
wfrQOmRJVSa2EfFZxZ1m3+2NmDfYPFsxF203jiTh4pJ8JuezHfzsaK6jbmB9h7QKD6yMUsYRx/O3
idyz3Inko4ZzfMIyZuEPWm6TSA5xk5DeltwcSw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QxSXl52RB2cLbPW8z4SvG8lZpaZT78HIOf6Q3fEiSBBQziVQn5oJPSJW8PdmH2pB/aVZpPeDnm2a
hpp7ddkUsyA+NHykeuxUJfwhWYhyemZLGnSdZXVpbaOhu0TLJiOtAVsDmRdPFs7q6CpwvvPImbuY
YK29r9Mw8w6ATmDgWgWs+wefEAeKjvUWKQmUr9SKi88H0j+hCCdtMoYZnO8+mjtjWlqm6U7NqCPr
K58IyvSojGlh7czWW8xHzOdgUBj872QexFBFCXAZ3caYI+I5tgzbPak7R4g1nHKG2e2HAjefrx2S
bXb3PhWqaTkKbnVCol5mWJuxPclCBxrEtqSjug==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cz5g65hbB8shmQPsohjzVr+SPRr5lrGQqqziYjnrsCWqDM27xVRVWn5/2voSXHOso9pm8+P7GN+L
Mz6Nn/qXS+pi/muryE2WEZ1r1ya1OKX8h7vIWuyvbtfcgSkvPQb+oNRpZXNONTBmmBFus8k0rin2
VJPxBV5qCpoPGWDVS1QCTJ852TyqzdEMM2h/x7mD8lHifZIkjoWi+O8HkWSf1j2JrYg2fikk0O71
heaF0CkbjGmy7ezg8wpLUywMgWUhCjFFanO1rqzaTEvWYxCjx+FFJRXRyfP3qUeBqMaTvZsGSDDl
/9EG0TehdoOmg4VPXawJiGfiqr2sBbg7f0zlow==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
FJ+MKqmoE2gmsOc23TJCSgaZIRMaA+D8ox5vTVTWjhXa4jGHU4vUivfdwf4Ys/oKoI0ii8IT71gs
fJ9mgU9Ut3/QhXPVwHKhwn1q+5keemQxyGrZoUtoMWhQgbsHzt5t9BhEM9jwXNIqceHiKgIILjWn
ebnnjYS/Nm9aTE+uu5goPwjPlY7YmUYhqaqG3Fb2fxGZGvg/riLAtHk2YJtq9Hbr3rx6iDrFPiWM
ttp7krxqOXB65UzAMR4gn+dsad7uz+BBY+2DSnovilkdzp34gTe0MInEDSqedbB+eeZh/1JJhNjU
xAoIVPTH7dFAqH/faCdiKdPzSCoZO6dxv18EzQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
JzSEYMEJgWmK33Vti9P3UPSnZM//QoxA6tXb2951eAHltPLMgytGgv3sIFQzB51Lb2dg3jltStEW
7Te28b6sWUnig7/K5cnQipDoAkzv9qLjSSBEgj0Y58bD7L+9bSGVO9bjhx3MUOGKyxQCIZPhLca5
ipOhKbEUHcmU8ECbtRKnkOkooyPqCFFwyNJE/zr3R23LtXRst258NesUdHqORWYtT/lzo1KIWbJQ
e2cMr/7Z4YixBHzBqNHMkuhohm3xQGz/2vfbB1c6S4C9AHmHk0K6qR/wdQnrcK41E/7jXbGffxO2
ePYCLBgT28SbL4JLH6slUzK/cbQItleL9Nvqdg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 5216)
`pragma protect data_block
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
JLZ6r4NGixpDvbOdxWhfvd5wyeiB14K8Ni4AiDc=
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
