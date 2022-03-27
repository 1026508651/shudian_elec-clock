library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity do_count_10 is
	port(
		EN:in std_logic;
		CLK:in std_logic;
		output:out std_logic
		);
end do_count_10;		
		
architecture main of do_count_10 is
	signal counter: std_logic_vector(2 downto 0);
	signal temp:std_logic;
begin
	process(CLK,EN)
	begin
	if(EN='0')then
		temp<='0';
	elsif(CLK'event and CLK='1')then
		if(counter="100")then
			counter<="000";
			temp<=not temp;
		else
			counter<=counter+1;
		end if;
	end if;
	end process;
	output<=temp;
end main;			
	
