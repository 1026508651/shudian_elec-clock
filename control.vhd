library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
		
entity control is
port(
	beginning:in std_logic;
	part:in std_logic;
	do_1:out std_logic;
	fa_4:out std_logic;
	la_6:out std_logic
	);
end control;

architecture main of control is
	signal counter:std_logic_vector(3 downto 0);
	signal stop : std_logic;
begin
	process(beginning)
	begin
		if(beginning='1')then
			stop <='1';
			counter<="0000";
		end if;
	end process;
	
	
	process(stop,part)
	begin
	if(part'event and part='1')then
		if(counter="1001")then
			counter<="0000";
			stop<='0';
		else
			counter<=counter+1;
		end if;	
	end if;
	end process;
	
	process(counter)
	begin
		do_1<='0';
		fa_4<='0';
		la_6<='0';
		case counter is
			when "0000" => la_6 <='1';
			when "0001" => fa_4 <='1'; 
			when "0010" => la_6 <='1';
			when "0011" => do_1 <='1';
			when "0100" => do_1 <='1';
			when "0101" => fa_4 <='1'; 
			when "0110" => la_6 <='1';
			when "0111" => fa_4 <='1'; 
			when "1000" => fa_4 <='1'; 
			when "1001" => fa_4 <='1'; 
			when others => stop <='0';
		end case;
	end process;		


end;
