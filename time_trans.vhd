library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity time_trans is 
port(
	CLK_0:in std_logic;
	Change_En: in std_logic;
	Change_Sec: in std_logic;
	CLK_1: out std_logic;
	STD_ONE: out std_logic
);
end time_trans;

architecture main of time_trans is
component count_2500 is 
port(
	CLK_0:in std_logic;
	Change_En: in std_logic;
	CLK_1: out std_logic
);
end component count_2500;
signal output1: std_logic;
signal output0: std_logic;
begin
	
	T1:count_2500 port map(CLK_0=>CLK_0,Change_En=>Change_En,CLK_1=>output0);
	output1<=output0 or Change_Sec;
	CLK_1<=output1;
	STD_ONE<=output0;
end main;