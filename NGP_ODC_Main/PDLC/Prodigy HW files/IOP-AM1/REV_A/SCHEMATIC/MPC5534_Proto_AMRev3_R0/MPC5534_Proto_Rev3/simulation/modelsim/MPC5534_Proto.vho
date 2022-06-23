-- Copyright (C) 1991-2011 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 11.1 Build 259 01/25/2012 Service Pack 2 SJ Web Edition"

-- DATE "04/18/2012 08:58:00"

-- 
-- Device: Altera EPM3064ATC44-10 Package TQFP44
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAX;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAX.MAX_COMPONENTS.ALL;

ENTITY 	MPC5534_Proto IS
    PORT (
	HEALTHY_INV : OUT std_logic;
	CONTROL_INV : OUT std_logic;
	HEALTHY : OUT std_logic;
	CONTROL : OUT std_logic;
	READY_LED : OUT std_logic;
	ACTIVE_LED : OUT std_logic;
	I_AM_HEALTHY : IN std_logic;
	TAKE_CONTROL : IN std_logic;
	MPC_CLK_OUT : IN std_logic;
	MPC_ENG_CLK : IN std_logic;
	MPC_RESET_NOT : IN std_logic;
	RST_OUT_NOT : IN std_logic;
	APP1_OPN_EN_NOT : IN std_logic;
	APP2_OPN_EN_NOT : IN std_logic;
	ESC1_WDI_CPLD : IN std_logic;
	ESC2_WDI_CPLD : IN std_logic;
	ESC1_GPIO : IN std_logic;
	ESC2_GPIO : IN std_logic;
	IOP_TO_IOP_SRH1 : IN std_logic;
	IOP_TO_IOP_SRH2 : IN std_logic;
	IOP_TO_IOP_SRH3 : IN std_logic;
	IOP_TO_IOP_SRH4 : IN std_logic;
	PEER_IN_CONTROL : IN std_logic;
	IN_CONTROL : IN std_logic;
	PLD_SPARE2 : IN std_logic;
	PLD_SPARE1 : IN std_logic
	);
END MPC5534_Proto;

-- Design Ports Information
-- I_AM_HEALTHY	=>  Location: PIN_44
-- TAKE_CONTROL	=>  Location: PIN_6
-- MPC_CLK_OUT	=>  Location: PIN_40
-- MPC_ENG_CLK	=>  Location: PIN_37
-- MPC_RESET_NOT	=>  Location: PIN_42
-- RST_OUT_NOT	=>  Location: PIN_39
-- APP1_OPN_EN_NOT	=>  Location: PIN_3
-- APP2_OPN_EN_NOT	=>  Location: PIN_5
-- ESC1_WDI_CPLD	=>  Location: PIN_8
-- ESC2_WDI_CPLD	=>  Location: PIN_10
-- ESC1_GPIO	=>  Location: PIN_12
-- ESC2_GPIO	=>  Location: PIN_13
-- IOP_TO_IOP_SRH1	=>  Location: PIN_14
-- IOP_TO_IOP_SRH2	=>  Location: PIN_15
-- IOP_TO_IOP_SRH3	=>  Location: PIN_33
-- IOP_TO_IOP_SRH4	=>  Location: PIN_31
-- PEER_IN_CONTROL	=>  Location: PIN_35
-- IN_CONTROL	=>  Location: PIN_34
-- PLD_SPARE2	=>  Location: PIN_19
-- PLD_SPARE1	=>  Location: PIN_18
-- HEALTHY_INV	=>  Location: PIN_25
-- CONTROL_INV	=>  Location: PIN_21
-- HEALTHY	=>  Location: PIN_27
-- CONTROL	=>  Location: PIN_22
-- READY_LED	=>  Location: PIN_23
-- ACTIVE_LED	=>  Location: PIN_20


ARCHITECTURE structure OF MPC5534_Proto IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_HEALTHY_INV : std_logic;
SIGNAL ww_CONTROL_INV : std_logic;
SIGNAL ww_HEALTHY : std_logic;
SIGNAL ww_CONTROL : std_logic;
SIGNAL ww_READY_LED : std_logic;
SIGNAL ww_ACTIVE_LED : std_logic;
SIGNAL ww_I_AM_HEALTHY : std_logic;
SIGNAL ww_TAKE_CONTROL : std_logic;
SIGNAL ww_MPC_CLK_OUT : std_logic;
SIGNAL ww_MPC_ENG_CLK : std_logic;
SIGNAL ww_MPC_RESET_NOT : std_logic;
SIGNAL ww_RST_OUT_NOT : std_logic;
SIGNAL ww_APP1_OPN_EN_NOT : std_logic;
SIGNAL ww_APP2_OPN_EN_NOT : std_logic;
SIGNAL ww_ESC1_WDI_CPLD : std_logic;
SIGNAL ww_ESC2_WDI_CPLD : std_logic;
SIGNAL ww_ESC1_GPIO : std_logic;
SIGNAL ww_ESC2_GPIO : std_logic;
SIGNAL ww_IOP_TO_IOP_SRH1 : std_logic;
SIGNAL ww_IOP_TO_IOP_SRH2 : std_logic;
SIGNAL ww_IOP_TO_IOP_SRH3 : std_logic;
SIGNAL ww_IOP_TO_IOP_SRH4 : std_logic;
SIGNAL ww_PEER_IN_CONTROL : std_logic;
SIGNAL ww_IN_CONTROL : std_logic;
SIGNAL ww_PLD_SPARE2 : std_logic;
SIGNAL ww_PLD_SPARE1 : std_logic;
SIGNAL \HealthyLogic_inst|inst_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst4_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst4_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst4_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst4_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst4_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst4_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst4_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst4_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst4_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst4_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst4_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst23~1_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst23~1_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst23~1_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst23~1_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst23~1_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst23~1_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst23~1_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst23~1_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst23~1_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst23~1_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst23~1_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst24~1_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst24~1_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst24~1_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst24~1_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst24~1_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst24~1_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst24~1_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst24~1_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst24~1_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst24~1_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst24~1_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~1_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst12~0bal_pterm0_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst12~0bal_pterm1_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst12~0bal_pterm2_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst12~0bal_pterm3_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst12~0bal_pterm4_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst12~0bal_pterm5_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst12~0bal_pxor_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst12~0bal_pclk_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst12~0bal_pena_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst12~0bal_paclr_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \HealthyLogic_inst|inst12~0bal_papre_bus\ : std_logic_vector(51 DOWNTO 0);
SIGNAL \~GND~0~dataout\ : std_logic;
SIGNAL \~GND~1~dataout\ : std_logic;
SIGNAL \TAKE_CONTROL~dataout\ : std_logic;
SIGNAL \I_AM_HEALTHY~dataout\ : std_logic;
SIGNAL \MPC_RESET_NOT~dataout\ : std_logic;
SIGNAL \RST_OUT_NOT~dataout\ : std_logic;
SIGNAL \APP1_OPN_EN_NOT~dataout\ : std_logic;
SIGNAL \APP2_OPN_EN_NOT~dataout\ : std_logic;
SIGNAL \HealthyLogic_inst|inst12~0bal_dataout\ : std_logic;
SIGNAL \HealthyLogic_inst|inst~dataout\ : std_logic;
SIGNAL \PEER_IN_CONTROL~dataout\ : std_logic;
SIGNAL \PLD_SPARE1~dataout\ : std_logic;
SIGNAL \HealthyLogic_inst|inst4~dataout\ : std_logic;
SIGNAL \HealthyLogic_inst|inst23~1_dataout\ : std_logic;
SIGNAL \HealthyLogic_inst|inst24~1_dataout\ : std_logic;
SIGNAL \HealthyLogic_inst|ALT_INV_inst4~dataout\ : std_logic;
SIGNAL \ALT_INV_APP1_OPN_EN_NOT~dataout\ : std_logic;
SIGNAL \ALT_INV_APP2_OPN_EN_NOT~dataout\ : std_logic;
SIGNAL \ALT_INV_PEER_IN_CONTROL~dataout\ : std_logic;
SIGNAL \ALT_INV_PLD_SPARE1~dataout\ : std_logic;

BEGIN

HEALTHY_INV <= ww_HEALTHY_INV;
CONTROL_INV <= ww_CONTROL_INV;
HEALTHY <= ww_HEALTHY;
CONTROL <= ww_CONTROL;
READY_LED <= ww_READY_LED;
ACTIVE_LED <= ww_ACTIVE_LED;
ww_I_AM_HEALTHY <= I_AM_HEALTHY;
ww_TAKE_CONTROL <= TAKE_CONTROL;
ww_MPC_CLK_OUT <= MPC_CLK_OUT;
ww_MPC_ENG_CLK <= MPC_ENG_CLK;
ww_MPC_RESET_NOT <= MPC_RESET_NOT;
ww_RST_OUT_NOT <= RST_OUT_NOT;
ww_APP1_OPN_EN_NOT <= APP1_OPN_EN_NOT;
ww_APP2_OPN_EN_NOT <= APP2_OPN_EN_NOT;
ww_ESC1_WDI_CPLD <= ESC1_WDI_CPLD;
ww_ESC2_WDI_CPLD <= ESC2_WDI_CPLD;
ww_ESC1_GPIO <= ESC1_GPIO;
ww_ESC2_GPIO <= ESC2_GPIO;
ww_IOP_TO_IOP_SRH1 <= IOP_TO_IOP_SRH1;
ww_IOP_TO_IOP_SRH2 <= IOP_TO_IOP_SRH2;
ww_IOP_TO_IOP_SRH3 <= IOP_TO_IOP_SRH3;
ww_IOP_TO_IOP_SRH4 <= IOP_TO_IOP_SRH4;
ww_PEER_IN_CONTROL <= PEER_IN_CONTROL;
ww_IN_CONTROL <= IN_CONTROL;
ww_PLD_SPARE2 <= PLD_SPARE2;
ww_PLD_SPARE1 <= PLD_SPARE1;

\HealthyLogic_inst|inst_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\HealthyLogic_inst|inst_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \TAKE_CONTROL~dataout\);

\HealthyLogic_inst|inst_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\HealthyLogic_inst|inst_paclr_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \HealthyLogic_inst|inst12~0bal_dataout\);

\HealthyLogic_inst|inst_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst4_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst4_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \PEER_IN_CONTROL~dataout\ & NOT \HealthyLogic_inst|inst4~dataout\);

\HealthyLogic_inst|inst4_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst4_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst4_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst4_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst4_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst4_pclk_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \TAKE_CONTROL~dataout\);

\HealthyLogic_inst|inst4_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\HealthyLogic_inst|inst4_paclr_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \PLD_SPARE1~dataout\);

\HealthyLogic_inst|inst4_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst23~1_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst23~1_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \HealthyLogic_inst|inst4~dataout\ & \HealthyLogic_inst|inst~dataout\);

\HealthyLogic_inst|inst23~1_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst23~1_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst23~1_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst23~1_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst23~1_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst23~1_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst23~1_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\HealthyLogic_inst|inst23~1_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst23~1_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst24~1_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst24~1_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & \HealthyLogic_inst|inst4~dataout\ & \HealthyLogic_inst|inst~dataout\);

\HealthyLogic_inst|inst24~1_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst24~1_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst24~1_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst24~1_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst24~1_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst24~1_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst24~1_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\HealthyLogic_inst|inst24~1_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst24~1_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\~GND~0_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~0_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pterm1_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pterm2_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\~GND~1_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\~GND~1_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst12~0bal_pterm0_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst12~0bal_pterm1_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \APP1_OPN_EN_NOT~dataout\ & \RST_OUT_NOT~dataout\ & \MPC_RESET_NOT~dataout\ & \I_AM_HEALTHY~dataout\);

\HealthyLogic_inst|inst12~0bal_pterm2_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc
& vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & NOT \APP2_OPN_EN_NOT~dataout\ & \RST_OUT_NOT~dataout\ & \MPC_RESET_NOT~dataout\ & \I_AM_HEALTHY~dataout\);

\HealthyLogic_inst|inst12~0bal_pterm3_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst12~0bal_pterm4_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst12~0bal_pterm5_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst12~0bal_pxor_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst12~0bal_pclk_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst12~0bal_pena_bus\ <= (vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & 
vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\HealthyLogic_inst|inst12~0bal_paclr_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\HealthyLogic_inst|inst12~0bal_papre_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);
\HealthyLogic_inst|ALT_INV_inst4~dataout\ <= NOT \HealthyLogic_inst|inst4~dataout\;
\ALT_INV_APP1_OPN_EN_NOT~dataout\ <= NOT \APP1_OPN_EN_NOT~dataout\;
\ALT_INV_APP2_OPN_EN_NOT~dataout\ <= NOT \APP2_OPN_EN_NOT~dataout\;
\ALT_INV_PEER_IN_CONTROL~dataout\ <= NOT \PEER_IN_CONTROL~dataout\;
\ALT_INV_PLD_SPARE1~dataout\ <= NOT \PLD_SPARE1~dataout\;

-- Location: LC46
\~GND~0\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \~GND~0_pterm0_bus\,
	pterm1 => \~GND~0_pterm1_bus\,
	pterm2 => \~GND~0_pterm2_bus\,
	pterm3 => \~GND~0_pterm3_bus\,
	pterm4 => \~GND~0_pterm4_bus\,
	pterm5 => \~GND~0_pterm5_bus\,
	pxor => \~GND~0_pxor_bus\,
	pclk => \~GND~0_pclk_bus\,
	papre => \~GND~0_papre_bus\,
	paclr => \~GND~0_paclr_bus\,
	pena => \~GND~0_pena_bus\,
	dataout => \~GND~0~dataout\);

-- Location: LC37
\~GND~1\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \~GND~1_pterm0_bus\,
	pterm1 => \~GND~1_pterm1_bus\,
	pterm2 => \~GND~1_pterm2_bus\,
	pterm3 => \~GND~1_pterm3_bus\,
	pterm4 => \~GND~1_pterm4_bus\,
	pterm5 => \~GND~1_pterm5_bus\,
	pxor => \~GND~1_pxor_bus\,
	pclk => \~GND~1_pclk_bus\,
	papre => \~GND~1_papre_bus\,
	paclr => \~GND~1_paclr_bus\,
	pena => \~GND~1_pena_bus\,
	dataout => \~GND~1~dataout\);

-- Location: PIN_6
\TAKE_CONTROL~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_TAKE_CONTROL,
	dataout => \TAKE_CONTROL~dataout\);

-- Location: PIN_44
\I_AM_HEALTHY~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_I_AM_HEALTHY,
	dataout => \I_AM_HEALTHY~dataout\);

-- Location: PIN_42
\MPC_RESET_NOT~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_MPC_RESET_NOT,
	dataout => \MPC_RESET_NOT~dataout\);

-- Location: PIN_39
\RST_OUT_NOT~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_RST_OUT_NOT,
	dataout => \RST_OUT_NOT~dataout\);

-- Location: PIN_3
\APP1_OPN_EN_NOT~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_APP1_OPN_EN_NOT,
	dataout => \APP1_OPN_EN_NOT~dataout\);

-- Location: PIN_5
\APP2_OPN_EN_NOT~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_APP2_OPN_EN_NOT,
	dataout => \APP2_OPN_EN_NOT~dataout\);

-- Location: LC5
\HealthyLogic_inst|inst12~0bal\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \HealthyLogic_inst|inst12~0bal_pterm0_bus\,
	pterm1 => \HealthyLogic_inst|inst12~0bal_pterm1_bus\,
	pterm2 => \HealthyLogic_inst|inst12~0bal_pterm2_bus\,
	pterm3 => \HealthyLogic_inst|inst12~0bal_pterm3_bus\,
	pterm4 => \HealthyLogic_inst|inst12~0bal_pterm4_bus\,
	pterm5 => \HealthyLogic_inst|inst12~0bal_pterm5_bus\,
	pxor => \HealthyLogic_inst|inst12~0bal_pxor_bus\,
	pclk => \HealthyLogic_inst|inst12~0bal_pclk_bus\,
	papre => \HealthyLogic_inst|inst12~0bal_papre_bus\,
	paclr => \HealthyLogic_inst|inst12~0bal_paclr_bus\,
	pena => \HealthyLogic_inst|inst12~0bal_pena_bus\,
	dataout => \HealthyLogic_inst|inst12~0bal_dataout\);

-- Location: LC49
\HealthyLogic_inst|inst\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	pterm0 => \HealthyLogic_inst|inst_pterm0_bus\,
	pterm1 => \HealthyLogic_inst|inst_pterm1_bus\,
	pterm2 => \HealthyLogic_inst|inst_pterm2_bus\,
	pterm3 => \HealthyLogic_inst|inst_pterm3_bus\,
	pterm4 => \HealthyLogic_inst|inst_pterm4_bus\,
	pterm5 => \HealthyLogic_inst|inst_pterm5_bus\,
	pxor => \HealthyLogic_inst|inst_pxor_bus\,
	pclk => \HealthyLogic_inst|inst_pclk_bus\,
	papre => \HealthyLogic_inst|inst_papre_bus\,
	paclr => \HealthyLogic_inst|inst_paclr_bus\,
	pena => \HealthyLogic_inst|inst_pena_bus\,
	dataout => \HealthyLogic_inst|inst~dataout\);

-- Location: PIN_35
\PEER_IN_CONTROL~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_PEER_IN_CONTROL,
	dataout => \PEER_IN_CONTROL~dataout\);

-- Location: PIN_18
\PLD_SPARE1~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_PLD_SPARE1,
	dataout => \PLD_SPARE1~dataout\);

-- Location: LC40
\HealthyLogic_inst|inst4\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "invert",
	output_mode => "reg",
	pexp_mode => "off",
	power_up => "low",
	register_mode => "dff")
-- pragma translate_on
PORT MAP (
	pterm0 => \HealthyLogic_inst|inst4_pterm0_bus\,
	pterm1 => \HealthyLogic_inst|inst4_pterm1_bus\,
	pterm2 => \HealthyLogic_inst|inst4_pterm2_bus\,
	pterm3 => \HealthyLogic_inst|inst4_pterm3_bus\,
	pterm4 => \HealthyLogic_inst|inst4_pterm4_bus\,
	pterm5 => \HealthyLogic_inst|inst4_pterm5_bus\,
	pxor => \HealthyLogic_inst|inst4_pxor_bus\,
	pclk => \HealthyLogic_inst|inst4_pclk_bus\,
	papre => \HealthyLogic_inst|inst4_papre_bus\,
	paclr => \HealthyLogic_inst|inst4_paclr_bus\,
	pena => \HealthyLogic_inst|inst4_pena_bus\,
	dataout => \HealthyLogic_inst|inst4~dataout\);

-- Location: LC41
\HealthyLogic_inst|inst23~1\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \HealthyLogic_inst|inst23~1_pterm0_bus\,
	pterm1 => \HealthyLogic_inst|inst23~1_pterm1_bus\,
	pterm2 => \HealthyLogic_inst|inst23~1_pterm2_bus\,
	pterm3 => \HealthyLogic_inst|inst23~1_pterm3_bus\,
	pterm4 => \HealthyLogic_inst|inst23~1_pterm4_bus\,
	pterm5 => \HealthyLogic_inst|inst23~1_pterm5_bus\,
	pxor => \HealthyLogic_inst|inst23~1_pxor_bus\,
	pclk => \HealthyLogic_inst|inst23~1_pclk_bus\,
	papre => \HealthyLogic_inst|inst23~1_papre_bus\,
	paclr => \HealthyLogic_inst|inst23~1_paclr_bus\,
	pena => \HealthyLogic_inst|inst23~1_pena_bus\,
	dataout => \HealthyLogic_inst|inst23~1_dataout\);

-- Location: LC36
\HealthyLogic_inst|inst24~1\ : max_mcell
-- pragma translate_off
GENERIC MAP (
	operation_mode => "normal",
	output_mode => "comb",
	pexp_mode => "off")
-- pragma translate_on
PORT MAP (
	pterm0 => \HealthyLogic_inst|inst24~1_pterm0_bus\,
	pterm1 => \HealthyLogic_inst|inst24~1_pterm1_bus\,
	pterm2 => \HealthyLogic_inst|inst24~1_pterm2_bus\,
	pterm3 => \HealthyLogic_inst|inst24~1_pterm3_bus\,
	pterm4 => \HealthyLogic_inst|inst24~1_pterm4_bus\,
	pterm5 => \HealthyLogic_inst|inst24~1_pterm5_bus\,
	pxor => \HealthyLogic_inst|inst24~1_pxor_bus\,
	pclk => \HealthyLogic_inst|inst24~1_pclk_bus\,
	papre => \HealthyLogic_inst|inst24~1_papre_bus\,
	paclr => \HealthyLogic_inst|inst24~1_paclr_bus\,
	pena => \HealthyLogic_inst|inst24~1_pena_bus\,
	dataout => \HealthyLogic_inst|inst24~1_dataout\);

-- Location: PIN_40
\MPC_CLK_OUT~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_MPC_CLK_OUT);

-- Location: PIN_37
\MPC_ENG_CLK~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_MPC_ENG_CLK);

-- Location: PIN_8
\ESC1_WDI_CPLD~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ESC1_WDI_CPLD);

-- Location: PIN_10
\ESC2_WDI_CPLD~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ESC2_WDI_CPLD);

-- Location: PIN_12
\ESC1_GPIO~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ESC1_GPIO);

-- Location: PIN_13
\ESC2_GPIO~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ESC2_GPIO);

-- Location: PIN_14
\IOP_TO_IOP_SRH1~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_IOP_TO_IOP_SRH1);

-- Location: PIN_15
\IOP_TO_IOP_SRH2~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_IOP_TO_IOP_SRH2);

-- Location: PIN_33
\IOP_TO_IOP_SRH3~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_IOP_TO_IOP_SRH3);

-- Location: PIN_31
\IOP_TO_IOP_SRH4~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_IOP_TO_IOP_SRH4);

-- Location: PIN_34
\IN_CONTROL~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_IN_CONTROL);

-- Location: PIN_25
\HEALTHY_INV~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \~GND~0~dataout\,
	oe => VCC,
	padio => ww_HEALTHY_INV);

-- Location: PIN_21
\CONTROL_INV~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \~GND~1~dataout\,
	oe => VCC,
	padio => ww_CONTROL_INV);

-- Location: PIN_19
\PLD_SPARE2~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "input",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_PLD_SPARE2);

-- Location: PIN_27
\HEALTHY~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \HealthyLogic_inst|inst~dataout\,
	oe => VCC,
	padio => ww_HEALTHY);

-- Location: PIN_22
\CONTROL~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \HealthyLogic_inst|inst4~dataout\,
	oe => VCC,
	padio => ww_CONTROL);

-- Location: PIN_23
\READY_LED~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \HealthyLogic_inst|inst23~1_dataout\,
	oe => VCC,
	padio => ww_READY_LED);

-- Location: PIN_20
\ACTIVE_LED~I\ : max_io
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	operation_mode => "output",
	weak_pull_up => "false")
-- pragma translate_on
PORT MAP (
	datain => \HealthyLogic_inst|inst24~1_dataout\,
	oe => VCC,
	padio => ww_ACTIVE_LED);
END structure;


