library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity la_count_6 is
	port(
		EN:in std_logic;
		CLK:in std_logic;
		output:out std_logic
		);
end la_count_6;
		
architecture main of la_count_6 is
	signal counter: std_logic_vector(1 downto 0);
	signal temp:std_logic;
begin
	process(CLK,EN)
	begin
	if(EN='0')then
		temp<='0';
	elsif(CLK'event and CLK='1')then
		if(counter="10")then
			counter<="00";
			temp<=not temp;
		else
			counter<=counter+1;
		end if;
	end if;
	end process;
	output<=temp;
end main;			
	