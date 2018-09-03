// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Mon Jul 23 17:44:52 2018
// Host        : siig running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim {c:/Users/Carlos/TFM/Nueva
//               carpeta/ADCUART/ADCUART/ADCUART.srcs/sources_1/ip/bigcounter/bigcounter_sim_netlist.v}
// Design      : bigcounter
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bigcounter,c_counter_binary_v12_0_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_10,Vivado 2017.2" *) 
(* NotValidForBitStream *)
module bigcounter
   (CLK,
    CE,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) output [31:0]Q;

  wire CE;
  wire CLK;
  wire [31:0]Q;
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
  (* C_WIDTH = "32" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  bigcounter_c_counter_binary_v12_0_10 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "32" *) 
(* C_XDEVICEFAMILY = "spartan7" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_10" *) (* downgradeipidentifiedwarnings = "yes" *) 
module bigcounter_c_counter_binary_v12_0_10
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
  input [31:0]L;
  output THRESH0;
  output [31:0]Q;

  wire \<const1> ;
  wire CE;
  wire CLK;
  wire [31:0]Q;
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
  (* C_WIDTH = "32" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  bigcounter_c_counter_binary_v12_0_10_viv i_synth
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
hpOZ44SCUVjIgRe08HtAkAtQ4b+IziZfn7fiYu52ZiH07jhuU+lbzEmJ708YqYjdKnA2K8EtqsNd
Io80Vh2+CoUjhbc0038O2xID0Ra/P1XTjCxMeWnq7ievWPkRdsBUVlofjEj+D3rU7w0/gQpyko9X
EjTqGOgycGSdwOkrr+DtMLTY8pribXjoNguUc5ftvW3j2guI6D+foNAsuQcTcfd52y+OgOpm/9+u
pLM7xpzdHvoq/3Z+euR/9JNya8itxMDzkMfj8cq9aydn0qpHWr1z7vq24niRRnQWXmU/SEfuaGvk
bcRadshszO49rbec7G4mXpGVwlt9ngtj47lOEA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
PMTyXnSJ/70T2hxvMrKpcxmKBobvZyHol7WDqRzxFOfLWCYDGcPmWcJCFjK8iNTumLitob/Bne09
xzv/GUj2lLR2fgxKnMJAP9lM1fqVBtBseo4HPbZwQKNyPaf5hOhkukC1UkgsHddixligU1Zd/EkL
3fkkJQag2KsdpehhQElSqBgrGYCNU1KEWiYWRSx5iVEwXfdSFVgjG8FodtVTeIClUaFNgnyNLmFM
50tgQRNnJuJz9MmmR25I8IsBtbuL2048Nhwnd7mjjCZxvKZbmdnVvAKEdm4/bbABwW0bGmMcNQ/i
MZ8e+UKOzobesNkN/MZHLc8g731HdBYKH7Q3xg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17648)
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
