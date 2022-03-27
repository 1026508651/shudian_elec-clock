library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity two2four is
	port(
		EN: in std_logic;
		input: in std_logic_vector(1 downto 0);
		output: out std_logic_vector(3 downto 0)
	);
end two2four;

architecture art of two2four is
	signal temp : std_logic_vector(3 downto 0);
begin
		with input select
			temp<=	"1110"when"00",
					"1101"when"01",
					"1011"when"10",
					"0111"when"11";
	process(EN)
	begin
		if(EN='1')then
			output<=temp;
		else
			output<="0000";
		end if;
	end process;
end art;