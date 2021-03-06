library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity config is
	port(	
	STD_ONE: in std_logic;
	Button1: in std_logic;
	Button2: in std_logic;
	Change_En: out std_logic;
	Change_Sec: out std_logic;
	Change_Min: out std_logic;
	Change_Hour: out std_logic;
	Blick_Control_Sec: out std_logic;
	Blick_Control_Min: out std_logic;
	Blick_Control_Hou: out std_logic);
end config;

architecture main of config is
	component count_4 is
	port(
		CLK:in std_logic;
		output:out std_logic_vector(1 downto 0);
		Change_En:out std_logic
	);
	end component count_4;
	component two2four is
	port(
		EN: in std_logic;
		input: in std_logic_vector(1 downto 0);
		output: out std_logic_vector(3 downto 0)
	);
	end component two2four;
	signal trans:std_logic_vector(1 downto 0);
	signal diverse1:std_logic_vector(3 downto 0);
	signal diverse2:std_logic_vector(3 downto 0);
	begin
	T1:count_4 port map(CLK=>Button1,output=>trans, Change_En=>Change_En);
	T2:two2four port map(EN=>Button2,input=>trans, output=>diverse1);
	T3:two2four port map(EN=>STD_ONE,input=>trans, output=>diverse2);
	Change_Sec<=diverse1(1);
	Change_Min<=diverse1(2);
	Change_Hour<=diverse1(3);
	Blick_Control_Sec<=not diverse2(1);
	Blick_Control_Min<=not diverse2(2);
	Blick_Control_Hou<=not diverse2(3);
end main;