library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity hour_count is 
port(
	CLR: in std_logic;
	Cout2:in std_logic;
	Change_Hour: in std_logic;
	Blick_Control_Hou: in std_logic;
	LED_5: out std_logic_vector(3 downto 0);
	LED_6: out std_logic_vector(6 downto 0)
);
end hour_count;

architecture main of hour_count is
signal enter: std_logic;
signal L5:std_logic_vector(3 downto 0);
signal L6_1:std_logic_vector(3 downto 0);
signal L6:std_logic_vector(6 downto 0);
component count_24 is
	port(
		CLK:in std_logic;
		CLR:in std_logic;
		temp1: out std_logic_vector(3 downto 0);
		temp10:out std_logic_vector(3 downto 0)
	);
end component count_24;
component four2seven is
	port(
		input:in std_logic_vector(3 downto 0);
		output:out std_logic_vector(6 downto 0)
	);
end component four2seven;
begin
	enter<=Change_Hour or Cout2;
	T1:count_24 port map(CLK=>enter,CLR=>CLR,temp1=>L5,temp10=>L6_1);
	T2:four2seven port map(input=>L6_1,output=>L6);
	with Blick_Control_Hou select
	LED_5<="ZZZZ" when '1',
		   L5 when others;
	with Blick_Control_Hou select
	LED_6<="ZZZZZZZ" when '1',
		   L6 when others;
end main;