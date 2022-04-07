library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity count_2500 is 
port(
	CLK_0:in std_logic;
	Change_En: in std_logic;
	CLK_1: out std_logic
);
end count_2500;

architecture art of count_2500 is
	signal temp:integer range 0 to 2499;
	signal qout: std_logic;
begin	
	process(CLK_0)
	begin
		if(CLK_0'event and CLK_0='1')then
			if(temp=1)then
				temp<=0;
				qout<=not qout;
			else
				temp<=temp+1;
			end if;
		end if;
	end process;
	
	with Change_En select
	CLK_1<= '0' when '1',
			qout when others;
end art;
