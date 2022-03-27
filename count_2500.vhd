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
			if(temp=5)then
				temp<=0;
			else
				temp<=temp+1;
			end if;
		end if;
	end process;
	
	process(temp,CLK_0)
	begin
		if(CLK_0'event and CLK_0='1')then
			if(temp=5)then
				qout<='1';
			else
				qout<='0';
			end if;
		end if;
	end process;
	process(Change_En)
	begin
		if(Change_En='1')then
			CLK_1<='0';
		else
			CLK_1<=qout;
		end if;
	end process;
end art;
