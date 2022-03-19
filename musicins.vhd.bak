library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity musicins is
port(
	STD_ONE: in std_logic;
	Cout3:in std_logic;
	CLK_0: in std_logic;
	MUSIC:out std_logic
);
end musicins;

architecture main of musicins is 
	component control is
		port(
			beginning:in std_logic;
			part:in std_logic;
			do_1:out std_logic;
			fa_4:out std_logic;
			la_6:out std_logic
		);
	end component control;
	component do_count_10 is
		port(
			EN:in std_logic;
			CLK:in std_logic;
			output:out std_logic
		);
	end component do_count_10;
	component fa_count_7 is
		port(
			EN:in std_logic;
			CLK:in std_logic;
			output:out std_logic
		);
	end component fa_count_7;
	component la_count_6 is
		port(
			EN:in std_logic;
			CLK:in std_logic;
			output:out std_logic
		);
	end component la_count_6;
	signal en_do:std_logic;
	signal en_fa:std_logic;
	signal en_la:std_logic;
	signal out_do:std_logic;
	signal out_fa:std_logic;
	signal out_la:std_logic;
	begin
	 T1:control port map(beginning=>Cout3,part=>STD_ONE,do_1=>en_do,fa_4=>en_fa,la_6=>en_la);
	 T2:do_count_10 port map(EN=>en_do,CLK=>CLK_0,output=>out_do);
	 T3:fa_count_7 port map(EN=>en_do,CLK=>CLK_0,output=>out_fa); 
	 T4:la_count_6 port map(EN=>en_do,CLK=>CLK_0,output=>out_la);
	 MUSIC<=out_do or out_fa or out_la; 
end main;