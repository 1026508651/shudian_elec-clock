library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity min_count_10 is
 port(
  CLK:in std_logic;
  CLR: in std_logic;
  Lout: out std_logic_vector(3 downto 0);
  Cout1: out std_logic
 );
end min_count_10;

architecture art_10 of min_count_10 is
signal temp:std_logic_vector(3 downto 0);
begin
 process(CLK,CLR)
 begin
  if(CLR='1')then
   temp<="0000";
  elsif(CLK'event and CLk='1')then
   if(temp="1001")then
    temp<="0000";
    Cout1<='1';
   else 
    temp<=temp+1;
    Cout1<='0';
   end if;
  end if;
 end process;
Lout<=temp;

end art_10;