library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity count_4 is
	port(
		CLK:in std_logic;
		output:out std_logic_vector(1 downto 0);
		Change_En:out std_logic
	);
	end count_4;

architecture art of count_4 is
	signal temp : std_logic_vector(1 downto 0);
begin
	process(CLK)
	begin
		if(CLK'event and CLK='1')then
			if(temp="11")then
				temp<="00";
			else
				temp<=temp+1;
			end if;
			
		end if;
	end process;
	with temp select
	Change_En<='0' when "00",
			   '1' when others;
	output<=temp;
end art;
