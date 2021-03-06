library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity fa_count_7 is
	port(
		EN:in std_logic;
		CLK:in std_logic;
		output:out std_logic
		);
end fa_count_7;		
		
architecture main of fa_count_7 is
	signal counter: std_logic_vector(2 downto 0);
	signal temp1,temp2:std_logic;
begin
	process(CLK,EN)
	begin
	if(EN='0')then
		temp1<='0';
	elsif(CLK'event and CLK='1')then
		if(counter="000")then
			counter<="110";
			temp1<=not temp1; 
		else
			counter<=counter-1;
		end if;
	end if;
	end process;
	
	process(CLK,EN)
	begin
	if(EN='0')then
		temp2<='0';
	elsif(CLK'event and CLK='0')then
		if(counter="011")then
			temp2<=not temp2;
		else
			temp2<=temp2;
		end if;
	end if;
	end process;
	
	output<=temp1 xor temp2;
end main;	