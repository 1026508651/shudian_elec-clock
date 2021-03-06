library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity count_24 is
port(
		CLK:in std_logic;
		CLR:in std_logic;
		temp1: out std_logic_vector(3 downto 0);
		temp10:out std_logic_vector(3 downto 0)
	);
end count_24;

architecture main of count_24 is
begin
	process(CLR,CLK)
		variable cnt0,cnt1:std_logic_vector(3 downto 0);
	begin
		if(CLR='1')then
		cnt0:="0000";
		cnt1:="0000";
		elsif(CLK'event and CLK='1')then
			if(cnt1="0010" and cnt0="0011")then
			cnt0:="0000";
			cnt1:="0000";
			elsif(cnt0<"1001")then
			cnt0:=cnt0+1;
			else
			cnt1:=cnt1+1;
			cnt0:="0000";
			end if;
		end if;	
	temp1<=cnt0;
	temp10<=cnt1;
	end process;
end main;		
		