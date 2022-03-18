library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity sec_count is 
port(
	CLK_1:in std_logic;
	CLR: in std_logic;
	Blick_Control_Sec: in std_logic;
	
	LED_1: out std_logic_vector(3 downto 0);
	LED_2: out std_logic_vector(3 downto 0);
	Cout1: out std_logic
);
end sec_count;
architecture main of sec_count is
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
	
	signal C1: std_logic;
	signal L1: std_logic_vector(3 downto 0);
	signal L2: std_logic_vector(3 downto 0);
	begin
	T1:count_10 port map(CLK=>CLK_1,CLR=>CLR,Lout=>L1,Cout1=>C1);
	T2:count_6 port map(CLK=>C1,CLR=>CLR,Lout=>L2,Cout1=>Cout1);
	with Blick_Control_Sec select
	LED_1<="ZZZZ" when '1',
		   L1 when others;
	with Blick_Control_Sec select
	LED_2<="ZZZZ" when '1',
		   L2 when others;
end main;