-- megafunction wizard: %RAM: 2-PORT%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: altdpram 

-- ============================================================
-- File Name: mem.vhd
-- Megafunction Name(s):
-- 			altdpram
--
-- Simulation Library Files(s):
-- 			altera_mf
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 9.1 Build 222 10/21/2009 SJ Web Edition
-- ************************************************************


--Copyright (C) 1991-2009 Altera Corporation
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, Altera MegaCore Function License 
--Agreement, or other applicable license agreement, including, 
--without limitation, that your use is for the sole purpose of 
--programming logic devices manufactured by Altera and sold by 
--Altera or its authorized distributors.  Please refer to the 
--applicable agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY mem IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		rdaddress		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		rden		: IN STD_LOGIC  := '1';
		wraddress		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		wren		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END mem;


ARCHITECTURE SYN OF mem IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (15 DOWNTO 0);



	COMPONENT altdpram
	GENERIC (
		indata_aclr		: STRING;
		indata_reg		: STRING;
		intended_device_family		: STRING;
		lpm_type		: STRING;
		outdata_aclr		: STRING;
		outdata_reg		: STRING;
		rdaddress_aclr		: STRING;
		rdaddress_reg		: STRING;
		rdcontrol_aclr		: STRING;
		rdcontrol_reg		: STRING;
		use_eab		: STRING;
		width		: NATURAL;
		widthad		: NATURAL;
		wraddress_aclr		: STRING;
		wraddress_reg		: STRING;
		wrcontrol_aclr		: STRING;
		wrcontrol_reg		: STRING
	);
	PORT (
			outclock	: IN STD_LOGIC ;
			wren	: IN STD_LOGIC ;
			inclock	: IN STD_LOGIC ;
			q	: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
			rden	: IN STD_LOGIC ;
			data	: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			rdaddress	: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			wraddress	: IN STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	q    <= sub_wire0(15 DOWNTO 0);

	altdpram_component : altdpram
	GENERIC MAP (
		indata_aclr => "OFF",
		indata_reg => "INCLOCK",
		intended_device_family => "MAX II",
		lpm_type => "altdpram",
		outdata_aclr => "OFF",
		outdata_reg => "OUTCLOCK",
		rdaddress_aclr => "OFF",
		rdaddress_reg => "INCLOCK",
		rdcontrol_aclr => "OFF",
		rdcontrol_reg => "INCLOCK",
		use_eab => "OFF",
		width => 16,
		widthad => 4,
		wraddress_aclr => "OFF",
		wraddress_reg => "INCLOCK",
		wrcontrol_aclr => "OFF",
		wrcontrol_reg => "INCLOCK"
	)
	PORT MAP (
		outclock => clock,
		wren => wren,
		inclock => clock,
		rden => rden,
		data => data,
		rdaddress => rdaddress,
		wraddress => wraddress,
		q => sub_wire0
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: ADDRESSSTALL_A NUMERIC "0"
-- Retrieval info: PRIVATE: ADDRESSSTALL_B NUMERIC "0"
-- Retrieval info: PRIVATE: BYTEENA_ACLR_A NUMERIC "0"
-- Retrieval info: PRIVATE: BYTEENA_ACLR_B NUMERIC "0"
-- Retrieval info: PRIVATE: BYTE_ENABLE_A NUMERIC "0"
-- Retrieval info: PRIVATE: BYTE_ENABLE_B NUMERIC "0"
-- Retrieval info: PRIVATE: BYTE_SIZE NUMERIC "1"
-- Retrieval info: PRIVATE: BlankMemory NUMERIC "1"
-- Retrieval info: PRIVATE: CLOCK_ENABLE_INPUT_A NUMERIC "0"
-- Retrieval info: PRIVATE: CLOCK_ENABLE_INPUT_B NUMERIC "0"
-- Retrieval info: PRIVATE: CLOCK_ENABLE_OUTPUT_A NUMERIC "0"
-- Retrieval info: PRIVATE: CLOCK_ENABLE_OUTPUT_B NUMERIC "0"
-- Retrieval info: PRIVATE: CLRdata NUMERIC "0"
-- Retrieval info: PRIVATE: CLRq NUMERIC "0"
-- Retrieval info: PRIVATE: CLRrdaddress NUMERIC "0"
-- Retrieval info: PRIVATE: CLRrren NUMERIC "0"
-- Retrieval info: PRIVATE: CLRwraddress NUMERIC "0"
-- Retrieval info: PRIVATE: CLRwren NUMERIC "0"
-- Retrieval info: PRIVATE: Clock NUMERIC "0"
-- Retrieval info: PRIVATE: Clock_A NUMERIC "0"
-- Retrieval info: PRIVATE: Clock_B NUMERIC "0"
-- Retrieval info: PRIVATE: ECC NUMERIC "0"
-- Retrieval info: PRIVATE: IMPLEMENT_IN_LES NUMERIC "0"
-- Retrieval info: PRIVATE: INDATA_ACLR_B NUMERIC "0"
-- Retrieval info: PRIVATE: INDATA_REG_B NUMERIC "1"
-- Retrieval info: PRIVATE: INIT_FILE_LAYOUT STRING "PORT_A"
-- Retrieval info: PRIVATE: INIT_TO_SIM_X NUMERIC "0"
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "MAX II"
-- Retrieval info: PRIVATE: JTAG_ENABLED NUMERIC "0"
-- Retrieval info: PRIVATE: JTAG_ID STRING "NONE"
-- Retrieval info: PRIVATE: MAXIMUM_DEPTH NUMERIC "0"
-- Retrieval info: PRIVATE: MEMSIZE NUMERIC "256"
-- Retrieval info: PRIVATE: MEM_IN_BITS NUMERIC "0"
-- Retrieval info: PRIVATE: MIFfilename STRING ""
-- Retrieval info: PRIVATE: OPERATION_MODE NUMERIC "2"
-- Retrieval info: PRIVATE: OUTDATA_ACLR_B NUMERIC "0"
-- Retrieval info: PRIVATE: OUTDATA_REG_B NUMERIC "1"
-- Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "0"
-- Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_MIXED_PORTS NUMERIC "0"
-- Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_PORT_A NUMERIC "4"
-- Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_PORT_B NUMERIC "4"
-- Retrieval info: PRIVATE: REGdata NUMERIC "1"
-- Retrieval info: PRIVATE: REGq NUMERIC "1"
-- Retrieval info: PRIVATE: REGrdaddress NUMERIC "1"
-- Retrieval info: PRIVATE: REGrren NUMERIC "1"
-- Retrieval info: PRIVATE: REGwraddress NUMERIC "1"
-- Retrieval info: PRIVATE: REGwren NUMERIC "1"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: USE_DIFF_CLKEN NUMERIC "0"
-- Retrieval info: PRIVATE: UseDPRAM NUMERIC "1"
-- Retrieval info: PRIVATE: VarWidth NUMERIC "0"
-- Retrieval info: PRIVATE: WIDTH_READ_A NUMERIC "16"
-- Retrieval info: PRIVATE: WIDTH_READ_B NUMERIC "16"
-- Retrieval info: PRIVATE: WIDTH_WRITE_A NUMERIC "16"
-- Retrieval info: PRIVATE: WIDTH_WRITE_B NUMERIC "16"
-- Retrieval info: PRIVATE: WRADDR_ACLR_B NUMERIC "0"
-- Retrieval info: PRIVATE: WRADDR_REG_B NUMERIC "1"
-- Retrieval info: PRIVATE: WRCTRL_ACLR_B NUMERIC "0"
-- Retrieval info: PRIVATE: enable NUMERIC "0"
-- Retrieval info: PRIVATE: rden NUMERIC "1"
-- Retrieval info: CONSTANT: INDATA_ACLR STRING "OFF"
-- Retrieval info: CONSTANT: INDATA_REG STRING "INCLOCK"
-- Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "MAX II"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "altdpram"
-- Retrieval info: CONSTANT: OUTDATA_ACLR STRING "OFF"
-- Retrieval info: CONSTANT: OUTDATA_REG STRING "OUTCLOCK"
-- Retrieval info: CONSTANT: RDADDRESS_ACLR STRING "OFF"
-- Retrieval info: CONSTANT: RDADDRESS_REG STRING "INCLOCK"
-- Retrieval info: CONSTANT: RDCONTROL_ACLR STRING "OFF"
-- Retrieval info: CONSTANT: RDCONTROL_REG STRING "INCLOCK"
-- Retrieval info: CONSTANT: USE_EAB STRING "OFF"
-- Retrieval info: CONSTANT: WIDTH NUMERIC "16"
-- Retrieval info: CONSTANT: WIDTHAD NUMERIC "4"
-- Retrieval info: CONSTANT: WRADDRESS_ACLR STRING "OFF"
-- Retrieval info: CONSTANT: WRADDRESS_REG STRING "INCLOCK"
-- Retrieval info: CONSTANT: WRCONTROL_ACLR STRING "OFF"
-- Retrieval info: CONSTANT: WRCONTROL_REG STRING "INCLOCK"
-- Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL clock
-- Retrieval info: USED_PORT: data 0 0 16 0 INPUT NODEFVAL data[15..0]
-- Retrieval info: USED_PORT: q 0 0 16 0 OUTPUT NODEFVAL q[15..0]
-- Retrieval info: USED_PORT: rdaddress 0 0 4 0 INPUT NODEFVAL rdaddress[3..0]
-- Retrieval info: USED_PORT: rden 0 0 0 0 INPUT VCC rden
-- Retrieval info: USED_PORT: wraddress 0 0 4 0 INPUT NODEFVAL wraddress[3..0]
-- Retrieval info: USED_PORT: wren 0 0 0 0 INPUT VCC wren
-- Retrieval info: CONNECT: @data 0 0 16 0 data 0 0 16 0
-- Retrieval info: CONNECT: q 0 0 16 0 @q 0 0 16 0
-- Retrieval info: CONNECT: @wraddress 0 0 4 0 wraddress 0 0 4 0
-- Retrieval info: CONNECT: @rdaddress 0 0 4 0 rdaddress 0 0 4 0
-- Retrieval info: CONNECT: @wren 0 0 0 0 wren 0 0 0 0
-- Retrieval info: CONNECT: @rden 0 0 0 0 rden 0 0 0 0
-- Retrieval info: CONNECT: @inclock 0 0 0 0 clock 0 0 0 0
-- Retrieval info: CONNECT: @outclock 0 0 0 0 clock 0 0 0 0
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: GEN_FILE: TYPE_NORMAL mem.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL mem.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL mem.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL mem.bsf TRUE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL mem_inst.vhd FALSE
-- Retrieval info: LIB_FILE: altera_mf
