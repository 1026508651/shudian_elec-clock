library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity elec_clock is
	port(
	 CLK_0:in std_logic;
	 CLR:in std_logic;
	 Button1: in std_logic;
	 Button2: in std_logic;
	 LED_1: out std_logic_vector(3 downto 0);
	 LED_2: out std_logic_vector(3 downto 0);
	 LED_3: out std_logic_vector(3 downto 0);
	 LED_4: out std_logic_vector(3 downto 0);
	 LED_5: out std_logic_vector(3 downto 0);
	 LED_6: out std_logic_vector(6 downto 0);
	 MUSIC: out std_logic
	);
end elec_clock;
architecture main of elec_clock is
component time_trans is 
port(
	CLK_0:in std_logic;
	Change_En: in std_logic;
	Change_Sec: in std_logic;
	CLK_1: out std_logic;
	STD_ONE: out std_logic
);
end component time_trans;
component sec_count is 
port(
	CLK_1:in std_logic;
	CLR: in std_logic;
	Blick_Control_Sec: in std_logic;
	
	LED_1: out std_logic_vector(3 downto 0);
	LED_2: out std_logic_vector(3 downto 0);
	Cout1: out std_logic;
	Cout3:out std_logic
);
end component sec_count;
component minute_count is 
port(
	Cout1:in std_logic;
	CLR: in std_logic;
	Change_Min: in std_logic;
	Blick_Control_Min: in std_logic;
	LED_3: out std_logic_vector(3 downto 0);
	LED_4: out std_logic_vector(3 downto 0);
	Cout2: out std_logic;
	Cout4:out std_logic
	
);
end component minute_count;
component hour_count is 
port(
	CLR: in std_logic;
	Cout2:in std_logic;
	Change_Hour: in std_logic;
	Blick_Control_Hou: in std_logic;
	LED_5: out std_logic_vector(3 downto 0);
	LED_6: out std_logic_vector(6 downto 0)
);
end component hour_count;
component config is
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
	Blick_Control_Hou: out std_logic
);
end component config;
component musicins is
port(
	STD_ONE: in std_logic;
	Cout3:in std_logic;
	CLK_0: in std_logic;
	MUSIC:out std_logic;
	ct:in std_logic
);
end component musicins;
signal Change_En: std_logic;
signal Change_Sec: std_logic;
signal CLK_1: std_logic;
signal STD_ONE: std_logic;
signal Blick_Control_Sec: std_logic;
signal Cout1: std_logic;
signal Change_Min: std_logic;
signal Blick_Control_Min:std_logic;
signal Cout2: std_logic;
signal Cout3:std_logic;
signal Cout4:std_logic;
signal Change_Hour: std_logic;
signal Blick_Control_Hou:std_logic;
begin
	T1:time_trans port map(CLK_0=>CLK_0,Change_En=>Change_En,Change_Sec=>Change_Sec,CLK_1=>CLK_1,STD_ONE=>STD_ONE);
	T2:sec_count port map(CLK_1=>CLK_1,CLR=>CLR,Blick_Control_Sec=>Blick_Control_Sec,LED_1=>LED_1,LED_2=>LED_2,Cout1=>Cout1,Cout3=>Cout3);
	T3:minute_count port map(Cout1=>Cout1,CLR=>CLR,Change_Min=>Change_Min,Blick_Control_Min=>Blick_Control_Min,LED_3=>LED_3,LED_4=>LED_4,Cout2=>Cout2,Cout4=>Cout4);
	T4:hour_count port map(CLR=>CLR,Cout2=>Cout2,Change_Hour=>Change_Hour,Blick_Control_Hou=>Blick_Control_Hou,LED_5=>LED_5,LED_6=>LED_6);
	T5:config port map(STD_ONE=>STD_ONE,Button1=>Button1,Button2=>Button2,Change_En=>Change_En,Change_Sec=>Change_Sec,Change_Min=>Change_Min,Change_Hour=>Change_Hour,Blick_Control_Sec=>Blick_Control_Sec,Blick_Control_Min=>Blick_Control_Min,Blick_Control_Hou=>Blick_Control_Hou);
	T6:musicins port map(STD_ONE=>STD_ONE,Cout3=>Cout2,CLK_0=>CLK_0,MUSIC=>MUSIC,ct=>Cout3 and Cout4);
end main;