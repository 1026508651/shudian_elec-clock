library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity minute_count is 
port(
	Cout1:in std_logic;
	CLR: in std_logic;
	Change_Min: in std_logic;
	Blick_Control_Min: in std_logic;
	LED_3: out std_logic_vector(3 downto 0);
	LED_4: out std_logic_vector(3 downto 0);
	Cout2: out std_logic;
	Cout4: out std_logic
);
end minute_count;
architecture main of minute_count is
	component count_10 is 
	port(
		CLK:in std_logic;
		CLR: in std_logic;
		Lout: out std_logic_vector(3 downto 0);
		Cout1: out std_logic
	);
	end component count_10;
	component count_6 is 
	port(
		CLK:in std_logic;
		CLR: in std_logic;
		Lout: out std_logic_vector(3 downto 0);
		Cout1: out std_logic
	);
	end component count_6;
	signal enter: std_logic;
	signal C1: std_logic;
	signal L1: std_logic_vector(3 downto 0);
	signal L2: std_logic_vector(3 downto 0);
begin
	Cout4<='1' when (L1="0000" and L2="0000") else
		   '0';
	enter<=Cout1 or Change_Min;
	T1:count_10 port map(CLK=>enter,CLR=>CLR,Lout=>L1,Cout1=>C1);
	T2:count_6 port map(CLK=>C1,CLR=>CLR,Lout=>L2,Cout1=>Cout2);
	with Blick_Control_Min select
	LED_3<="ZZZZ" when '0',
		   L1 when others;
	with Blick_Control_Min select
	LED_4<="ZZZZ" when '0',
		   L2 when others;
end main;